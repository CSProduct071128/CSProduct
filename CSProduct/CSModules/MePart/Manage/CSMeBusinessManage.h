//
//  CSMeBusinessManage.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSPersonInfoModel.h"

typedef void(^getShowDataBlock)(NSArray *cellDataSets,CSPersonInfoModel *model, NSString *errorStr);

@interface CSMeBusinessManage : NSObject

- (instancetype)init;
- (void)getMeViewShowDataWithBlock:(getShowDataBlock)block;

@property (nonatomic,copy) NSString *userID;

@end
