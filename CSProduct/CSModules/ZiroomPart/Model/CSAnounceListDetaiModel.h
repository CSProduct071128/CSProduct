//
//  CSAnounceDetailModel.h
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/3.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CSAnounceListDetaiModel : JSONModel

@property (nonatomic,strong) NSArray <NSString *> *userList;
@property (nonatomic,strong) NSArray <NSString *> *picList;
@property (nonatomic,copy) NSString *noticeDetail;
@property (nonatomic,copy) NSString *noticeStatus;
@property (nonatomic,copy) NSString *noticeTime;
@property (nonatomic,copy) NSString *noticeTitle;
@property (nonatomic,copy) NSString *skipCount;

@end
