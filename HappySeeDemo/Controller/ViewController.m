//
//  ViewController.m
//  HappySeeDemo
//
//  Created by 宋江 on 2020/5/12.
//  Copyright © 2020 宋江. All rights reserved.
//

#import "ViewController.h"
#import "JPLListService.h"
#import "JPLListViewCell.h"
#import "JPLListModel.h"

#define Page 10
#define CollectionView_Height (IS_IPHONE_X?(kScreenHeight- KSafeAreaTopHeight):(kScreenHeight- kStatusHeight))
#define CollectionView_Top (IS_IPHONE_X?KSafeAreaTopHeight:kStatusHeight)
#define kJPLListViewCell @"JPLListViewCell"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,assign) NSInteger page;
@property (nonatomic,assign) NSInteger total;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.page = 1;
    [self requestListData];
    [self initUI];
    //创建自定义下拉刷新
    [self refreshLoading];
}

- (void)refreshLoading{
    SPWeakSelf
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.page = 1;
        [weakSelf requestListData];
    }];
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        weakSelf.page ++;
        [weakSelf requestListData];
    }];
}
- (void)initUI{
    [self.view addSubview:self.collectionView];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count>0?self.dataSource.count:0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JPLListViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kJPLListViewCell forIndexPath:indexPath];
    cell.dataModel = self.dataSource[indexPath.item];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([JPLListViewCell calCellWidth], [JPLListViewCell calCellHeight]);
}

// 设置collectionView当前页距离四周的边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(Page, Page, 0, Page);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(kScreenWidth, kSafeAreaBottomHeight);
}

#pragma mark - 网路请求
- (void)requestListData{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"requestData"] = @{@"userToken":@"8ed7ddfde5ca37849b7c43591957d7fb73adc2a1",@"pageNumber":@(self.page)};
    [JPLListService getListDataWithParmas:params success:^(id response, NSDictionary *dict) {
        JPLListModel *listModel = [[JPLListModel alloc]initWithDictionary:dict error:nil];
        if (self.page == 1) {
            [self.dataSource removeAllObjects];
            self.dataSource = [NSMutableArray arrayWithArray:listModel.data];
            self.total = [listModel.total integerValue];
        }else{
            NSMutableArray *tempDataArray = [NSMutableArray arrayWithArray:listModel.data];
            if (tempDataArray.count != 0&tempDataArray.count <= self.total/self.page) {
                [self.dataSource addObjectsFromArray:listModel.data];
            }
        }
        [self.collectionView.mj_footer  endRefreshing];
        [self.collectionView.mj_header  endRefreshing];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
    } failure:^(NSError *error) {
        [self.collectionView.mj_header  endRefreshing];
        [self.collectionView.mj_footer  endRefreshing];
        NSLog(@"%@",error);
    }];
}

#pragma mark - getter
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        CGRect collectionFrame = CGRectMake(0, CollectionView_Top, kScreenWidth, CollectionView_Height);
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:collectionFrame collectionViewLayout:layout];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        collectionView.backgroundColor = [UIColor clearColor];
        collectionView.alwaysBounceVertical = YES;
        self.automaticallyAdjustsScrollViewInsets = NO;
        [collectionView registerClass:[JPLListViewCell class] forCellWithReuseIdentifier:kJPLListViewCell];
        _collectionView = collectionView;
        if (@available(iOS 11.0, *)) {
            _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _collectionView;
}

@end
