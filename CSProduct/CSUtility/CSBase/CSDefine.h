//
//  CSDefine.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/26.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#ifndef CSProduct_CSDefine_h
#define CSProduct_CSDefine_h
#import "CSWebRequestSets.h"
// 登录信息
#import "CSDataSave.h"
// 登录页面
#import "LoginViewController.h"
//下拉
#import "MJRefresh.h"
//控制键盘
#import "IQKeyboardManager.h"
//自动布局
#import <Masonry.h>
//视图属性扩展
#import "UIView+ViewProperty.h"

#import "BaseViewController.h"

#import <MBProgressHUD/MBProgressHUD.h>

#import "UIView+ZRToast.h"

#import "SDImageCache.h"

#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"


// 屏幕宽高
#define CSScreenWidth  [UIScreen mainScreen].bounds.size.width
#define CSScreenHeight  [UIScreen mainScreen].bounds.size.height

/**_________________UI设置_________________________*/

//导航栏标题字体大小
#define  kNavBarTitleFont [UIFont systemFontOfSize:17]

//导航栏标题颜色
#define  kNavBarTitleColor [UIColor blackColor]

//headerInSectionHeight高度
#define  kHeaderInSectionHeight 12

//headerInSectionHeight高度
#define  kFooterInSectionHeight 12

//轮播图滚动的时间
#define  kRotationTime 2

//cell右侧箭头的距离
#define kMarkRightDistance 30

//navBar+statusBar的高度
#define kNavBarAndStatusBarHeight 64

//cell背景顶部的距离
#define kCellBgTopDistance 5

//cell背景用于拉伸点的X坐标
#define kCellBgLeftCapWidth 10

//cell背景用于拉伸点的Y坐标
#define kCellBgTopCapHeight 10

//导航栏按钮的长度
#define kNavBtnWidth 80

//导航栏按钮的高度
#define kNavBtnHeight 44

//FixedSpace
#define kNavigationFixedSpace 0

//底部按钮距离屏幕底部的距离
#define kBottomBtnDistance 16

//背景view的颜色
#define kCellBgViewColor [UIColor whiteColor]

//确定按钮的高度
#define kSureButtonHeight 44

//新的确定按钮的高度
#define kNewSureButtonHeight 48

//提示的持续时间
#define kToastDuration 1.5

//延时调用
#define kDelayInSeconds 1.5

//透明度
#define kAlpha 0.5


//间隔高度
#pragma mark - Offset
//屏幕高度
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
//屏幕宽度
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
//5s屏幕高度
#define IPHONE_SCREEN_HEIGHT 568

/**Nav高度*/
#define NAVI_BAR_HEIGHT 64
#define kNavBarHeight 64
//tabbar高度
#define TABBAR_HEIGHT 49
#define kTabBarHeight 49
//页面控件之间的上下、左右间距
#define kOffsetEdge 12
//页面控件之间的上下、左右间距
#define kNewOffsetEdge 16
//新的页面,页面控件之间的上下、左右间距
#define kSecondOffsetEdge 24
//基础间距
#define kOffset 12
//基础间距
#define kNewOffset 12

//一般cell的高度
#define kCellHeight 50
//保洁cell的高度
#define kServiceCleanCellHeight 58
//cell中页眉或页尾的高度
#define kCellHeadOrFootHeight 0.1f
//文本框的高度
#define kTextFieldHeight 44

//单选框的高度
#define kSelectButtonHeight 20

//分享领券banner的高度
#define kShareVoucherBannerHeight 90


/**_________________颜色设置_________________________*/
//颜色
#pragma mark - Color
//通过三色值获取颜色对象
#define rgb(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//字体深灰色
#define kColorDarkGrayColor rgb(153, 153, 153, 1.0)
//背景浅灰色
#define kColorLightGrayColor rgb(238, 238, 238, 1.0)
//粉红色(红色)
#define kColorPinkColor rgb(225, 94, 87, 1.0)
//按键点击变色（深红色）
#define kColorButtonSelectColor rgb(228, 70, 65, 1.0)
//白色
#define kColorWhiteColor rgb(255, 255, 255, 1.0)
//蓝色
#define kColorBlueColor rgb(42, 130, 255, 1.0)
//绿色
#define kColorGreenColor rgb(68, 145, 57, 1.0)
//无颜色
#define kColorCleanColor [UIColor clearColor]

//标题颜色(黑色)
#define kColorTitleColor UIColorFromRGB(0x444444)
//详情颜色(灰色)
#define kColorDetailColor UIColorFromRGB(0x999999)
//分割线
#define kColorLineColor UIColorFromRGB(0xEEEEEE)


/**_________________字体设置_________________________*/
#define kPingFangSCRegularFontOfSize(a) [UIFont fontWithName:@"PingFangSC-Regular" size:(a)]
#define kPingFangSCMediumFontOfSize(a) [UIFont fontWithName:@"PingFangSC-Medium" size:(a)]
#define kPingFangSCLightFontOfSize(a) [UIFont fontWithName:@"PingFangSC-Light" size:(a)]
#define kPingFangSCSemiboldFontOfSize(a) [UIFont fontWithName:@"PingFangSC-Semibold" size:(a)]

/**
 字体
 */
#define kCommonRegularFontOfSize(a) kPingFangSCRegularFontOfSize(a)?:[UIFont systemFontOfSize:(a)]
#define kCommonMediumFontOfSize(a) kPingFangSCMediumFontOfSize(a)?:[UIFont systemFontOfSize:(a)]
#define kCommonLightFontOfSize(a) kPingFangSCLightFontOfSize(a)?:[UIFont systemFontOfSize:(a)]
#define kCommonBoldFontOfSize(a) kPingFangSCSemiboldFontOfSize(a)?:[UIFont systemFontOfSize:(a)]

/**
     颜色
 */
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorFromRGBA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]


#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif


#endif

