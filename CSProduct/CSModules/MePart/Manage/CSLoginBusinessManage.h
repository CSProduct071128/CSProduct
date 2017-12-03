//
//  CSLoginBusinessManage.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/3.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSBaseService.h"

@interface CSLoginBusinessManage : NSObject
/**
     登录
 */
+ (void)isLoginWithAccount:(NSString *)account andPassword:(NSString *)password andCompletion:(cscompletionBlock)completion;

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
                   andCompletion:(cscompletionBlock)completion;

/**
 获取用户列表
 */
+ (void)getUserInfoListWithType:(NSInteger)type andCompletion:(cscompletionBlock)completion;

@end
