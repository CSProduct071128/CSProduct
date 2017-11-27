//
//  CSNetworkAgent.h
//  HttpRequestHelper
//
//  Created by Chris on 15/7/2.
//  Copyright (c) 2015年 Chris. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSBaseRequest.h"
#import "AFNetworking.h"



@interface CSNetworkAgent : NSObject

+ (CSNetworkAgent *)sharedInstance;

- (void)addRequest:(CSBaseRequest *)request;

- (void)cancelRequest:(CSBaseRequest *)request;

- (void)cancelAllRequests;

/// 根据request和networkConfig构建url
- (NSString *)buildRequestUrl:(CSBaseRequest *)request;

@end
