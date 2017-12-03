//
//  CSLoginBusinessManage.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/3.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSLoginBusinessManage.h"
#import "CSLoginModel.h"

@implementation CSLoginBusinessManage

+ (void)isLoginWithAccount:(NSString *)account andPassword:(NSString *)password andCompletion:(cscompletionBlock)completion{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:account forKey:@"userName"];
    [dict setValue:password forKey:@"passWord"];

    [CSBaseService getJsonDataRequestWithDetailUrl:kURL_Login param:dict header:nil cls:[CSLoginModel class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        if (logicDicData && [logicDicData isKindOfClass:[CSLoginModel class]]) {
            CSLoginModel *model = (CSLoginModel *)logicDicData;
            // 保存登录信息
            CSDataSave *info = [[CSDataSave alloc] init];
            info.isLogin = YES;
            info.position = model.position;
            info.userId = model.userId;
            info.depId = model.depId;
            [CSDataSave encodeWithModel:info];
            completion(YES,nil);
        }else{
            completion(NO,msg?msg:kRequestErrorMessage);
        }
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        completion(NO,errorMsg?errorMsg:kRequestErrorMessage);
    }];
}


//---------------------------------------------
/**
     保存人员信息
 */
+ (void)saveUserInfoWithUserName:(NSString *)username
                     andPassword:(NSString *)password
                         andName:(NSString *)name
                          andSex:(NSString *)sex
                   andCardNumber:(NSString *)cardNumber
                        andPhone:(NSString *)phone
                      andAddress:(NSString *)address
                   andDepartment:(NSString *)departmnet
                         andRole:(NSString *)role
                       andPicUrl:(NSString *)picUrl
                   andCompletion:(cscompletionBlock)completion{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:username forKey:@"userName"];
    [dict setValue:password forKey:@"passWord"];
    [dict setValue:name forKey:@"name"];
    [dict setValue:sex forKey:@"sex"];
    [dict setValue:cardNumber forKey:@"cardNumber"];
    [dict setValue:phone forKey:@"phone"];
    [dict setValue:address forKey:@"address"];
    [dict setValue:departmnet forKey:@"departmnet"];
    [dict setValue:role forKey:@"role"];
    [dict setValue:picUrl forKey:@"picUrl"];

    [CSBaseService getJsonDataRequestWithDetailUrl:kURL_UserInfo_save param:dict header:nil cls:[NSDictionary class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        if (logicDicData && [logicDicData isKindOfClass:[NSDictionary class]]) {
            //
            completion(YES,nil);
        }else{
            completion(NO,msg?msg:kRequestErrorMessage);
        }
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        completion(NO,errorMsg?errorMsg:kRequestErrorMessage);
    }];
}

/**
     获取用户列表
 */
+ (void)getUserInfoListWithType:(NSInteger)type andCompletion:(cscompletionBlock)completion{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:@(type) forKey:@"type"];

    [CSBaseService getJsonDataRequestWithDetailUrl:kURL_UserList_get param:dict header:nil cls:[NSDictionary class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        if (logicDicData && [logicDicData isKindOfClass:[NSDictionary class]]) {
            // 保存登录信息
            CSDataSave *info = [[CSDataSave alloc] init];
            info.isLogin = YES;
            [CSDataSave encodeWithModel:info];
            completion(YES,nil);
        }else{
            completion(NO,msg?msg:kRequestErrorMessage);
        }
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        completion(NO,errorMsg?errorMsg:kRequestErrorMessage);
    }];
}

/**
     用户 加入/接触 黑名单  (未通)
 */
+ (void)setUserLocationblackListWithType:(NSInteger)type
                               andUserID:(NSString *)userId
                           andCompletion:(cscompletionBlock)completion{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:@(type) forKey:@"type"];
    [dict setValue:userId forKey:@"userId"];

    [CSBaseService getJsonDataRequestWithDetailUrl:kURL_User_operationBlacklist param:dict header:nil cls:[NSDictionary class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        if (logicDicData && [logicDicData isKindOfClass:[NSDictionary class]]) {
            completion(YES,nil);
        }else{
            completion(NO,msg?msg:kRequestErrorMessage);
        }
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        completion(NO,errorMsg?errorMsg:kRequestErrorMessage);
    }];
}

/**
 获取黑名单列表
 */
+ (void)getblackListWithUserID:(NSString *)userId
                 andCompletion:(cscompletionBlock)completion{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:userId forKey:@"userId"];
    
    [CSBaseService postJsonDataRequestWithDetailUrl:kURL_User_getBlackList param:dict header:nil cls:[NSDictionary class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        if (logicDicData && [logicDicData isKindOfClass:[NSDictionary class]]) {
            completion(YES,nil);
        }else{
            completion(NO,msg?msg:kRequestErrorMessage);
        }
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        completion(NO,errorMsg?errorMsg:kRequestErrorMessage);
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


/**
 保存组织结构
 */
+ (void)saveOrganizationConstructionWithParentDepId:(NSString *)parentDepId
                                         andDepName:(NSString *)depName
                                            andtype:(NSInteger)type
                                      andCompletion:(cscompletionBlock)completion{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:parentDepId forKey:@"parentDepId"];
    [dict setValue:depName forKey:@"depName"];
    [dict setValue:@(type) forKey:@"type"];

    [CSBaseService getJsonDataRequestWithDetailUrl:kURL_saveDep param:dict header:nil cls:[NSDictionary class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        if (logicDicData && [logicDicData isKindOfClass:[NSDictionary class]]) {
            completion(YES,nil);
        }else{
            completion(NO,msg?msg:kRequestErrorMessage);
        }
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        completion(NO,errorMsg?errorMsg:kRequestErrorMessage);
    }];
}

/**
 获取组织结构 (未通)
 */
+ (void)getOrganizationConstructionWithUpParentDepId:(NSString *)parentDepId
                                          andDepName:(NSString *)depName
                                             andtype:(NSInteger)type
                                       andCompletion:(cscompletionBlock)completion{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:parentDepId forKey:@"parentDepId"];
    [dict setValue:depName forKey:@"depName"];
    [dict setValue:@(type) forKey:@"type"];
    
    [CSBaseService getJsonDataRequestWithDetailUrl:kURL_getEmpList param:dict header:nil cls:[NSDictionary class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        if (logicDicData && [logicDicData isKindOfClass:[NSDictionary class]]) {
            completion(YES,nil);
        }else{
            completion(NO,msg?msg:kRequestErrorMessage);
        }
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        completion(NO,errorMsg?errorMsg:kRequestErrorMessage);
    }];
}

@end
