//
//  HttpPostForm.h
//  HappySeeDemo
//
//  Created by 宋江 on 2020/5/13.
//  Copyright © 2020 宋江. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface HttpPostForm:NSObject

- (id)initWithUrl:(NSString *)urlString;

@property(nonatomic) NSMutableURLRequest *request;
@property(nonatomic) NSString *urlString;
@property(nonatomic) NSMutableDictionary *headers;
@property(nonatomic) NSMutableDictionary *fields;

/// 添加请求头
/// @param key 请求头的名
/// @param value 请求头的值
-(void)addHeader:(NSString *)key value:(NSString *)value;

/// 添加参数字段
/// @param key 字段名称
/// @param value 值
-(void)addFormField:(NSString *)key value:(NSString *)value;

/// 完成请求
/// @param callback 回调块
- (void)finish:(void(^)(NSData *, NSURLResponse *, NSError *))callback;
@end

