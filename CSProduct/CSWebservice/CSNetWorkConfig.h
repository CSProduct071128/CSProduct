//
//  CSNetWorkConfig.h
//  HttpRequestHelper
//
//  Created by Chris on 15/7/1.
//  Copyright (c) 2015年 Chris. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CSBaseRequest;

/*
 * 支持在现有的请求地址基础上,添加特定的参数,如:添加城市ID
 */
@protocol CSUrlFilterProtocol <NSObject>
- (NSString *)filterUrl:(NSString *)originUrl withRequest:(CSBaseRequest *)request;
@end



@interface CSNetWorkConfig : NSObject

@property (strong, nonatomic) NSString *baseUrl;
@property (strong, nonatomic, readonly) NSArray *urlFilters;    //存储URL添加的参数集合


+ (CSNetWorkConfig *)sharedInstance;

/*
 *description:
        添加 baseUrl 扩展内容,如:系统版本号、城市ID标识 等
 *parameters:
        fileter 实现 CSUrlFilterProtocol 协议的对象
 */
- (void)addUrlFilter:(id<CSUrlFilterProtocol>)filter;

/* 移除现有的baseUrl 扩展设置*/
- (void)removeAllFilter;

@end
