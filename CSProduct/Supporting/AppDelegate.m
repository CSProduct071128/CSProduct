//
//  AppDelegate.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/26.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "AppDelegate.h"
#import "CSCashHandler.h"
#import "CSZiroomBusnissManage.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //初始化崩溃搜集方法
    [self initExceptionMethods];
    
    [NSThread sleepForTimeInterval:2];
    
    return YES;
}

-(void)initExceptionMethods{
    
#pragma mark -- 崩溃日志
    [CSCashHandler setDefaultHandler];
    // 发送崩溃日志
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dataPath = [path stringByAppendingPathComponent:@"Exception.txt"];
//    NSData *data = [NSData dataWithContentsOfFile:dataPath];
//    if (data != nil) {
//        [self sendExceptionLogWithData:data path:dataPath];
//    }
    
    NSError *error ;
    NSString *data = [NSString stringWithContentsOfFile:dataPath encoding:NSUTF8StringEncoding error:&error];
    if (data != nil) {
        [self sendExceptionLogWithData:data path:dataPath];
    }
}
#pragma mark -- 发送崩溃日志
- (void)sendExceptionLogWithData:(NSString *)data path:(NSString *)path {
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:[NSNumber numberWithInteger:2] forKey:@"appType"];
    NSArray *arr = [data componentsSeparatedByString:@"\n"];
    NSInteger errorTime = [arr[1] integerValue];
    [dic setValue:[NSNumber numberWithInteger:errorTime] forKey:@"errorTime"];
    
    [CSZiroomBusnissManage saveErrorLogWithParams:dic WithModel:[NSDictionary class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        // 删除文件
        NSFileManager *fileManger = [NSFileManager defaultManager];
        [fileManger removeItemAtPath:path error:nil];
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        
    }];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
