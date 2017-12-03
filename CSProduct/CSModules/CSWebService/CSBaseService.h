//
//  CSRequestService.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/26.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSWebRequest.h"
#import <JSONModel/JSONModel.h>

#define kRequestErrorMessage @"数据请求错误！"

typedef void(^cscompletionBlock)(BOOL isFinish,NSString *errorMessage);
//网络成功
typedef void(^successCallBack)(id logicDicData,NSString *msg,NSString *logiccode);
//网络失败
typedef void(^failureCallBack)(CSBaseRequest *request, NSString *errorMsg);

@interface CSBaseService : NSObject
/**
 发起请求接口
 
 @param httpDetailUrl    接口地址
 @param httpParamDataDic 入参
 @param httpHeadFieldDic 头部附加参数
 @param dataModelCls    //数据模型<继承自JSONModel>
 @param successblock
 @param failureblock
 */
+ (CSWebRequest *)postJsonDataRequestWithDetailRul:(NSString *)httpDetailUrl
                                             param:(NSDictionary *)httpParamDataDic
                                            header:(NSDictionary *)httpHeadFieldDic
                                               cls:(Class)dataModelCls
                                           success:(successCallBack)successblock
                                           failure:(failureCallBack)failureblock;

+ (CSWebRequest *)getJsonDataRequestWithDetailRul:(NSString *)httpDetailUrl
                                            param:(NSDictionary *)httpParamDataDic
                                           header:(NSDictionary *)httpHeadFieldDic
                                              cls:(Class)dataModelCls
                                          success:(successCallBack)success
                                          failure:(failureCallBack)failure;

@end
