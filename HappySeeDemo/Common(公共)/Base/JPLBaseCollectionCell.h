//
//  JPLBaseCollectionCell.h
//  HappySeeDemo
//
//  Created by 宋江 on 2020/5/12.
//  Copyright © 2020 宋江. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JPLBaseCollectionCell : UICollectionViewCell

@property (nonatomic,strong) id data;
- (void)initData;
- (void)initView;
+ (CGFloat)calCellWidth;
+ (CGFloat)calCellHeight;
+ (CGFloat)minimumInteritemSpacing; // 竖间距 水平间隔
+ (CGFloat)minimumLineSpacing; // 行间距 垂直间隔

@end

