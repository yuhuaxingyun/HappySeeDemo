//
//  JPLListViewCell.m
//  HappySeeDemo
//
//  Created by 宋江 on 2020/5/12.
//  Copyright © 2020 宋江. All rights reserved.
//

#import "JPLListViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define Page 10
#define Image_Width (kScreenWidth - Page*3)/2
#define Image_Height (kScreenWidth - Page*3)/2
#define TitleLabel_Height 20
#define DetialLabel_Height 20
#define PriceLabel_Height 20
#define Bottom_Height 20

@interface JPLListViewCell()
@property (strong,nonatomic) UIImageView *imageView;
@property (strong,nonatomic) UILabel *titleLabel;
@property (strong,nonatomic) UILabel *detialLabel;
@property (strong,nonatomic) UILabel *priceLabel;
@end

@implementation JPLListViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self) {
        self = [super initWithFrame:frame];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(0);
        make.left.equalTo(self).with.offset(Page);
        make.right.equalTo(self).with.offset(-Page);
        make.height.mas_equalTo(Image_Height);
    }];
    
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).with.offset(5);
        make.left.equalTo(self).with.offset(Page);
        make.right.equalTo(self).with.offset(-Page);
        make.height.mas_equalTo(TitleLabel_Height);
    }];
    
    [self addSubview:self.detialLabel];
    [self.detialLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(5);
        make.left.equalTo(self).with.offset(Page);
        make.height.mas_equalTo(DetialLabel_Height);

    }];
    
    [self addSubview:self.priceLabel];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(5);
        make.right.equalTo(self).with.offset(-Page);
        make.height.mas_equalTo(PriceLabel_Height);
    }];
}

#pragma mark - setter getter
- (void)setDataModel:(JPLDataModel *)dataModel{
    _dataModel = dataModel;
    self.titleLabel.text = dataModel.name;
    self.detialLabel.text = dataModel.detial;
    self.priceLabel.text = [NSString stringWithFormat:@"¥%@",dataModel.price];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:dataModel.image]];
}

- (UIImageView *)imageView{
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 10;
        _imageView = imageView;
    }
    return _imageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.font = [UIFont boldSystemFontOfSize:16];
        titleLabel.textColor = [UIColor blackColor];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

- (UILabel *)detialLabel{
    if (!_detialLabel) {
        UILabel *detialLabel = [[UILabel alloc]init];
        detialLabel.font = [UIFont boldSystemFontOfSize:14];
        detialLabel.textColor = [UIColor grayColor];
        _detialLabel = detialLabel;
    }
    return _detialLabel;
}

- (UILabel *)priceLabel{
    if (!_priceLabel) {
        UILabel *priceLabel = [[UILabel alloc]init];
        priceLabel.font = [UIFont boldSystemFontOfSize:20];
        priceLabel.textColor = [UIColor redColor];
        _priceLabel = priceLabel;
    }
    return _priceLabel;
}

+ (CGFloat)calCellWidth{
    return (kScreenWidth-Page*2)/2;
}
+ (CGFloat)calCellHeight{
    return (Image_Height + TitleLabel_Height + DetialLabel_Height + Bottom_Height);
}
@end
