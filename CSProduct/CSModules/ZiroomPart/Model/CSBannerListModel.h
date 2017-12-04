//
//  CSBannerListModel.h
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/4.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <JSONModel/JSONModel.h>


@protocol CSBannerModel

@end

@protocol CSFnModel

@end

@interface CSFnModel : JSONModel

@property (nonatomic,assign) NSInteger fnCode;
@property (nonatomic,copy) NSString *fnValue;

@end

@interface CSBannerModel : JSONModel

@property (nonatomic,assign) NSInteger type;//1:h5 2:公告
@property (nonatomic,assign) NSInteger noticeId;
@property (nonatomic,copy) NSString *pic;
@property (nonatomic,copy) NSString *url;

@end


@interface CSBannerListModel : JSONModel

@property (nonatomic,strong) NSArray <CSBannerModel> *bannerList;
@property (nonatomic,strong) NSArray <CSFnModel> *fnList;

@end
