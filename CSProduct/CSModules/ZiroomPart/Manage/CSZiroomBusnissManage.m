//
//  CSZiroomBusnissManage.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSZiroomBusnissManage.h"

@implementation CSZiroomBusnissManage

/**
 打卡接口
 */
+ (void)signInWithUserID:(NSString *)userId
           andCompletion:(cscompletionBlock)completion{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:userId forKey:@"userId"];
    
    [CSBaseService postJsonDataRequestWithDetailUrl:kURL_User_signin param:dict header:nil cls:[NSDictionary class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        if (logicDicData && [logicDicData isKindOfClass:[NSDictionary class]]) {
            completion(YES,nil);
        }else{
            completion(NO,msg?msg:kRequestErrorMessage);
        }
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        completion(NO,errorMsg?errorMsg:kRequestErrorMessage);
    }];
}

@end
