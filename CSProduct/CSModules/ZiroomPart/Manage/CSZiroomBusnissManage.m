//
//  CSZiroomBusnissManage.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSZiroomBusnissManage.h"
#import <sys/utsname.h>

static NSString *const bannerListUrl = @"http://10.30.27.16:8080/rest/user/getBanner";
static NSString *const saveNoticeUrl = @"http://10.30.27.16:8080/rest/notice/saveNotice";
static NSString *const noticeListUrl = @"http://10.30.27.16:8080/rest/notice/getNoticeList";
static NSString *const noticeDetailUrl = @"http://10.30.27.16:8080/rest/notice/getNoticeDetail";
static NSString *const departmentListUrl = @"http://10.30.27.16:8080/rest/emp/getEmpList";
static NSString *const errorLogUrl = @"http://10.30.27.16:8080/rest/log/saveErrorLog";

#define XcodeAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

@implementation CSZiroomBusnissManage

+(void)getBannerListWithParams:(NSDictionary *)params WithModel:(id)cls  success:(successCallBack)success
                    failure:(failureCallBack)failure{
    [CSBaseService getJsonDataRequestWithDetailUrl:bannerListUrl param:params header:nil cls:cls success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        success(logicDicData,msg,logiccode);
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        failure(request, @"请检查网络配置!");
    }];
}
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
/**
 打卡接口
 */
+ (void)signInWithUserID:(NSString *)userId
           andCompletion:(cscompletionBlock)completion{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:userId forKey:@"userId"];
    
    [CSBaseService postJsonDataRequestWithDetailUrl:kURL_User_signin param:dict header:nil cls:[NSDictionary class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        if (logicDicData && [logicDicData isKindOfClass:[NSDictionary class]]) {
            completion(YES,nil);
        }else{
            completion(NO,msg?msg:kRequestErrorMessage);
        }
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        completion(NO,errorMsg?errorMsg:kRequestErrorMessage);
    }];
}
//崩溃上传接口
+(void)saveErrorLogWithParams:(NSDictionary *)params WithModel:(id)cls  success:(successCallBack)success
                           failure:(failureCallBack)failure{
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithDictionary:params];
    [dic setValue:[CSZiroomBusnissManage deviceName] forKey:@"mobileVersion"];
    [dic setValue:[NSString stringWithFormat:@"%f",[CSZiroomBusnissManage systemVersion]] forKey:@"sysVerson"];
    [dic setValue:XcodeAppVersion?XcodeAppVersion:@"" forKey:@"appVersion"];
    
    
    [CSBaseService getJsonDataRequestWithDetailUrl:errorLogUrl param:params header:nil cls:cls success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        success(logicDicData,msg,logiccode);
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        failure(request, @"崩溃日志上传失败!");
    }];
    
}



#pragma mark - priviteMethods -----
+(int)getTimestampFromSystem
{
    NSDate *nowDate = [NSDate date];
    NSTimeInterval timeStamp = [nowDate timeIntervalSince1970];
    return timeStamp;
}
+(float)systemVersion {
    static float version;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        version = [UIDevice currentDevice].systemVersion.floatValue;
    });
    return version;
}
+(NSString*)deviceName{
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString* code = [NSString stringWithCString:systemInfo.machine
                                        encoding:NSUTF8StringEncoding];
    
    static NSDictionary* deviceNamesByCode = nil;
    
    if (!deviceNamesByCode) {
        
        deviceNamesByCode = @{@"i386"      :@"Simulator",
                              @"x86_64"    :@"Simulator",
                              @"iPod1,1"   :@"iPod Touch",      // (Original)
                              @"iPod2,1"   :@"iPod Touch",      // (Second Generation)
                              @"iPod3,1"   :@"iPod Touch",      // (Third Generation)
                              @"iPod4,1"   :@"iPod Touch",      // (Fourth Generation)
                              @"iPod7,1"   :@"iPod Touch",      // (6th Generation)
                              @"iPhone1,1" :@"iPhone",          // (Original)
                              @"iPhone1,2" :@"iPhone",          // (3G)
                              @"iPhone2,1" :@"iPhone",          // (3GS)
                              @"iPad1,1"   :@"iPad",            // (Original)
                              @"iPad2,1"   :@"iPad 2",          //
                              @"iPad3,1"   :@"iPad",            // (3rd Generation)
                              @"iPhone3,1" :@"iPhone 4",        // (GSM)
                              @"iPhone3,3" :@"iPhone 4",        // (CDMA/Verizon/Sprint)
                              @"iPhone4,1" :@"iPhone 4S",       //
                              @"iPhone5,1" :@"iPhone 5",        // (model A1428, AT&T/Canada)
                              @"iPhone5,2" :@"iPhone 5",        // (model A1429, everything else)
                              @"iPad3,4"   :@"iPad",            // (4th Generation)
                              @"iPad2,5"   :@"iPad Mini",       // (Original)
                              @"iPhone5,3" :@"iPhone 5c",       // (model A1456, A1532 | GSM)
                              @"iPhone5,4" :@"iPhone 5c",       // (model A1507, A1516, A1526 (China), A1529 | Global)
                              @"iPhone6,1" :@"iPhone 5s",       // (model A1433, A1533 | GSM)
                              @"iPhone6,2" :@"iPhone 5s",       // (model A1457, A1518, A1528 (China), A1530 | Global)
                              @"iPhone7,1" :@"iPhone 6 Plus",   //
                              @"iPhone7,2" :@"iPhone 6",        //
                              @"iPhone8,1" :@"iPhone 6S",       //
                              @"iPhone8,2" :@"iPhone 6S Plus",  //
                              @"iPhone8,4" :@"iPhone SE",       //
                              @"iPad4,1"   :@"iPad Air",        // 5th Generation iPad (iPad Air) - Wifi
                              @"iPad4,2"   :@"iPad Air",        // 5th Generation iPad (iPad Air) - Cellular
                              @"iPad4,4"   :@"iPad Mini",       // (2nd Generation iPad Mini - Wifi)
                              @"iPad4,5"   :@"iPad Mini",       // (2nd Generation iPad Mini - Cellular)
                              @"iPad4,7"   :@"iPad Mini"        // (3rd Generation iPad Mini - Wifi (model A1599))
                              };
    }
    
    NSString* deviceName = [deviceNamesByCode objectForKey:code];
    
    if (!deviceName) {
        // Not found on database. At least guess main device type from string contents:
        
        if ([code rangeOfString:@"iPod"].location != NSNotFound) {
            deviceName = @"iPod Touch";
        }
        else if([code rangeOfString:@"iPad"].location != NSNotFound) {
            deviceName = @"iPad";
        }
        else if([code rangeOfString:@"iPhone"].location != NSNotFound){
            deviceName = @"iPhone";
        }
        else {
            deviceName = @"Unknown";
        }
    }
    return deviceName;
}


@end
