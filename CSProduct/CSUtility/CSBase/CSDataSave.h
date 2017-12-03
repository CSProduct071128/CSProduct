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

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *loginName;
@property (nonatomic, copy) NSString *loginPhone;
@property (nonatomic, copy) NSString *loginWNumber;
@property (nonatomic, copy) NSString *loginMail;
@property (nonatomic, copy) NSString *loginBm;
@property (nonatomic, copy) NSString *loginPosition;

/**
     存入信息
 */
+ (void)encodeWithModel:(CSDataSave *)model;

/**
    取出登录信息
 */
+ (CSDataSave *)getLoginInfo;

@end
