//
//  AFHTTPRequestOperationManager+Add.h
//  ZiroomerProject
//
//  Created by Adele on 16/8/9.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface AFHTTPRequestOperationManager (Add)

- (AFHTTPRequestOperation *)GET:(NSString *)URLString
                    contentType:(NSString *)contentType
       constructingBodyWithData:(NSData *)data
                        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (AFHTTPRequestOperation *)POST:(NSString *)URLString
                     contentType:(NSString *)contentType
        constructingBodyWithData:(NSData *)data
                         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
- (AFHTTPRequestOperation *)PUT:(NSString *)URLString
                    contentType:(NSString *)contentType
       constructingBodyWithData:(NSData *)data
                        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
