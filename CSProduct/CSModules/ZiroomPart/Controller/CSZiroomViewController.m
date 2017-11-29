//
//  CSZiroomViewController.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/28.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSZiroomViewController.h"
#import "LoginViewController.h"

@interface CSZiroomViewController ()

@end

@implementation CSZiroomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    /* 获取storyboard的InitialViewController 即根控制器*/
    LoginViewController *VC= [storyboard instantiateViewControllerWithIdentifier:@"LoginViewCtl"];//(这个过程需要在StoryBoard中设置目标视图的Custom Class和StoryBoard ID)

    [self presentViewController:VC animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
