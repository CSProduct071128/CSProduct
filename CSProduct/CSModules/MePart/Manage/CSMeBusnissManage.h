//
//  CSMeBusnissManage.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^getShowDataBlock)(NSArray *cellDataSets,NSArray *headDataArray, NSString *errorStr);

@interface CSMeBusnissManage : NSObject
+ (CSMeBusnissManage *)sharedInstance;
- (void)getMeViewShowDataWithBlock:(getShowDataBlock)block;

@end
