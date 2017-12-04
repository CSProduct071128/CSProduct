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
#import "CSOrganizationChartView.h"
#import "CSSearchView.h"
#import "CSOrganizationBusiness.h"
#import "CSPersonInfoViewController.h" // 个人信息页面

@interface CSPersonManageViewController () <UISearchBarDelegate,CSSearchViewDelegate>
{
    CSOrganizationChartView *organizationView;
}
@property (nonatomic,strong) NSMutableArray *showTitleArray;
@property (nonatomic,strong) NSArray *oriArray;
@property (nonatomic,strong) NSArray *perArray;
@property (nonatomic,strong) CSOrganizationModel *infoModel;

@end

@implementation CSPersonManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"人员管理";
    self.showTitleArray = [NSMutableArray arrayWithCapacity:0];
    [self addRightBtn];
    // 获取组织结构
    NSString *depid = _infoModel.depRootId?_infoModel.depRootId:@"0";
    NSString *depName = _infoModel.depRootName?_infoModel.depRootName:@"";
    NSString *depType = _infoModel.type?_infoModel.type:@"0";
    [self getgetOrganizationWithDepId:depid DepName:depName andType:depType];
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

#pragma mark -
- (void)getgetOrganizationWithDepId:(NSString *)depId DepName:(NSString *)depName andType:(NSString *)type{
    
    [CSOrganizationBusiness getOrganizationConstructionWithUpParentDepId:depId andDepName:depName andtype:type andCompletion:^(BOOL isFinish,NSString *errorMessage,NSArray *oriArray,NSArray *perArray,CSOrganizationModel *model) {
        if (isFinish) {
            self.perArray = [NSArray arrayWithArray:perArray];
            self.oriArray = [NSArray arrayWithArray:oriArray];
            self.infoModel = model;
            [self showOrganizationView];
        }else{
            [self.view makeToast:errorMessage];
        }
    }];
}

/**
 展示组织用户页面
 */
- (void) showOrganizationView{
    CSOrganizationModel *addModel = self.infoModel;
    [self.showTitleArray addObject:addModel];
    
    [self showOrganView];
}

/**
 展示组织view
 */
- (void)showOrganView{
    @weakify(self);
    if (!organizationView) {
        organizationView = [[CSOrganizationChartView alloc] initWithFrame:CGRectZero];
        [self.view addSubview:organizationView];
        organizationView.selRootMapBlock = ^(NSInteger number) {
            @strongify(self);
            NSLog(@"选择了哪个根组织？编号是:%ld",number);
            [self showUpOriWithNumber:number];
        };
        
        organizationView.selOrigitionBlock = ^(NSInteger number) {
            @strongify(self);
            NSLog(@"选择了哪个组织？编号是:%ld",number);
            [self showNextOriWithNumber:number];
        };
        
        organizationView.selPersonBlock = ^(NSInteger number) {
            @strongify(self);
            NSLog(@"选择了哪个人？编号是:%ld",number);
            CSOrganizationUserListModel *model = self.perArray[number];
            CSEmpleeJoinController *vc = [[CSEmpleeJoinController alloc] init];
            vc.isNewPerson = NO;
            vc.userid = model.userId;
            [self.navigationController pushViewController:vc animated:YES];
        };
        
        [organizationView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(44.f);
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.bottom.equalTo(self.view.mas_bottom);
        }];
    }
    
    [organizationView showDataWithOrgArray:nil andPersonArray:self.perArray andHeadDataArray:nil];
}

- (void) showUpOriWithNumber:(NSInteger )number{
    // 缓存所有根目录数据
    NSArray *ccArray = [[NSArray alloc] initWithArray:_showTitleArray];
    //清除显示根目录数据
    [_showTitleArray removeAllObjects];
    // 重新匹配缓存数据
    for (int max = 0; max <= number; max++) {
        [_showTitleArray addObject:ccArray[max]];
    }
    // 增加之前
    CSOrganizationModel *selModel = _showTitleArray[number];
    // 用完最后一个就删掉，请求回来会重新加入一个
    [_showTitleArray removeLastObject];
    
    [self getgetOrganizationWithDepId:selModel.depRootId DepName:selModel.depRootName andType:selModel.type];
}

- (void) showNextOriWithNumber:(NSInteger )number{
    // 增加显示下一级
    CSOrganizationListModel *selModel = _infoModel.depOneList[number];
    [self getgetOrganizationWithDepId:_infoModel.depRootId DepName:selModel.depOneName andType:selModel.type];
}

- (void)checkBtnClick:(UIButton *)send{
    CSEmpleeJoinController *vc = [[CSEmpleeJoinController alloc] init];
    vc.isNewPerson = YES;
    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"添加");
}


@end
