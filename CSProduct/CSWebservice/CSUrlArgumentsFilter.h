//
//  CSUrlArgumentsFilter.h
//  ZiroomProject
//
//  Created by Chris on 15/6/23.
//  Copyright (c) 2015年 ZiRoom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSNetWorkConfig.h"
#import "CSBaseRequest.h"

/// 给url追加arguments，用于全国化参数，如 city_code
@interface CSUrlArgumentsFilter : NSObject <CSUrlFilterProtocol>

+ (CSUrlArgumentsFilter *)filterWithArguments:(NSDictionary *)arguments;

- (NSString *)filterUrl:(NSString *)originUrl withRequest:(CSBaseRequest *)request;


@end
