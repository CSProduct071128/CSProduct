//
//  LoginViewController.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "LoginViewController.h"
#import "CSLoginBusinessManage.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *accountTxt;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxt;

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
    [CSLoginBusinessManage isLoginWithAccount:_accountTxt.text andPassword:_passwordTxt.text andCompletion:^(BOOL isFinish, NSString *errorMessage) {
        if (isFinish) {
            [self dismissViewControllerAnimated:YES completion:^{
            }];
        }else{
            [self.view makeToast:errorMessage];
        }
    }];
}

// 保存人员信息
//- (void)loginClick:(UIButton *)send{
//    [CSLoginBusinessManage saveUserInfoWithUserName:@"asss" andPassword:@"123456" andName:@"测试999" andSex:1 andCardNumber:@"130726199102150099" andPhone:@"185112281222" andAddress:@"北京市朝阳区" andDepartment:@"测试组" andRole:@"经理" andCompletion:^(BOOL isFinish, NSString *errorMessage) {
//
//    }];
//}

// 用户列表
//- (void)loginClick:(UIButton *)send{
//    [CSLoginBusinessManage getUserInfoListWithType:1 andCompletion:^(BOOL isFinish, NSString *errorMessage) {
//
//    }];
//}

// //
//- (void)loginClick:(UIButton *)send{
//    [CSLoginBusinessManage setUserLocationblackListWithType:(1) andUserID:@"123" andCompletion:^(BOOL isFinish, NSString *errorMessage) {
//
//    }];
//}

//
//- (void)loginClick:(UIButton *)send{
//    [CSLoginBusinessManage getblackListWithUserID:@"123456" andCompletion:^(BOOL isFinish, NSString *errorMessage) {
//
//    }];
//}

//- (void)loginClick:(UIButton *)send{
//    [CSLoginBusinessManage signInWithUserID:@"123456" andCompletion:^(BOOL isFinish, NSString *errorMessage) {
//
//    }];
//}


@end
