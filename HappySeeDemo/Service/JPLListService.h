//
//  JPLListService.h
//  HappySeeDemo
//
//  Created by 宋江 on 2020/5/13.
//  Copyright © 2020 宋江. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpPostForm.h"

typedef void (^SuccessBlock)(id response,NSDictionary *dict); //response 请求得到的数据
typedef void (^FailureBlock)(NSError *error);

@interface JPLListService : NSObject
+ (void)getListDataWithParmas:(NSDictionary *)parmas success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock;
@end

