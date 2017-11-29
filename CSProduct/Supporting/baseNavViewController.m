//
//  baseNavViewController.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "baseNavViewController.h"
#import "rootTabBarController.h"


@interface baseNavViewController ()

@property (nonatomic,strong) NSString *title;

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

#pragma mark - setTitle
-(void)setTitle:(NSString *)title{
    self.title = title;
}

#pragma mark - push and Pop
/**
 when rootView Push , nav hidden = NO ;tabBar hidden = Yes;
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];

    if ([[self getCurrentVC] isKindOfClass:[rootTabBarController class]]) {
        self.navigationBar.hidden  = NO;
        UITabBarController *tabBarCtl =  (UITabBarController *)[self getCurrentVC];
        tabBarCtl.tabBar.hidden = YES;
    }
}

/**
 when rootView popBack , nav hidden = YES ;tabBar hidden = NO;
 */
- (UIViewController *)popViewControllerAnimated:(BOOL)animated{
    [super popViewControllerAnimated:animated];
    UIViewController *resultVC = [self getCurrentVC];
    if ([resultVC isKindOfClass:[rootTabBarController class]]) {
        self.navigationBar.hidden  = YES;
        UITabBarController *tabBarCtl =  (UITabBarController *)[self getCurrentVC];
        tabBarCtl.tabBar.hidden = NO;
    }

    return resultVC;
}

/**
 获取当前vc
 */
- (UIViewController *)getCurrentVC
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

@end
