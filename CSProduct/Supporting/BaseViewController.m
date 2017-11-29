//
//  BaseViewController.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@implementation UIScrollView (FixXcodeNine)

+ (void)load
{
    Method myMethod = class_getInstanceMethod([self class], @selector(initWithFrame:));
    Method newMyMethod = class_getInstanceMethod([self class], @selector(zrScrollViewInitWithFrame:));
    method_exchangeImplementations(myMethod, newMyMethod);
}

- (instancetype)zrScrollViewInitWithFrame:(CGRect)frame
{
#ifdef __IPHONE_11_0
    if (@available(iOS 11.0, *)){
        UIScrollView *scrollView = [self zrScrollViewInitWithFrame:frame];
        
        if ([scrollView isKindOfClass:NSClassFromString(@"WKScrollView")]) {
            return scrollView;
        }
        
        // 不让系统调整布局
        if ([scrollView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
            scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        return scrollView;
    } else {
        return [self zrScrollViewInitWithFrame:frame];
    }
#else
    return [self zrScrollViewInitWithFrame:frame];
#endif
}

@end

@implementation UITableView (FixXcodeNine)

+ (void)load
{
    Method myMethod = class_getInstanceMethod([self class], @selector(initWithFrame:style:));
    Method newMyMethod = class_getInstanceMethod([self class], @selector(zrInitWithFrame:style:));
    method_exchangeImplementations(myMethod, newMyMethod);
}

- (instancetype)zrInitWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
#ifdef __IPHONE_11_0
    if (@available(iOS 11.0, *)){
        UITableView *tableView = [self zrInitWithFrame:frame style:style];
        // 适配iOS11 关闭Self-Sizing
        tableView.estimatedRowHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
        return tableView;
    } else {
        return [self zrInitWithFrame:frame style:style];
    }
#else
    return [self zrInitWithFrame:frame style:style];
#endif
}

@end

