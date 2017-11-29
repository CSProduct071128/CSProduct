//
//  CSMeBusnissManage.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

typedef void(^completionBlock)(BOOL isFinish,NSString *errorMessage);

#import "CSMeBusnissManage.h"
static CSMeBusnissManage *sharedInstance = nil;
@interface CSMeBusnissManage ()

@property (nonatomic,strong) NSArray *tableViewShowArray;


@end
@implementation CSMeBusnissManage
#pragma mark - 单例
+ (CSMeBusnissManage *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(sharedInstance == nil)
            sharedInstance = [[CSMeBusnissManage alloc] init];
    });
    
    return sharedInstance;
}

/**
     获取页面显示数据
 */
- (void)getMeViewShowDataWithBlock:(getShowDataBlock)block{
    [self tableViewCellDataWithCompletion:^(BOOL isFinish , NSString *errorMsg) {
    }];
    
    [self tableViewHeadViewDataWithCompletion:^(BOOL isFinish,NSString *errorMsg) {
        if (isFinish && block) {
            block(self.tableViewShowArray,nil,nil);
        }else if (!isFinish && block){
            block(self.tableViewShowArray,nil,errorMsg);
        }
    }];


}

/**
     cell Sets
 */
- (void)tableViewCellDataWithCompletion:(completionBlock)completion{
    self.tableViewShowArray = @[@"我的基本信息",@"我的公告",@"我的申请"];
}


/**
     headView dataShow
 */
- (void)tableViewHeadViewDataWithCompletion:(completionBlock)completion{
    self.tableViewShowArray = @[@"我的基本信息",@"我的公告",@"我的申请"];
    completion(YES,@"数据请求错误！");
}
@end
