//
//  CSZiroomNavController.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/28.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSZiroomNavController.h"
#import "CSZiroomViewController.h"

@interface CSZiroomNavController ()

@end

@implementation CSZiroomNavController
-(void)awakeFromNib{
    [super awakeFromNib];
    CSZiroomViewController *ziroomVC = [[CSZiroomViewController alloc] init];
    [self setViewControllers:@[ziroomVC] animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
