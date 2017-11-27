//
//  CSNetworkAgent.m
//  HttpRequestHelper
//
//  Created by Chris on 15/7/2.
//  Copyright (c) 2015年 Chris. All rights reserved.
//

#import "CSNetworkAgent.h"
#import "CSNetWorkConfig.h"
#import "CSNetworkPrivate.h"
#import "CSNetworkLogModel.h"
#import "AFDownloadRequestOperation.h"
#define dispatch_async_main_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}

@implementation CSNetworkAgent {
     AFHTTPRequestOperationManager *_manager;
    CSNetWorkConfig *_config;
    NSMutableDictionary *_requestsRecord;
}

+ (CSNetworkAgent *)sharedInstance {
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
        _config = [CSNetWorkConfig sharedInstance];
        _manager = [AFHTTPRequestOperationManager manager];
        _requestsRecord = [NSMutableDictionary dictionary];
        _manager.operationQueue.maxConcurrentOperationCount = 4;
    }
    return self;
}

- (NSString *)buildRequestUrl:(CSBaseRequest *)request {
    NSString *detailUrl = [request requestUrl];
    if ([detailUrl hasPrefix:@"http"]) {
        return detailUrl;
    }
    
    if ([request needUrlFilters]) {
        // filter url,the default value is bj city
        NSArray *filters = [_config urlFilters];
        if([filters count] > 0){
            for (id<CSUrlFilterProtocol> f in filters) {
                detailUrl = [f filterUrl:detailUrl withRequest:request];
            }
        }else{
            for (id<CSUrlFilterProtocol> f in filters) {
                detailUrl = [f filterUrl:detailUrl withRequest:request];
            }
        }
    }
    
    NSString *baseUrl;
    if ([request baseUrl].length > 0) {
        baseUrl = [request baseUrl];
    } else {
        baseUrl = [_config baseUrl];
    }
    
    return [NSString stringWithFormat:@"%@%@", baseUrl, detailUrl];
}

//添加https
-(void)addHttps:(CSBaseRequest *)request{
    
    //获取https枚举类型
    [request getRequestHttpsType];

    //默认不支持https
    if (request.requestHttpsTypes == CSRequestDefaultHttp) {
        NSLog(@"默认不支持https");
    }
}

- (void)managerRequest:(CSBaseRequest *)request{
    CSRequestMethod method = [request requestMethod];
    NSString *url = [self buildRequestUrl:request];
    
    //添加https
    [self addHttps:request];
    
    if (request.requestSerializerType == CSRequestSerializerTypeHTTP) {
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        
        //add request headers
        NSDictionary *CSHeadersDic = [request CSHeaders];
        if (CSHeadersDic) {
            for (NSString *key in CSHeadersDic) {
                [_manager.requestSerializer setValue: CSHeadersDic[key] forHTTPHeaderField:key];
            }
        }
    }else{
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    NSDictionary *headerFieldValueDictionary = [request requestHeaderFieldValueDictionary];
    if (headerFieldValueDictionary != nil) {
        for (id httpHeaderField in headerFieldValueDictionary.allKeys) {
            id value = headerFieldValueDictionary[httpHeaderField];
            if ([httpHeaderField isKindOfClass:[NSString class]] && [value isKindOfClass:[NSString class]]) {
                [_manager.requestSerializer setValue:(NSString *)value forHTTPHeaderField:(NSString *)httpHeaderField];
            } else {
                NSLog(@"Error, class of key/value in headerFieldValueDictionary should be NSString.");
            }
        }
    }
    
    if (request.responseSerializerType == CSResponseSerializerTypeHTTP) {
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }else{
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
    }
    
    _manager.requestSerializer.timeoutInterval = [request requestTimeoutInterval];
    
    _manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    
    NSLog(@"Request url:%@%@",url,request.userInfo);
    NSLog(@"Request header:%@",[request CSHeaders]);
    
    if (request.isAllowHttpsRequest) {
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];

//#ifdef DEBUG
//        securityPolicy.allowInvalidCertificates = YES;
//        securityPolicy.validatesDomainName = NO;
//#else
//#endif

        _manager.securityPolicy = securityPolicy;
    }
    
    // if api need add custom value to HTTPHeaderField
    //    NSDictionary *headerFieldValueDictionary = [request requestHeaderFieldValueDictionary];
    if (headerFieldValueDictionary != nil) {
        for (id httpHeaderField in headerFieldValueDictionary.allKeys) {
            id value = headerFieldValueDictionary[httpHeaderField];
            if ([httpHeaderField isKindOfClass:[NSString class]] && [value isKindOfClass:[NSString class]]) {
                [_manager.requestSerializer setValue:(NSString *)value forHTTPHeaderField:(NSString *)httpHeaderField];
            } else {
                NSLog(@"Error, class of key/value in headerFieldValueDictionary should be NSString.");
            }
        }
    }
    
    if (method == CSRequestMethodGet) {
        request.requestOperation = [_manager GET:url parameters:request.userInfo success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [self handleRequestResult:operation];
        }                                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [self handleRequestResult:operation];
        }];
        
    } else if (method == CSRequestMethodPost) {
        
        if (request.requestBodyBlock) {
           NSMutableURLRequest *mutableRequest= [_manager.requestSerializer requestWithMethod:@"POST" URLString:[[NSURL URLWithString:url relativeToURL:_manager.baseURL] absoluteString] parameters:request.userInfo error:nil];
            NSData *postData = request.requestBodyBlock(request);
            NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
            [mutableRequest setURL:[NSURL URLWithString:url relativeToURL:_manager.baseURL]];
            [mutableRequest setHTTPMethod:@"POST"];
            [mutableRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [mutableRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
            [mutableRequest setHTTPBody:postData];
            
            request.requestOperation=[_manager HTTPRequestOperationWithRequest:mutableRequest success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                [self handleRequestResult:operation];
            } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
                [self handleRequestResult:operation];
            }];
            
            [_manager.operationQueue addOperation:request.requestOperation];
        }
        else
        {
            request.requestOperation = [_manager POST:url parameters:request.userInfo success:^(AFHTTPRequestOperation *operation, id responseObject) {
                [self handleRequestResult:operation];
            }                                 failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [self handleRequestResult:operation];
            }];
        }
        

        
    }else if (method == CSRequestMethodPut){
        request.requestOperation = [_manager PUT:url parameters:request.userInfo success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [self handleRequestResult:operation];
        }                                 failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [self handleRequestResult:operation];
        }];
    }
    else if (method == CSRequestMethodDelete){
        
        NSLog(@"DELETE request");
        
        //[_manager.requestSerializer setValue:@"application/x-www-form-urlencoded"forHTTPHeaderField:@"Content-Type"];
        
        request.requestOperation = [_manager DELETE:url parameters:request.userInfo success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
            [self handleRequestResult:operation];
            
        } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
            [self handleRequestResult:operation];
        }];
    }
    else {
        NSLog(@"Error, unsupport method type");
        return;
    }
    [self addOperation:request];
}

