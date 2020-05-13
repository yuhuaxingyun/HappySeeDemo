//
//  JPLListModel.m
//  HappySeeDemo
//
//  Created by 宋江 on 2020/5/13.
//  Copyright © 2020 宋江. All rights reserved.
//

#import "JPLListModel.h"

@implementation JPLListModel
+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:nil];
}

+(BOOL)propertyIsOptional:(NSString*)propertyName{
  return YES;
}
@end

@implementation JPLDataModel
+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{@"detial":@"description"}];
}

+(BOOL)propertyIsOptional:(NSString*)propertyName{
  return YES;
}
@end
