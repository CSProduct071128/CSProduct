//
//  CSPersonInfoBusinessManage.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSBaseService.h"

@interface CSPersonInfoBusinessManage : NSObject
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
                   andCompletion:(cscompletionBlock)completion;

/**
 获取用户列表
 */
+ (void)getUserInfoListWithType:(NSInteger)type andCompletion:(cscompletionBlock)completion;

/**
 用户 加入/接触 黑名单
 */
+ (void)setUserLocationblackListWithType:(NSInteger)type
                               andUserID:(NSString *)userId
                           andCompletion:(cscompletionBlock)completion;

/**
 获取黑名单列表
 */
+ (void)getblackListWithUserID:(NSString *)userId
                 andCompletion:(cscompletionBlock)completion;

@end
