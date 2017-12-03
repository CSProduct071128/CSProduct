//
//  CSOrganizationBusiness.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/3.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSOrganizationBusiness.h"

@interface CSOrganizationBusiness ()

@end

@implementation CSOrganizationBusiness
/**
 获取组织结构 
 */
+ (void)getOrganizationConstructionWithUpParentDepId:(NSString *)parentDepId
                                          andDepName:(NSString *)depName
                                             andtype:(NSString *)type
                                       andCompletion:(CSOrganizationInfoBlock)completion{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:@([parentDepId longLongValue]) forKey:@"parentDepId"];
    [dict setValue:depName forKey:@"depName"];
    [dict setValue:@([type integerValue]) forKey:@"type"];
    
    [CSBaseService getJsonDataRequestWithDetailUrl:kURL_getEmpList param:dict header:nil cls:[CSOrganizationModel class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        if (logicDicData && [logicDicData isKindOfClass:[CSOrganizationModel class]]) {
            
            CSOrganizationModel *model = (CSOrganizationModel *)logicDicData;
            completion(YES,nil,model.depOneList,model.userList,logicDicData);
            
        }else{
            completion(NO,msg?msg:kRequestErrorMessage,nil,nil,nil);
        }
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        completion(NO,errorMsg?errorMsg:kRequestErrorMessage,nil,nil,nil);
    }];
}

/**
 保存组织结构
 */
+ (void)saveOrganizationConstructionWithParentDepId:(NSString *)parentDepId
                                         andDepName:(NSString *)depName
                                            andtype:(NSInteger)type
                                      andCompletion:(cscompletionBlock)completion{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:parentDepId forKey:@"parentDepId"];
    [dict setValue:depName forKey:@"depName"];
    [dict setValue:@(type) forKey:@"type"];
    
    [CSBaseService getJsonDataRequestWithDetailUrl:kURL_saveDep param:dict header:nil cls:[NSDictionary class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
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
