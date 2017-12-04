//
//  CSCashHandler.m
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/4.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSCashHandler.h"
#import "AFNetworking.h"
#import "CSZiroomBusnissManage.h"

// 沙盒的地址
NSString * applicationDocumentsDirectory() {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

// 崩溃时的回调函数
void UncaughtExceptionHandler(NSException * exception) {
    NSArray * arr = [exception callStackSymbols];
    NSString * reason = [exception reason]; // // 崩溃的原因  可以有崩溃的原因(数组越界,字典nil,调用未知方法...) 崩溃的控制器以及方法
    NSString * name = [exception name];
     NSString * url = [NSString stringWithFormat:@"========iOS端异常错误报告========\n%d\nname:%@\nreason:\n%@\ncallStackSymbols:\n%@",[CSZiroomBusnissManage getTimestampFromSystem],name,reason,[arr componentsJoinedByString:@"\n"]];
    NSString * path = [applicationDocumentsDirectory() stringByAppendingPathComponent:@"Exception.txt"];
    // 将一个txt文件写入沙盒
    [url writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
}

@implementation CSCashHandler
// 沙盒地址
- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

+ (void)setDefaultHandler {
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
}

+ (NSUncaughtExceptionHandler *)getHandler {
    return NSGetUncaughtExceptionHandler();
}

+ (void)TakeException:(NSException *)exception {
    NSArray * arr = [exception callStackSymbols];
    NSString * reason = [exception reason];
    NSString * name = [exception name];
    NSString * url = [NSString stringWithFormat:@"========iOS端异常错误报告========\n%d\nname:%@\nreason:\n%@\ncallStackSymbols:\n%@",[CSZiroomBusnissManage getTimestampFromSystem],name,reason,[arr componentsJoinedByString:@"\n"]];
    NSString * path = [applicationDocumentsDirectory() stringByAppendingPathComponent:@"Exception.txt"];
    [url writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

@end
