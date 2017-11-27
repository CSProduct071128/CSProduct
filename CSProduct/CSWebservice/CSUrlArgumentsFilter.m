//
//  CSUrlArgumentsFilter.m
//  ZiroomProject
//
//  Created by Chris on 15/6/23.
//  Copyright (c) 2015年 ZiRoom. All rights reserved.
//

#import "CSUrlArgumentsFilter.h"
#import "CSNetworkPrivate.h"

@implementation CSUrlArgumentsFilter{
    NSDictionary *_arguments;
}

+ (CSUrlArgumentsFilter *)filterWithArguments:(NSDictionary *)arguments {
    return [[self alloc] initWithArguments:arguments];
}

- (id)initWithArguments:(NSDictionary *)arguments {
    self = [super init];
    if (self) {
        _arguments = arguments;
    }
    return self;
}

- (NSString *)filterUrl:(NSString *)originUrl withRequest:(CSBaseRequest *)request {
    return [CSNetworkPrivate urlStringWithOriginUrlString:originUrl appendParameters:_arguments];
}

@end
