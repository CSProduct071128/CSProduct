//
//  CSPersonInfoModel.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/3.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CSPersonInfoModel : JSONModel

@property (nonatomic,copy) NSString *userId;//用户权限
@property (nonatomic,copy) NSString *name;//姓名
@property (nonatomic,copy) NSString *sex;//性别
@property (nonatomic,copy) NSString *cardNumber;//身份证号
@property (nonatomic,copy) NSString *phoneNumber;//电话号
@property (nonatomic,copy) NSString *address;//住址
@property (nonatomic,copy) NSString *departmnet;//所属部门
@property (nonatomic,copy) NSString *role;// 职位
@property (nonatomic,assign) NSInteger isBlack;// 是否是黑名单
@property (nonatomic,copy) NSString *userName;// 用户名
@property (nonatomic,copy) NSString *picUrl;// 头像

@end
