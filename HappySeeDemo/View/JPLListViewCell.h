//
//  JPLListViewCell.h
//  HappySeeDemo
//
//  Created by 宋江 on 2020/5/12.
//  Copyright © 2020 宋江. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JPLBaseCollectionCell.h"
#import "JPLListModel.h"

@interface JPLListViewCell : JPLBaseCollectionCell
@property (nonatomic,strong) JPLDataModel *dataModel;

@end


