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

//保存公告
+(void)saveNoticeWithParams:(NSDictionary *)params WithModel:(id)cls  success:(successCallBack)success
                 failure:(failureCallBack)failure;
//获取公告列表
+(void)getNoticeListWithParams:(NSDictionary *)params WithModel:(id)cls  success:(successCallBack)success
                       failure:(failureCallBack)failure;
//获取公告详情
+(void)getNoticeDetailWithParams:(NSDictionary *)params WithModel:(id)cls  success:(successCallBack)success
                         failure:(failureCallBack)failure;
//获取部门列表
+(void)getDepartmentListWithParams:(NSDictionary *)params WithModel:(id)cls  success:(successCallBack)success
                           failure:(failureCallBack)failure;
@end
