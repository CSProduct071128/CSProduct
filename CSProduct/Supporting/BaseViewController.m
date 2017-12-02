//
//  BaseViewController.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "BaseViewController.h"

#define IS_IPHONE4 (([[UIScreen mainScreen] bounds].size.height == 480) ? YES : NO)

#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height == 568) ? YES : NO)

#define IS_IPhone6 (667 == [[UIScreen mainScreen] bounds].size.height ? YES : NO)

#define IS_IPhone6plus (736 == [[UIScreen mainScreen] bounds].size.height ? YES : NO)

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self customLeftBtn];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    CSDataSave *info = [CSDataSave getLoginInfo];
    if (!info.isLogin) {
        [LoginViewController loginaWithCtl:self];
    }
}

#pragma mark - backBtn!
- (void)customLeftBtn{
    UIBarButtonItem *left_fixedItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    left_fixedItem.width = -6;
    if (IS_IPhone6plus) {
        left_fixedItem.width = -10;
    }
    UIButton *btn = [self buttonWithNavgationGotoBackWithTarget:self sel:@selector(tapBackBtn)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [self.navigationItem setLeftBarButtonItems:@[left_fixedItem,item]];
#ifdef __IPHONE_11_0
    if (@available(iOS 11.0, *)){
        CGFloat fixValue = -5.0f;
        if (IS_IPhone6plus) {
            fixValue = -8.0f;
        }
        btn.contentHorizontalAlignment =UIControlContentHorizontalAlignmentLeft;
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, fixValue *CSScreenWidth /375.0,0,0)];
    } else {
        
    }
#endif
}

- (UIButton *)buttonWithNavgationGotoBackWithTarget:(id)target sel:(SEL)sel{
    UIButton *button = [UIButton new];
    [button setImage:[UIImage imageNamed:@"zrk_ic_back"] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, button.currentImage.size.width, button.currentImage.size.height);
    //    button.frame = CGRectMake(0, 0, 44.f, 44.f);
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return button;
}

//点击返回按钮
-(void)tapBackBtn{
    [self goBack];
}

//返回
-(void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
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

