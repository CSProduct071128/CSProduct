//
//  CSBaseRequest.h
//  HttpRequestHelper
//
//  Created by Chris on 15/7/1.
//  Copyright (c) 2015年 Chris. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "AFDownloadRequestOperation.h"
/**https枚举类型*/
typedef NS_ENUM(NSInteger , CSRequestHttpsType) {
    /**默认不支持https*/
    CSRequestDefaultHttp = 0,
};

typedef NS_ENUM(NSInteger , CSRequestMethod) {
    CSRequestMethodGet = 0,
    CSRequestMethodPost,
    CSRequestMethodPut,
    CSRequestMethodDelete,
};

typedef NS_ENUM(NSInteger , CSRequestSerializerType) {
    CSRequestSerializerTypeHTTP = 0,
    CSRequestSerializerTypeJSON,
};

typedef NS_ENUM(NSInteger , CSResponseSerializerType) {
    CSResponseSerializerTypeHTTP = 0,
    CSResponseSerializerTypeJSON,
};


typedef void (^AFConstructingBlock)(id<AFMultipartFormData> formData);
typedef void (^AFDownloadProgressBlock)(AFDownloadRequestOperation *operation, NSInteger bytesRead, long long totalBytesRead, long long totalBytesExpected, long long totalBytesReadForFile, long long totalBytesExpectedToReadForFile);

@class CSBaseRequest;

@protocol CSRequestDelegate <NSObject>

- (void)requestFinished:(CSBaseRequest *)request;
- (void)requestFailed:(CSBaseRequest *)request;

@optional
- (void)clearRequest;

@end

@protocol CSRequestAccessory <NSObject>

@optional

- (void)requestWillStart:(id)request;
- (void)requestWillStop:(id)request;
- (void)requestDidStop:(id)request;

@end


@interface CSBaseRequest : NSObject

/// Tag
@property (nonatomic) NSInteger tag;

/// User info
@property (nonatomic, strong) NSDictionary *userInfo;

@property (nonatomic, strong) AFHTTPRequestOperation *requestOperation;

/// request delegate object
@property (nonatomic, weak) id<CSRequestDelegate> delegate;


@property (nonatomic, strong, readonly) NSDictionary *responseHeaders;

@property (nonatomic, strong, readonly) NSString *responseString;

@property (nonatomic, strong, readonly) id responseJSONObject;

@property (nonatomic, strong, readonly) NSError *error;

@property (nonatomic, readonly) NSInteger responseStatusCode;

@property (nonatomic, copy) void (^successCompletionBlock)(CSBaseRequest *);

@property (nonatomic, copy) void (^failureCompletionBlock)(CSBaseRequest *);

@property (nonatomic, copy) NSData *(^requestBodyBlock)(CSBaseRequest *);

@property (nonatomic, strong) NSMutableArray *requestAccessories;

/**https枚举类型*/
@property (nonatomic, assign) NSInteger requestHttpsTypes;

/// append self to request queue
- (void)start;

/// remove self from request queue
- (void)stop;

- (BOOL)isExecuting;

/// block回调
- (void)startWithCompletionBlockWithSuccess:(void (^)(CSBaseRequest *request))success
                                    failure:(void (^)(CSBaseRequest *request))failure;


- (void)setCompletionBlockWithSuccess:(void (^)(CSBaseRequest *request))success
                              failure:(void (^)(CSBaseRequest *request))failure;

/// 把block置nil来打破循环引用
- (void)clearCompletionBlock;

/// 请求的URL
- (NSString *)requestUrl;

/// 请求的BaseURL
- (NSString *)baseUrl;

/// 用于检查JSON是否合法的对象
- (id)jsonValidator;

/// 用于检查Status Code是否正常的方法
- (BOOL)statusCodeValidator;

/// 请求的SerializerType
- (CSRequestSerializerType)requestSerializerType;

/// 回应的SerializerType
- (CSResponseSerializerType)responseSerializerType;

/// 请求的连接超时时间，默认为60秒
- (NSTimeInterval)requestTimeoutInterval;

/// Http请求的方法
- (CSRequestMethod)requestMethod;

- (NSString *)errorMsg;

-(BOOL)needUrlFilters;

/**获取https枚举类型*/
-(void)getRequestHttpsType;

//设置header,request需要添加headers，重写这个方法
- (NSDictionary *)CSHeaders;

// 设置https请求，默认为NO;
- (BOOL)isAllowHttpsRequest;

/// 在HTTP报头添加的自定义参数
- (NSDictionary *)requestHeaderFieldValueDictionary;


@end
