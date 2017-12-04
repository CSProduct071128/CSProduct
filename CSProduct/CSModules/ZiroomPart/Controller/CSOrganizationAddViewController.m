//
//  CSOrganizationAddViewController.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSOrganizationAddViewController.h"
#import "CSOrganizationSelPersonViewController.h"// 人员选择
#import "CSOrganizationAddOriNameCell.h"
#import "CSOrganizationAddOriTipsCell.h"
#import "CSOrganizationAddSelCell.h"
#import "CSOrganizationBusiness.h"
#import "CSParentmentListController.h"

@interface CSOrganizationAddViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , copy) NSString *parentmentStr;

@end

@implementation CSOrganizationAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"新增组织";
    _parentmentStr = @"请选择上级部门";
    [self addRightBtn];
    [self tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - addRightBtn
- (void)addRightBtn{
    UIButton *checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [checkBtn addTarget:self action:@selector(checkBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [checkBtn setImage:[UIImage imageNamed:@"select_ic"] forState:UIControlStateNormal];
    [checkBtn sizeToFit];
    UIBarButtonItem *settingBtnItem = [[UIBarButtonItem alloc] initWithCustomView:checkBtn];
    
    self.navigationItem.rightBarButtonItems  = @[settingBtnItem];
}

- (void)checkBtnClick:(UIButton *)send{
    NSLog(@"添加");
    [self request];
}

#pragma mark - uitableView
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundView = nil;
        _tableView.backgroundColor =[UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _tableView.bounces = NO;
        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, 0, 0));
        }];
        // 注册cell
        [_tableView registerClass:[CSOrganizationAddOriNameCell class] forCellReuseIdentifier:kCSOrganizationAddOriNameCell];
        [_tableView registerClass:[CSOrganizationAddOriTipsCell class] forCellReuseIdentifier:kCSOrganizationAddOriTipsCell];
        [_tableView registerClass:[CSOrganizationAddSelCell class] forCellReuseIdentifier:kCSOrganizationAddSelCell];
        
    }
    return _tableView;
}

#pragma mark - tableview Delegate !
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return nil;
    }else{
        UIView *speView = [[UIView alloc] init];
        speView.backgroundColor= UIColorFromRGB(0xEEEEEE);
        return speView;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
};

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        CSOrganizationAddOriNameCell *cell = [tableView dequeueReusableCellWithIdentifier:kCSOrganizationAddOriNameCell];
        return cell;
    }else if (indexPath.section == 1){
        CSOrganizationAddSelCell *cell = [tableView dequeueReusableCellWithIdentifier:kCSOrganizationAddSelCell];
        [cell setTitle:@"上级组织：" andContent:_parentmentStr];
        return cell;

    }else if (indexPath.section == 2){
        CSOrganizationAddOriTipsCell *cell = [tableView dequeueReusableCellWithIdentifier:kCSOrganizationAddOriTipsCell];
        return cell;
        
    }else{
        CSOrganizationAddSelCell *cell = [tableView dequeueReusableCellWithIdentifier:kCSOrganizationAddSelCell];
        [cell setTitle:@"组织成员：" andContent:@"请选择组织人员"];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.01f;
    }else{
        return 24.f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        return 200;
    }else{
        return 49.f;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        CSParentmentListController  * vc = [CSParentmentListController new];
        vc.SelectParentmentListBlock = ^(NSArray *SelectParentmentList) {
            NSLog(@"选择的部门有：%@",SelectParentmentList);
            _parentmentStr = @"";
            for (int i=0; i < SelectParentmentList.count ; i++) {
                NSDictionary *sel = SelectParentmentList[i];
                if ([[sel objectForKey:@"isSelect"] integerValue]==1) {
                    if (_parentmentStr.length) {
                        _parentmentStr = [NSString stringWithFormat:@"%@、%@",_parentmentStr,[sel objectForKey:@"text"]];
                    }else{
                        _parentmentStr = [NSString stringWithFormat:@"%@",[sel objectForKey:@"text"]];
                    }
                }
            }
            [self.tableView reloadData];
        };
        [self.navigationController pushViewController:vc animated:YES];

    }else if (indexPath.section == 3){
        CSOrganizationSelPersonViewController *vc = [[CSOrganizationSelPersonViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - request add ori
- (void)request{
    [CSOrganizationBusiness saveOrganizationConstructionWithParentDepId:_infoModel.depRootId andDepName:@"开发组009" andtype:[_infoModel.type integerValue] andCompletion:^(BOOL isFinish, NSString *errorMessage) {
        if (isFinish) {
            [self.view makeToast:@"保存成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
}
@end
