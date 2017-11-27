//
//  CSNetWorkConfig.m
//  HttpRequestHelper
//
//  Created by Chris on 15/7/1.
//  Copyright (c) 2015年 Chris. All rights reserved.
//

#import "CSNetWorkConfig.h"

@implementation CSNetWorkConfig{
    NSMutableArray *_urlFilters;
}

+ (CSNetWorkConfig *)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        _urlFilters = [NSMutableArray array];
    }
    return self;
}


- (void)addUrlFilter:(id<CSUrlFilterProtocol>)filter {
    [_urlFilters addObject:filter];
}

- (NSArray *)urlFilters {
    return [_urlFilters copy];
}

- (void)removeAllFilter{
    [_urlFilters removeAllObjects];
}

@end
