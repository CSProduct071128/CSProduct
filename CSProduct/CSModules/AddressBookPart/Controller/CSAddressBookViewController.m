//
//  CSAddressBookViewController.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/28.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSAddressBookViewController.h"
#import "CSOrganizationChartView.h"
#import "CSSearchView.h"
#import "CSOrganizationBusiness.h"
#import "CSPersonInfoViewController.h" // 个人信息页面

@interface CSAddressBookViewController ()<UISearchBarDelegate,CSSearchViewDelegate>
{
    UISearchBar *_searchBar;
    CSOrganizationChartView *organizationView;
}
@property (nonatomic,strong) NSMutableArray *showTitleArray;
@property (nonatomic,strong) NSMutableArray *showTitleStrArray;
@property (nonatomic,strong) NSArray *oriArray;
@property (nonatomic,strong) NSArray *perArray;
@property (nonatomic,strong) CSOrganizationModel *infoModel;

@end

@implementation CSAddressBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.showTitleArray = [NSMutableArray arrayWithCapacity:0];
    self.showTitleStrArray = [NSMutableArray arrayWithCapacity:0];
    // 获取组织结构
    NSString *depid = _infoModel.depRootId?_infoModel.depRootId:@"0";
    NSString *depName = _infoModel.depRootName?_infoModel.depRootName:@"";
    NSString *depType = _infoModel.type?_infoModel.type:@"0";
    [self getgetOrganizationWithDepId:depid DepName:depName andType:depType];

    CSSearchView *se = [[CSSearchView alloc] initWithFrame:CGRectMake(0, 20, CSScreenWidth, kCSSearchViewHeight)];
    se.delegate = self;
    se.searchPlaceholder=@"北京自如";
    [self.view addSubview:se];
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
    if (_showTitleStrArray.count==0) {
        [_showTitleStrArray addObject:addModel.depRootName];
    }
    
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
            CSPersonInfoViewController *vc = [[CSPersonInfoViewController alloc] init];
            vc.personId = model.userId;
            [self.navigationController pushViewController:vc animated:YES];
        };
        
        [organizationView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(64.f);
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.bottom.equalTo(self.view.mas_bottom).offset(-49.f);
        }];
    }
    
    [organizationView showDataWithOrgArray:self.oriArray andPersonArray:self.perArray andHeadDataArray:self.showTitleStrArray];
}

- (void) showUpOriWithNumber:(NSInteger )number{
    for (NSInteger ll = _showTitleStrArray.count; ll>number+1; ll--) {
        [_showTitleStrArray removeLastObject];
    }
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
    [_showTitleStrArray addObject:selModel.depOneName];
    
    [self getgetOrganizationWithDepId:_infoModel.depRootId DepName:selModel.depOneName andType:selModel.type];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - delegate
- (void) textChangeGetTheText:(NSString *)text{
    NSLog(@"输入文案：%@",text);
}
@end
