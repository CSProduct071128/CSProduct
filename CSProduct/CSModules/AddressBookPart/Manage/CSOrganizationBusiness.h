//
//  CSOrganizationBusiness.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/3.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSBaseService.h"
#import "CSOrganizationModel.h"

typedef void(^CSOrganizationInfoBlock)(BOOL isFinish,NSString *errorMessage,NSArray *oriArray,NSArray *perArray,CSOrganizationModel *model);

@interface CSOrganizationBusiness : NSObject
/**
 获取组织结构 
 */
+ (void)getOrganizationConstructionWithUpParentDepId:(NSString *)parentDepId
                                          andDepName:(NSString *)depName
                                             andtype:(NSString *)type
                                       andCompletion:(CSOrganizationInfoBlock)completion;
/**
 保存组织结构
 */
+ (void)saveOrganizationConstructionWithParentDepId:(NSString *)parentDepId
                                         andDepName:(NSString *)depName
                                            andtype:(NSInteger)type
                                      andCompletion:(cscompletionBlock)completion;


@end
