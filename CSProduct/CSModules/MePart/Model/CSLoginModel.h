//
//  CSLoginModel.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/3.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CSLoginModel : JSONModel

@property (nonatomic,copy) NSString *position;//用户权限
@property (nonatomic,copy) NSString *depId;//部门ID
@property (nonatomic,copy) NSString *userId;//用户id

@end
