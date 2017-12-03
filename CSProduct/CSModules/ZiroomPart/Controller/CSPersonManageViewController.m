//
//  CSPersonManageViewController.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSPersonManageViewController.h"
#import "CSOrganizationChartView.h"
#import "CSSearchView.h"
#import "CSEmpleeJoinController.h"

@interface CSPersonManageViewController () <UISearchBarDelegate,CSSearchViewDelegate>
{
    UISearchBar *_searchBar;
}
@end

@implementation CSPersonManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"人员管理";
    [self addRightBtn];
    
    CSSearchView *se = [[CSSearchView alloc] initWithFrame:CGRectMake(0, 64, CSScreenWidth, kCSSearchViewHeight)];
    se.delegate = self;
    se.searchPlaceholder=@"北京自如";
    [self.view addSubview:se];
    
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
        make.top.equalTo(self.view).offset(64.f+kCSSearchViewHeight);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    [organizationView showDataWithOrgArray:org andPersonArray:person andHeadDataArray:head];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - addRightBtn
- (void)addRightBtn{
    UIButton *checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [checkBtn addTarget:self action:@selector(checkBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [checkBtn setImage:[UIImage imageNamed:@"zrk_ic_good_add_n"] forState:UIControlStateNormal];
    [checkBtn sizeToFit];
    UIBarButtonItem *settingBtnItem = [[UIBarButtonItem alloc] initWithCustomView:checkBtn];
    
    self.navigationItem.rightBarButtonItems  = @[settingBtnItem];
}

- (void)checkBtnClick:(UIButton *)send{
    
    CSEmpleeJoinController *vc = [[CSEmpleeJoinController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"添加");
}
#pragma mark - delegate
- (void) textChangeGetTheText:(NSString *)text{
    NSLog(@"输入文案：%@",text);
}

@end
