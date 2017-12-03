//
//  CSLoginBusinessManage.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/3.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSLoginBusinessManage.h"
#import "CSLoginModel.h"

@implementation CSLoginBusinessManage

+ (void)isLoginWithAccount:(NSString *)account andPassword:(NSString *)password andCompletion:(cscompletionBlock)completion{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:account forKey:@"userName"];
    [dict setValue:password forKey:@"passWord"];

    [CSBaseService getJsonDataRequestWithDetailUrl:kURL_Login param:dict header:nil cls:[CSLoginModel class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        if (logicDicData && [logicDicData isKindOfClass:[CSLoginModel class]]) {
            CSLoginModel *model = (CSLoginModel *)logicDicData;
            // 保存登录信息
            CSDataSave *info = [[CSDataSave alloc] init];
            info.isLogin = YES;
            info.position = model.position;
            info.userId = model.userId;
            info.depId = model.depId;
            [CSDataSave encodeWithModel:info];
            completion(YES,nil);
        }else{
            completion(NO,msg?msg:kRequestErrorMessage);
        }
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        completion(NO,errorMsg?errorMsg:kRequestErrorMessage);
    }];
}


@end
