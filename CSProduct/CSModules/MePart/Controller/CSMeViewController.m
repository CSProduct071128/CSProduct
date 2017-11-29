//
//  MeViewController.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/28.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSMeViewController.h"
#import "CSMeCell.h"
#import "CSMeHeadView.h"
#import "CSMeFootView.h"
#import "CSMeBusnissManage.h"

@interface CSMeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    CSMeBusnissManage *busnissManage;
    CSMeHeadView *headView;
}
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation CSMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self tableView];
    [self footViewShow];
    [self headViewShow];
    [self dataLoading];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - data Loading
- (void)dataLoading{
    busnissManage  = [CSMeBusnissManage sharedInstance];
    [self.view showHUD];
    [busnissManage getMeViewShowDataWithBlock:^(NSArray *cellDataSets, NSArray *headDataArray, NSString *errorStr) {
//        [self.view hideHUD];
        if (errorStr.length) {
            [self.view makeToast:errorStr];
        }
        if (headDataArray.count) {
            headView;
        }
        [self.tableView reloadData];
    }];
}

#pragma mark - UI Sets
/**
 主视图view
 */
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
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        // 注册cell
        [_tableView registerClass:[CSMeCell class] forCellReuseIdentifier:kCSMeCell_ID];
        
    }
    return _tableView;
}

#pragma mark - tableview Delegate !
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
};

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSDictionary * dictModel = [self.dataArray objectAtIndex:indexPath.section];
        CSMeCell *cell = [tableView dequeueReusableCellWithIdentifier:kCSMeCell_ID];
    
        return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 49.f;
}

#pragma mark - headViewShow
- (void)headViewShow{
    headView = [[CSMeHeadView alloc] init];
    [self.tableView setTableFooterView:headView];
}

#pragma mark - footViewShow
- (void)footViewShow{
    CSMeFootView *footView = [[CSMeFootView alloc] init];
    [self.tableView setTableFooterView:footView];
}


@end
