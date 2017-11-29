//
//  CSMeBusinessManage.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

typedef void(^completionBlock)(BOOL isFinish,NSString *errorMessage);

#import "CSMeBusinessManage.h"
#import "CSBaseService.h"
@interface CSMeBusinessManage ()

@property (nonatomic,strong) NSArray *tableViewShowArray;

@end

@implementation CSMeBusinessManage

-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
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
    [CSBaseService postJsonDataRequestWithDetailRul:@"adat/sk/101110101.html" param:nil header:nil cls:[NSDictionary class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        completion(YES,@"正确！");
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        completion(NO,@"数据请求错误！");
    }];
}
@end
