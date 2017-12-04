//
//  CSCashHandler.h
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/4.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <Foundation/Foundation.h>
// 崩溃日志
@interface CSCashHandler : NSObject

+ (void)setDefaultHandler;
+ (NSUncaughtExceptionHandler *)getHandler;
+ (void)TakeException:(NSException *) exception;

@end
