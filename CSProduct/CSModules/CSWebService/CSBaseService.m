//
//  CSRequestService.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/26.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSBaseService.h"
#import "NSDictionary+null.h"

@implementation CSBaseService
+ (CSWebRequest *)postJsonDataRequestWithDetailUrl:(NSString *)httpDetailUrl
                                             param:(NSDictionary *)httpParamDataDic
                                            header:(NSDictionary *)httpHeadFieldDic
                                               cls:(Class)dataModelCls
                                           success:(successCallBack)success
                                           failure:(failureCallBack)failure
{
    if(![self isNetworkEnabled]){
        failure(nil, @"请检查网络配置!");
    }
    
    CSWebRequest *request = [[CSWebRequest alloc] init];
    
	request.httpDetailUrl = httpDetailUrl;

    request.method =CSRequestMethodGet;
    NSMutableDictionary *headDic=[NSMutableDictionary dictionaryWithDictionary:[self getPublicHeadDic]];
    if (httpHeadFieldDic) {
        [headDic setValuesForKeysWithDictionary:httpHeadFieldDic];
    }
    request.httpHeaderFieldDictionary=headDic;
//    request.userInfo = httpParamDataDic;
    NSData *data = [self ObjectDataToJSON:httpParamDataDic];
    NSString *paramStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"paramStr:%@",paramStr);
    request.requestBodyBlock = ^NSData *(CSBaseRequest *request) {
        return  [paramStr dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    };
    
    [request startWithCompletionBlockWithSuccess:^(CSBaseRequest *request) {
        NSLog(@"result==%@",request.responseString);
        NSData *responseData = [request.responseString dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary *dataDict = [self JsonDataToObject:responseData];
        if (![dataDict isKindOfClass:[NSDictionary class]]) {
            success(nil,@"数据格式不正确",nil);
            return;
        }
        
        if (dataDict[@"code"] == 0){
            id logicDic =[self logicData:dataDict[@"data"] resolveCls:dataModelCls] ;
            success(logicDic,dataDict[@"message"],dataDict[@"code"]);
        }else{
            success(nil,dataDict[@"message"],dataDict[@"code"]);
        }
    } failure:^(CSBaseRequest *request) {
        failure(request, @"请检查网络配置!");
    }];
    
    return request;
    
}

+ (CSWebRequest *)getJsonDataRequestWithDetailUrl:(NSString *)httpDetailUrl
                                             param:(NSDictionary *)httpParamDataDic
                                            header:(NSDictionary *)httpHeadFieldDic
                                               cls:(Class)dataModelCls
                                           success:(successCallBack)success
                                           failure:(failureCallBack)failure
{
    if(![self isNetworkEnabled]){
        failure(nil, @"请检查网络配置!");
    }
    
    CSWebRequest *request = [[CSWebRequest alloc] init];
    
    request.httpDetailUrl = httpDetailUrl;
    
    request.method =CSRequestMethodGet;
    NSMutableDictionary *headDic=[NSMutableDictionary dictionaryWithDictionary:[self getPublicHeadDic]];
    if (httpHeadFieldDic) {
        [headDic setValuesForKeysWithDictionary:httpHeadFieldDic];
    }
    request.httpHeaderFieldDictionary=headDic;
	request.userInfo = httpParamDataDic;
//    NSData *data = [self ObjectDataToJSON:httpParamDataDic];
//    NSString *paramStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//    NSLog(@"paramStr:%@",paramStr);
//    request.requestBodyBlock = ^NSData *(CSBaseRequest *request) {
//        return  [paramStr dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//    };
    
    [request startWithCompletionBlockWithSuccess:^(CSBaseRequest *request) {
        NSLog(@"result==%@",request.responseString);
        NSData *responseData = [request.responseString dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary *dataDict = [self JsonDataToObject:responseData];
        if (![dataDict isKindOfClass:[NSDictionary class]]) {
            success(nil,@"数据格式不正确",nil);
            return;
        }
        
        if ([dataDict[@"code"] integerValue] == 0){
            id logicDic =[self logicData:dataDict[@"data"] resolveCls:dataModelCls] ;
            success(logicDic,dataDict[@"message"],dataDict[@"code"]);
        }else{
            success(nil,dataDict[@"message"],dataDict[@"code"]);
        }
    } failure:^(CSBaseRequest *request) {
        failure(request, @"请检查网络配置!");
    }];
    
    return request;
    
}



#pragma mark  基础方法
+ (BOOL)isNetworkEnabled
{
    BOOL bEnabled = FALSE;
    NSString *url = @"www.baidu.com";
    SCNetworkReachabilityRef ref = SCNetworkReachabilityCreateWithName(NULL, [url UTF8String]);
    SCNetworkReachabilityFlags flags;
    
    bEnabled = SCNetworkReachabilityGetFlags(ref, &flags);
    
    CFRelease(ref);
    if (bEnabled) {
        //        kSCNetworkReachabilityFlagsReachable：能够连接网络
        //        kSCNetworkReachabilityFlagsConnectionRequired：能够连接网络，但是首先得建立连接过程
        //        kSCNetworkReachabilityFlagsIsWWAN：判断是否通过蜂窝网覆盖的连接，比如EDGE，GPRS或者目前的3G.主要是区别通过WiFi的连接。
        BOOL flagsReachable = ((flags & kSCNetworkFlagsReachable) != 0);
        BOOL connectionRequired = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
        BOOL nonWiFi = flags & kSCNetworkReachabilityFlagsTransientConnection;
        bEnabled = ((flagsReachable && !connectionRequired) || nonWiFi) ? YES : NO;
    }
    return bEnabled;
}


+ (NSDictionary *)getPublicHeadDic
{
    NSMutableDictionary *pubDic=[NSMutableDictionary dictionary];
    [pubDic setValue:@"1" forKey:@"appType"];
    [pubDic setValue:@"iOS" forKey:@"osType"];
    [pubDic setValue:@"app" forKey:@"Sys"];
//    [pubDic setValue:[[UIDevice currentDevice] systemVersion] forKey:@"osVersion"];
//    [pubDic setValue:[[UIDevice currentDevice] localizedModel] forKey:@"phoneName"];
//    [pubDic setValue:@"application/json" forKey:@"Accept"];
//    [pubDic setValue:[self getRequestId] forKey:@"Request-Id"];
    
    return pubDic;
}



+ (id)logicData:(id)logicData resolveCls:(Class)cls
{
    if (cls&&[cls isSubclassOfClass:[JSONModel class]]) {
        if ([logicData isKindOfClass:[NSArray class]]) {
            return [self logicArr:logicData resolveCls:cls];
        }
        else if ([logicData isKindOfClass:[NSDictionary class]])
        {
            
            NSError *error;
            JSONModel *dataModel=[(JSONModel *)[cls alloc] initWithDictionary:logicData error:&error];
            if (error) {
                return logicData;
            }
            else
            {
                return dataModel;
            }
            
        }
        else
        {
            return logicData;
        }
    }
    else
    {
        return logicData;
    }
}

+ (id)logicArr:(NSArray *)logicArr resolveCls:(Class)cls
{
    NSMutableArray *dataArr=[NSMutableArray array];
    for (id logicDic in logicArr) {
        if ([logicDic isKindOfClass:[NSDictionary class]]) {
            NSError *error;
            JSONModel *dataModel=[(JSONModel *)[cls alloc] initWithDictionary:logicDic error:&error];
            if (error) {
                [dataArr addObject:logicDic];
            }
            else
            {
                [dataArr addObject:dataModel];
            }
        }
        else if([logicDic isKindOfClass:[NSArray class]])
        {
            [dataArr addObject:[self logicArr:logicDic resolveCls:cls]];
        }
        else
        {
            [dataArr addObject:logicDic];
        }
    }
    return dataArr;
}



#pragma mark 私有方法
+ (NSString *)getRequestId
{
    NSString *requestIdStr = @"";
    NSString *total = [[NSUUID UUID] UUIDString];
    NSString *subStr = [total substringWithRange:NSMakeRange(0, 8)];
    requestIdStr = subStr;
    requestIdStr = [requestIdStr stringByAppendingString:@":"];
    return requestIdStr;
}

+ (NSData *)ObjectDataToJSON:(NSDictionary *)object{
    
    NSError *error = nil;
    
    if ([NSJSONSerialization isValidJSONObject:object]) {
        
        return [NSJSONSerialization dataWithJSONObject:object
                                               options:NSJSONWritingPrettyPrinted error:&error];
    }
    return NULL;
}

+ (NSDictionary *)JsonDataToObject:(NSData *)json{
    
    if (![json isKindOfClass:[NSData class]]) {
        return nil;
    }
    
    NSError *err = nil;
    
    if (json) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&err];
        NSDictionary *filterNullDic = [NSDictionary changeType:dic];
        return filterNullDic;
        
    }else{
        
        return nil;
    }
}

@end
