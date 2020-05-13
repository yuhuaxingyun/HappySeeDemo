//
//  JPLListService.m
//  HappySeeDemo
//
//  Created by 宋江 on 2020/5/13.
//  Copyright © 2020 宋江. All rights reserved.
//

#import "JPLListService.h"

#define List_Url @"http://devmobile.zhuawawa.site/neckpets/getBlindBoxSeriesLitByTabType.json"

@implementation JPLListService

+ (void)getListDataWithParmas:(NSDictionary *)parmas success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock{
    HttpPostForm *request = [[HttpPostForm alloc]initWithUrl:List_Url];
    // 添加 user-agent
    [request addHeader:@"User-Agent" value:@"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36"];
    // 添加 请求参数
    for (NSString *key in parmas) {
        [request addFormField:key value:[parmas objectForKey:key]];
    }
    
    void (^completionHandler)(NSData *, NSURLResponse *, NSError *) = ^(NSData *data, NSURLResponse *response, NSError *error) {
        if (data == nil || data.length == 0 || response == nil || [(NSHTTPURLResponse *)response statusCode] != 200) {
            if (failureBlock) {
                failureBlock(error);
            }
            return;
        }else{
//        NSLog(@"success: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        if (successBlock) {
            successBlock(response,dict);
        }
        NSLog(@"%@",dict);
        }
    };
    [request finish:completionHandler];
}
@end
