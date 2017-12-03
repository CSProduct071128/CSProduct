//
//  CSDataSave.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSDataSave : NSObject
@property (nonatomic, assign) BOOL isLogin;

@property (nonatomic, copy) NSString *userId;   //  用户id
@property (nonatomic, copy) NSString *position;//用户权限
@property (nonatomic, copy) NSString *depId;//部门id
@property (nonatomic, copy) NSString *loginName;//  用户名
@property (nonatomic, copy) NSString *loginPhone;//  用户电话
@property (nonatomic, copy) NSString *loginWNumber;//
@property (nonatomic, copy) NSString *loginMail;//  用户邮箱
@property (nonatomic, copy) NSString *loginBm;//
@property (nonatomic, copy) NSString *loginPosition;//


/**
     存入信息
 */
+ (void)encodeWithModel:(CSDataSave *)model;

/**
    取出登录信息
 */
+ (CSDataSave *)getLoginInfo;

/**
     获取用户id
 */
+ (NSString *)getUserID;
/**
 获取用户id
 */
+ (NSString *)getDepID;

@end
