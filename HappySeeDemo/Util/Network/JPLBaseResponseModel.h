//
//  JPLBaseResponseModel.h
//  HappySeeDemo
//
//  Created by 宋江 on 2020/5/12.
//  Copyright © 2020 宋江. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JPLBaseResponseModel : NSObject
/** 请求code **/
@property (nonatomic,assign) NSInteger code;
/** 数据 **/
@property (nonatomic,strong) id data;
/** 状态码 **/
@property (nonatomic,assign) BOOL success;
/** 提示信息 **/
@property (nonatomic,strong) NSString *message;
@end
