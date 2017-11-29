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
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
