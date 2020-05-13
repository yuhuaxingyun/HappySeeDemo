//
//  JPLBaseCollectionCell.m
//  HappySeeDemo
//
//  Created by 宋江 on 2020/5/12.
//  Copyright © 2020 宋江. All rights reserved.
//

#import "JPLBaseCollectionCell.h"

@implementation JPLBaseCollectionCell
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initData];
        [self initView];
    }
    return self;
}

- (void)initData{
    
}

- (void)initView{
    
}

+ (CGFloat)calCellWidth{
    return 0;
}

+ (CGFloat)calCellHeight{
    return 0;
}

+ (CGFloat)minimumInteritemSpacing{
    return 0;
}

+ (CGFloat)minimumLineSpacing{
    return 0;
}

@end
