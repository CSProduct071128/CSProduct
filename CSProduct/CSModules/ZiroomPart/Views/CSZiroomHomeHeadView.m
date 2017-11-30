//
//  CSZiroomHomeHeadView.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSZiroomHomeHeadView.h"
#import "CSMenuButton.h"

#define ImageHeaderHeight 250

@interface CSZiroomHomeHeadView()<SDCycleScrollViewDelegate>

@end

@implementation CSZiroomHomeHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configTableViewHeaderView];
        self.backgroundColor =UIColorFromRGB(0xf9f9f9);
    }
    return self;
}
- (void)configTableViewHeaderView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,500)];
    headerView.backgroundColor = [UIColor whiteColor];
    headerView.userInteractionEnabled = YES;
    headerView.layer.masksToBounds = NO;
    [self addSubview: headerView];
    
    [headerView addSubview:self.infiniteCarouselView];
    
    // “收藏”、“约看”、“订单”等按钮view的创建
    UIView *headerButtonsView = [[UIView alloc] init];
    [headerView addSubview:headerButtonsView];
    headerButtonsView.backgroundColor = [UIColor whiteColor];
    [headerButtonsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headerView).offset(250);
        make.left.right.bottom.equalTo(headerView);
    }];
    
    
    NSArray * buttons = @[
                              @{@"title":@"打卡",
                                @"image":@"ic_check_in",
                                @"actionMethod":@"clockInAction"},
                              @{@"title":@"考勤日历",
                                @"image":@"ic_calendar",
                                @"actionMethod":@"checkInAction"},
                              @{@"title":@"请假申请",
                                @"image":@"ic_apply",
                                @"actionMethod":@"holidayAction"},
                              @{@"title":@"人员管理",
                                @"image":@"ic_employee",
                                @"actionMethod":@"managerAction"},
                              @{@"title":@"组织调整",
                                @"image":@"ic_organization",
                                @"actionMethod":@"groupChangeAction"},
                              @{@"title":@"公告",
                                @"image":@"ic_notice",
                                @"actionMethod":@"announcementAction"},
                              @{@"title":@"黑名单",
                                @"image":@"ic_dark_list",
                                @"actionMethod":@"blackListAction"},
                              @{@"title":@"申请审批",
                                @"image":@"ic_approval",
                                @"actionMethod":@"approvalAction"}
                              ];
 
    
    for (NSUInteger i = 0; i < buttons.count; i ++) {
            NSDictionary *dataDic = (NSDictionary *)buttons[i];
            CSMenuButton *menuButton = [CSMenuButton buttonWithType:UIButtonTypeCustom];
            [headerButtonsView addSubview:menuButton];
            CGFloat buttonHeight = 80;
            CGFloat buttonWidth = 50;
            CGFloat seperator = (SCREEN_WIDTH - buttonWidth*3) / 4.0;
            menuButton.frame = CGRectMake(seperator+i%3*(buttonWidth+seperator), 24+i/3*(buttonHeight), buttonWidth, buttonHeight);
            [menuButton setTitle:dataDic[@"title"] forState:UIControlStateNormal];
            menuButton.titleLabel.font =  [UIFont systemFontOfSize:12.0f];
            [menuButton setTitleColor:UIColorFromRGB(0x444444) forState:UIControlStateNormal];
            [menuButton setImage:[UIImage imageNamed:dataDic[@"image"]] forState:UIControlStateNormal];
            menuButton.backgroundColor = [UIColor whiteColor];
            [menuButton addTarget:self action:NSSelectorFromString(dataDic[@"actionMethod"]) forControlEvents:UIControlEventTouchUpInside];
    }
    
}
- (SDCycleScrollView *)infiniteCarouselView{
    if (!_infiniteCarouselView) {
        CGFloat w = CGRectGetWidth(self.bounds);
        CGRect r = CGRectMake(0, 0, w, ImageHeaderHeight);
        SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:r delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
        cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        cycleScrollView2.showPageControl = NO;
        //        cycleScrollView2.autoScrollTimeInterval = 5;
        cycleScrollView2.autoScroll = NO;
        cycleScrollView2.placeholderImage = [UIImage imageNamed:@"zr_placeholder"];
        cycleScrollView2.bannerImageViewContentMode = UIViewContentModeScaleAspectFit;
        _infiniteCarouselView = cycleScrollView2;
    }
    return _infiniteCarouselView;
}
#pragma mark ----- CycleScrollView Delegate
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    
    
}
#pragma mark 浏览图片

/**
 *  @breif:浏览图片
 */
- (void)photosBrowser:(NSArray *)photourls offset:(NSUInteger)index{
    //obj ---
    
}

#pragma mark - BtnActions -----
// 打卡 点击
- (void)clockInAction
{
    
    
}
// 考勤日历 点击
- (void)checkInAction
{
    
    
}
// 请假申请 点击
- (void)holidayAction
{
    
    
}
// 人员管理 点击
- (void)managerAction
{
    
    
}
// 组织调整 点击
- (void)groupChangeAction
{
    
    
}
// 公告 点击
- (void)announcementAction
{
    
    
}
// 黑名单 点击
- (void)blackListAction
{
    
    
}
// 申请审批 点击
- (void)approvalAction
{
    
    
}
@end
