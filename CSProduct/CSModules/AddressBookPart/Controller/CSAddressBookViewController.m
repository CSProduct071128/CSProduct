//
//  CSAddressBookViewController.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/28.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSAddressBookViewController.h"
#import "CSOrganizationChartView.h"

@interface CSAddressBookViewController ()

@end

@implementation CSAddressBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *org = @[@"1",@"2",@"3",@"4"];
    NSArray *person = @[@"q",@"w",@"e",@"r",@"t",@"y",@"z",@"x",@"c",@"v",@"b"];
    NSArray *head = @[@"北京自如信息科技",@"无线研发组",@"金融与生活服务组",@"组织架构"];

    CSOrganizationChartView *organizationView = [[CSOrganizationChartView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:organizationView];
    
    organizationView.selOrigitionBlock = ^(NSInteger number) {
        NSLog(@"选择了哪个组织？编号是:%ld",number);
        NSLog(@"选择了%@组织",org[number]);
    };
    
    organizationView.selPersonBlock = ^(NSInteger number) {
        NSLog(@"选择了哪个人？编号是:%ld",number);
        NSLog(@"选择了%@人",person[number]);
    };
    
    [organizationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64.f);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    [organizationView showDataWithOrgArray:org andPersonArray:person andHeadDataArray:head];
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
