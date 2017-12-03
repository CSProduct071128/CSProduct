//
//  CSMeBusinessManage.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//


#import "CSMeBusinessManage.h"
#import "CSBaseService.h"
@interface CSMeBusinessManage ()

@property (nonatomic,strong) NSArray *tableViewShowArray;
@property (nonatomic,strong) CSPersonInfoModel *showModel;



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
    
    [self tableViewHeadViewDataWithUserId:_userID completion:^(BOOL isFinish,NSString *errorMsg) {
        if (isFinish && block) {
            block(self.tableViewShowArray,_showModel,nil);
        }else if (!isFinish && block){
            block(self.tableViewShowArray,nil,errorMsg);
        }
    }];
    
    
}

/**
 cell Sets
 */
- (void)tableViewCellDataWithCompletion:(cscompletionBlock)completion{
    self.tableViewShowArray = @[@"我的基本信息",@"我的公告",@"我的申请"];
}


/**
 headView dataShow
 */
- (void)tableViewHeadViewDataWithUserId:(NSString *)userid completion:(cscompletionBlock)completion{

    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:userid forKey:@"userId"];
    
    [CSBaseService getJsonDataRequestWithDetailUrl:kURL_UserInfo_get param:dict header:nil cls:[CSPersonInfoModel class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        if (logicDicData && [logicDicData isKindOfClass:[CSPersonInfoModel class]]) {
            completion(YES,nil);
        }else{
            completion(NO,msg?msg:kRequestErrorMessage);
        }
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        completion(NO,errorMsg?errorMsg:kRequestErrorMessage);
    }];
}

@end
