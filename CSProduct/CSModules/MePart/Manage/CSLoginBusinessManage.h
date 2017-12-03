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

@end
