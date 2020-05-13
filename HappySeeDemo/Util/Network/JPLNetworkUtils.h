//
//  JPLNetworkUtils.h
//  HappySeeDemo
//
//  Created by 宋江 on 2020/5/12.
//  Copyright © 2020 宋江. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "JPLBaseResponseModel.h"

typedef void (^PrepareBlock)(void);
typedef void (^SuccessBlock)(id response,JPLBaseResponseModel *baseResponse); //response 请求得到的数据
typedef void (^FailureBlock)(NSError *error);
typedef void (^FinishBlock)(void);

@interface AFHTTPManager : AFHTTPSessionManager
+ (AFHTTPSessionManager *)shareManager;
@end

@interface JPLNetworkUtils : NSObject
+ (void)POSTWithUrl:(NSString *)url params:(NSDictionary *)params prepare:(PrepareBlock)prepareBlock success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock finish:(FinishBlock)finishBlock;
@end

