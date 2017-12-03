//
//  CSLoginBusinessManage.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/3.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSLoginBusinessManage.h"

@implementation CSLoginBusinessManage

+ (void)isLoginWithAccount:(NSString *)account andPassword:(NSString *)password andCompletion:(cscompletionBlock)completion{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:account forKey:@"userName"];
    [dict setValue:password forKey:@"passWord"];

    [CSBaseService getJsonDataRequestWithDetailRul:kURL_Login param:dict header:nil cls:[NSDictionary class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
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


//---------------------------------------------
/**
     保存人员信息
 */
+ (void)saveUserInfoWithUserName:(NSString *)username
                     andPassword:(NSString *)password
                         andName:(NSString *)name
                          andSex:(NSInteger)sex
                   andCardNumber:(NSString *)cardNumber
                        andPhone:(NSString *)phone
                      andAddress:(NSString *)address
                   andDepartment:(NSString *)departmnet
                         andRole:(NSString *)role
                   andCompletion:(cscompletionBlock)completion{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:username forKey:@"userName"];
    [dict setValue:password forKey:@"passWord"];
    [dict setValue:name forKey:@"name"];
    [dict setValue:@(sex) forKey:@"sex"];
    [dict setValue:cardNumber forKey:@"cardNumber"];
    [dict setValue:phone forKey:@"phone"];
    [dict setValue:address forKey:@"address"];
    [dict setValue:departmnet forKey:@"departmnet"];
    [dict setValue:role forKey:@"role"];

    [CSBaseService getJsonDataRequestWithDetailRul:kURL_UserInfo_save param:dict header:nil cls:[NSDictionary class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
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

    [CSBaseService getJsonDataRequestWithDetailRul:kURL_UserList_get param:dict header:nil cls:[NSDictionary class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
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


@end
