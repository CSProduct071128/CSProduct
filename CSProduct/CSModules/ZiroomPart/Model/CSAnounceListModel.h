//
//  CSAnounceListModel.h
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/3.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol CSAnounceDetailModel

@end
@interface CSAnounceDetailModel : JSONModel

@property (nonatomic,copy) NSString *noticeDetail;
@property (nonatomic,assign) long time;
@property (nonatomic,assign) NSInteger noticeId;
@property (nonatomic,copy) NSString *noticeTitle;
@property (nonatomic,copy) NSString *pic;

@end

@interface CSAnounceListModel : JSONModel

@property (nonatomic,strong) NSArray <CSAnounceDetailModel> *list;

@end
