//
//  CSZiroomBusnissManage.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSBaseService.h"

@interface CSZiroomBusnissManage : NSObject
/**
 打卡接口
 */
+ (void)signInWithUserID:(NSString *)userId
           andCompletion:(cscompletionBlock)completion;

@end
