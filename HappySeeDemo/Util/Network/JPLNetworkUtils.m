//
//  JPLNetworkUtils.m
//  HappySeeDemo
//
//  Created by 宋江 on 2020/5/12.
//  Copyright © 2020 宋江. All rights reserved.
//

#import "JPLNetworkUtils.h"

@implementation AFHTTPManager
+ (AFHTTPSessionManager *)shareManager {
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
    });
    return manager;
}
@end

@implementation JPLNetworkUtils


/**
 发起Post请求
 @param url 接口名
 @param params 参数字典
 @param prepareBlock  准备block （请求前）
 @param successBlock  请求成功回调
 @param failureBlock  请求失败回调
 @param finishBlock   请求完成回调
 */
+ (void)POSTWithUrl:(NSString *)url params:(NSDictionary *)params prepare:(PrepareBlock)prepareBlock success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock finish:(FinishBlock)finishBlock{
//    AFHTTPSessionManager *manager = [AFHTTPManager shareManager];
//
//    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        
//    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];

    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"multipart/form-data", @"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json", nil];
//    [manager.requestSerializer setValue:@"APP" forHTTPHeaderField:@"X-Client-Type"];

    [manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        JPLBaseResponseModel *baseResponse = [JPLBaseResponseModel mj_objectWithKeyValues:responseObject];
        if (finishBlock) {
            finishBlock();
        }
        if (successBlock) {
            successBlock(responseObject,baseResponse);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (finishBlock) {
            finishBlock();
        }
        if (failureBlock) {
            failureBlock(error);
        }
    }];
    
}

@end