- (void)addRequest:(CSBaseRequest *)request {
    @synchronized (self) {
        [self managerRequest:request];
    }
}

- (void)cancelRequest:(CSBaseRequest *)request {
    [request.requestOperation cancel];
    [self removeOperation:request.requestOperation];
    [request clearCompletionBlock];
}

- (void)cancelAllRequests {
    NSDictionary *copyRecord = [_requestsRecord copy];
    for (NSString *key in copyRecord) {
        CSBaseRequest *request = copyRecord[key];
        [request stop];
    }
}

- (BOOL)checkResult:(CSBaseRequest *)request {
    BOOL result = [request statusCodeValidator];
    if (!result) {
        return result;
    }
    id validator = [request jsonValidator];
    if (validator != nil) {
        id json = [request responseJSONObject];
        result = [CSNetworkPrivate checkJson:json withValidator:validator];
    }
    return result;
}


- (void)handleRequestResult:(AFHTTPRequestOperation *)operation {
    NSString *key = [self requestHashKey:operation];
    CSBaseRequest *request = _requestsRecord[key];
    NSLog(@"==================================================");
    NSLog(@"\r\n Finished Request:  %@ \r\n Request baseUrl:%@  \r\n Request request url:%@ \r\n Request body:%@", NSStringFromClass([request class]),request.baseUrl,request.requestUrl,request.userInfo);
    NSLog(@"Finished Response data : %@", request.responseString);
    
    NSLog(@"Finished Response error : %@", [request errorMsg]);
    NSLog(@"Request %@ , status code = %ld",
          NSStringFromClass([request class]), (long)request.responseStatusCode);
    NSLog(@"==================================================");
// =================================================================================
    
    if (request) {
        BOOL succeed = [self checkResult:request];
        if (succeed) {
            if (request.delegate != nil) {
                [request.delegate requestFinished:request];
            }
            if (request.successCompletionBlock) {
                request.successCompletionBlock(request);
            }
        } else {
            NSLog(@"Request %@ failed, status code = %ld",
                  NSStringFromClass([request class]), (long)request.responseStatusCode);
            if (request.delegate != nil) {
                [request.delegate requestFailed:request];
            }
            if (request.failureCompletionBlock) {
                request.failureCompletionBlock(request);
            }
        }
    }
    [self removeOperation:operation];
    [request clearCompletionBlock];
}

- (NSString *)requestHashKey:(AFHTTPRequestOperation *)operation {
    NSString *key = [NSString stringWithFormat:@"%lu", (unsigned long)[operation hash]];
    return key;
}

- (void)addOperation:(CSBaseRequest *)request {
    if (request.requestOperation != nil) {
        NSString *key = [self requestHashKey:request.requestOperation];
        
        _requestsRecord[key] = request;
        
    }
}

- (void)removeOperation:(AFHTTPRequestOperation *)operation {
    NSString *key = [self requestHashKey:operation];
    @synchronized(self) {
        [_requestsRecord removeObjectForKey:key];
    }
}

@end
