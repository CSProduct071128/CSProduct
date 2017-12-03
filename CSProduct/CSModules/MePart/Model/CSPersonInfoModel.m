//
//  CSPersonInfoModel.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/3.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSPersonInfoModel.h"

@implementation CSPersonInfoModel
//+ (JSONKeyMapper *)keyMapper
//{
//    return [[JSONKeyMapper alloc] initWithDictionary:@{
//                                                       @"description": @"des",
//                                                       }];
//}

+ (BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

@end
