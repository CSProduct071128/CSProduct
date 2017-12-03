//
//  CSZiroomBusnissManage.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSZiroomBusnissManage.h"

static NSString *const saveNoticeUrl = @"http://10.30.27.16:8080/rest/notice/saveNotice";
static NSString *const noticeListUrl = @"http://10.30.27.16:8080/rest/notice/getNoticeList";
static NSString *const noticeDetailUrl = @"http://10.30.27.16:8080/rest/notice/getNoticeDetail";
static NSString *const departmentListUrl = @" http://10.30.27.16:8080/rest/emp/getEmpList";

@implementation CSZiroomBusnissManage

+(void)saveNoticeWithParams:(NSDictionary *)params WithModel:(id)cls  success:(successCallBack)success
                 failure:(failureCallBack)failure{
    [CSBaseService getJsonDataRequestWithDetailUrl:saveNoticeUrl param:params header:nil cls:cls success:^(id logicDicData, NSString *msg, NSString *logiccode) {
         success(logicDicData,msg,logiccode);
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
          failure(request, @"请检查网络配置!");
    }];
    
}
+(void)getNoticeListWithParams:(NSDictionary *)params WithModel:(id)cls  success:(successCallBack)success
                    failure:(failureCallBack)failure{
    [CSBaseService getJsonDataRequestWithDetailUrl:noticeListUrl param:params header:nil cls:cls success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        success(logicDicData,msg,logiccode);
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        failure(request, @"请检查网络配置!");
    }];
    
}
+(void)getNoticeDetailWithParams:(NSDictionary *)params WithModel:(id)cls  success:(successCallBack)success
                       failure:(failureCallBack)failure{
    [CSBaseService getJsonDataRequestWithDetailUrl:noticeDetailUrl param:params header:nil cls:cls success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        success(logicDicData,msg,logiccode);
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        failure(request, @"请检查网络配置!");
    }];
    
}
+(void)getDepartmentListWithParams:(NSDictionary *)params WithModel:(id)cls  success:(successCallBack)success
                         failure:(failureCallBack)failure{
    [CSBaseService getJsonDataRequestWithDetailUrl:departmentListUrl param:params header:nil cls:cls success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        success(logicDicData,msg,logiccode);
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        failure(request, @"请检查网络配置!");
    }];
    
}
@end
