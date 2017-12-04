//
//  baseNavViewController.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "baseNavViewController.h"
#import "rootTabBarController.h"
#import "CSZiroomViewController.h"
#import "CSAddressBookViewController.h"
#import "CSMeViewController.h"

@interface baseNavViewController ()


@end

@implementation baseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - push and Pop
/**
 when rootView Push , nav hidden = NO ;tabBar hidden = Yes;
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];

    if ([[self getCurrentCtl] isKindOfClass:[rootTabBarController class]]) {
        self.navigationBar.hidden  = NO;
        UITabBarController *tabBarCtl =  (UITabBarController *)[self getCurrentCtl];
        tabBarCtl.tabBar.hidden = YES;
    }
}

/**
 when rootView popBack , nav hidden = YES ;tabBar hidden = NO;
 */
- (UIViewController *)popViewControllerAnimated:(BOOL)animated{
    [super popViewControllerAnimated:animated];
    UIViewController *resultVC = [self getCurrentVC];
    if ([resultVC isKindOfClass:[CSZiroomViewController class]]||[resultVC isKindOfClass:[CSAddressBookViewController class]]||[resultVC isKindOfClass:[CSMeViewController class]]) {
        self.navigationBar.hidden  = YES;
        UITabBarController *tabBarCtl =  (UITabBarController *)[self getCurrentCtl];
        tabBarCtl.tabBar.hidden = NO;
    }

    return self;
}

/**
 获取当前vc
 */
- (UIViewController *)getCurrentCtl
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    //app默认windowLevel是UIWindowLevelNormal，如果不是，找到UIWindowLevelNormal的
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    id  nextResponder = nil;
    UIViewController *appRootVC=window.rootViewController;
    //    如果是present上来的appRootVC.presentedViewController 不为nil
    if (appRootVC.presentedViewController) {
        nextResponder = appRootVC.presentedViewController;
    }else{
        
        NSLog(@"===%@",[window subviews]);
        UIView *frontView = [[window subviews] objectAtIndex:0];
        nextResponder = [frontView nextResponder];
    }
    
    if ([nextResponder isKindOfClass:[UITabBarController class]]){
        UITabBarController * tabbar = (UITabBarController *)nextResponder;
        UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        //        UINavigationController * nav = tabbar.selectedViewController ; 上下两种写法都行
        result=nav.childViewControllers.lastObject;
        
    }else if ([nextResponder isKindOfClass:[UINavigationController class]]){
        UIViewController * nav = (UIViewController *)nextResponder;
        result = nav.childViewControllers.lastObject;
    }else{
        result = nextResponder;
    }
    return result;
}

@end
