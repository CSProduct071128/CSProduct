//
//  AFHTTPRequestOperationManager+Add.m
//  ZiroomerProject
//
//  Created by Adele on 16/8/9.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "AFHTTPRequestOperationManager+Add.h"

@implementation AFHTTPRequestOperationManager (Add)

- (AFHTTPRequestOperation *)GET:(NSString *)URLString
                     contentType:(NSString *)contentType
        constructingBodyWithData:(NSData *)data
                         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    [request setHTTPMethod:@"GET"];
    //直接设置body为指定的二进制数据
    if (data) [request setHTTPBody:data];
    //contentType需要设置，服务器根据contentType解析数据
    [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
    AFHTTPRequestOperation * operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    if ([self isAllowHttpsRequest]) {
        [self addSecurityPolicy:operation];
    }
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, error);
    }];
    
    [self.operationQueue addOperation:operation];
    
    return operation;
}

- (AFHTTPRequestOperation *)POST:(NSString *)URLString
                     contentType:(NSString *)contentType
        constructingBodyWithData:(NSData *)data
                         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    
    [request setHTTPMethod:@"POST"];
    //直接设置body为指定的二进制数据
    [request setHTTPBody:data];
    //contentType需要设置，服务器根据contentType解析数据
    [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
    AFHTTPRequestOperation * operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    if ([self isAllowHttpsRequest]) {
        [self addSecurityPolicy:operation];
    }
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, error);
    }];
    
    [self.operationQueue addOperation:operation];
    
    return operation;
}

- (AFHTTPRequestOperation *)PUT:(NSString *)URLString
                     contentType:(NSString *)contentType
        constructingBodyWithData:(NSData *)data
                         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    
    [request setHTTPMethod:@"PUT"];
    //直接设置body为指定的二进制数据
    [request setHTTPBody:data];
    //contentType需要设置，服务器根据contentType解析数据
    [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
    AFHTTPRequestOperation * operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];

    
    if ([self isAllowHttpsRequest]) {
        [self addSecurityPolicy:operation];
    }
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, error);
    }];
    
    [self.operationQueue addOperation:operation];
    
    return operation;
}

-(void)addSecurityPolicy:(AFHTTPRequestOperation *)operation {
    
    //AFSecurityPolicy
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    
    operation.securityPolicy = securityPolicy;
}

-(BOOL)isAllowHttpsRequest {
    return YES;
}

@end





