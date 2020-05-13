//
//  JPLListModel.h
//  HappySeeDemo
//
//  Created by 宋江 on 2020/5/13.
//  Copyright © 2020 宋江. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol JPLDataModel//注意要加上这句
@end

@interface JPLListModel : JSONModel
@property (nonatomic,strong) NSNumber *total;
@property(nonatomic,copy)NSArray <JPLDataModel> * data;
@property (nonatomic,copy) NSString *resultCode;
@property (nonatomic,copy) NSString *resultDesc;
@property (nonatomic,copy) NSString *returnCode;
@property (nonatomic,copy) NSString *resultView;
@property (nonatomic,strong) NSNumber *success;
@end

@interface JPLDataModel : JSONModel
@property (nonatomic,copy) NSString *image;
@property (nonatomic,strong) NSNumber *price;
@property (nonatomic,strong) NSNumber *presell;
@property (nonatomic,strong) NSNumber *candyToy;
@property (nonatomic,strong) NSNumber *bookingDate;
@property (nonatomic,copy) NSString *seriesCode;
@property (nonatomic,copy) NSString *detailsImg;
@property (nonatomic,strong) NSNumber *styleCount;
@property (nonatomic,strong) NSNumber *currentBoughtCount;
@property (nonatomic,copy) NSString *rowImage;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *detial;
@end



