//
//  CSZiroomHomeHeadView.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"


@protocol CSZiroomHomeHeadViewDelegate <NSObject>

-(void)clockInAction;
-(void)checkInAction;
-(void)holidayAction;
-(void)managerAction;
-(void)groupChangeAction;
-(void)announcementAction;
-(void)blackListAction;
-(void)approvalAction;

@end


@interface CSZiroomHomeHeadView : UIView

@property (nonatomic, strong) SDCycleScrollView *infiniteCarouselView;

@property (nonatomic, strong) UIViewController *viewController;

@property (nonatomic, weak) id<CSZiroomHomeHeadViewDelegate> delegate ;


@end
