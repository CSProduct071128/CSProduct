//
//  CSBaseRequest.m
//  HttpRequestHelper
//
//  Created by Chris on 15/7/1.
//  Copyright (c) 2015年 Chris. All rights reserved.
//

#import "CSBaseRequest.h"
#import "CSNetworkAgent.h"
#import "CSNetworkPrivate.h"

@implementation CSBaseRequest

- (NSString *)requestUrl {
    return @"";
}

- (NSString *)baseUrl {
    return @"";
}

- (NSTimeInterval)requestTimeoutInterval {
    return 30;
}

- (CSRequestMethod)requestMethod {
    return CSRequestMethodGet;
}

- (CSRequestSerializerType)requestSerializerType {
    return CSRequestSerializerTypeHTTP;
}

- (CSResponseSerializerType)responseSerializerType {
    return CSResponseSerializerTypeHTTP;
}

/// append self to request queue
- (void)start {
    [[CSNetworkAgent sharedInstance] addRequest:self];
}

/// remove self from request queue
- (void)stop {
    self.delegate = nil;
    [[CSNetworkAgent sharedInstance] cancelRequest:self];
}

- (BOOL)isExecuting {
    return self.requestOperation.isExecuting;
}

- (void)startWithCompletionBlockWithSuccess:(void (^)(CSBaseRequest *request))success
                                    failure:(void (^)(CSBaseRequest *request))failure {
    [self setCompletionBlockWithSuccess:success failure:failure];
    [self start];
}

- (void)setCompletionBlockWithSuccess:(void (^)(CSBaseRequest *request))success
                              failure:(void (^)(CSBaseRequest *request))failure {
    self.successCompletionBlock = success;
    self.failureCompletionBlock = failure;
}

- (void)clearCompletionBlock {
    // nil out to break the retain cycle.
    self.successCompletionBlock = nil;
    self.failureCompletionBlock = nil;
}

- (id)jsonValidator {
    return nil;
}

- (BOOL)statusCodeValidator {
    NSInteger statusCode = [self responseStatusCode];
    if (statusCode >= 200 && statusCode <=299) {
        return YES;
    } else {
        return NO;
    }
}

- (id)responseJSONObject {
    return self.requestOperation.responseObject;
}

- (NSError *)error {
    return self.requestOperation.error;
}

- (NSString *)errorMsg{
    return  [self.error.userInfo objectForKey:@"NSLocalizedDescription"];
}

- (NSString *)responseString {
    return self.requestOperation.responseString;
}

- (NSInteger)responseStatusCode {
    return self.requestOperation.response.statusCode;
}

- (NSDictionary *)responseHeaders {
    return self.requestOperation.response.allHeaderFields;
}

//
-(BOOL)needUrlFilters{
    return YES;
}
-(NSDictionary *)requestHeaderFieldValueDictionary {
    return nil;
}

/**获取https枚举类型*/
-(void)getRequestHttpsType{
    
    //默认不支持https
    self.requestHttpsTypes = CSRequestDefaultHttp;
    
}

- (NSDictionary *)CSHeaders{
    return nil;
}

- (BOOL)isAllowHttpsRequest
{
    return NO;
}

@end
