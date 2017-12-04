//
//  CSAnnouncementViewController.h
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/3.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "BaseViewController.h"
#import "CSAnounceListModel.h"


@interface CSAnnouncementViewController : BaseViewController

@property (nonatomic,strong)CSAnounceDetailModel *model;

@property (nonatomic,assign) NSInteger noticeId;

@end
