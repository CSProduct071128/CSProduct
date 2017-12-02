//
//  LoginViewController.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *accountText;
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *passWordText;

@end

@implementation LoginViewController

+(void)loginaWithCtl:(UIViewController *)favc{
    if (![favc isKindOfClass:[LoginViewController class]]) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        /* 获取storyboard的InitialViewController 即根控制器*/
        LoginViewController *VC= [storyboard instantiateViewControllerWithIdentifier:@"LoginViewCtl"];//(这个过程需要在StoryBoard中设置目标视图的Custom Class和StoryBoard ID)
        [favc presentViewController:VC animated:YES completion:^{
        }];
    }
}

-(void)awakeFromNib{
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_loginBtn addTarget:self action:@selector(loginClick:) forControlEvents:(UIControlEventTouchUpInside)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginClick:(UIButton *)send{
    NSLog(@"登录按钮！");
    CSDataSave *info = [[CSDataSave alloc] init];
    info.isLogin = YES;
    [CSDataSave encodeWithModel:info];
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

@end
