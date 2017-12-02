//
//  CSZiroomViewController.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/28.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSZiroomViewController.h"
#import <Masonry.h>
#import "CSZiroomViewMessageCell.h"
#import "CSZiroomHomeHeadView.h"
#import "LoginViewController.h"
#import "CSAnnounceListViewController.h"
#import "CSEmpleeJoinController.h"
#import "CSOrganizationViewController.h"//组织管理页面
#import "CSPersonManageViewController.h"// 人员管理页面

static NSString *const kCSZiroomViewMessageCellReuseIdentifier = @"kCSZiroomViewMessageCellReuseIdentifier";

@interface CSZiroomViewController ()<UITableViewDelegate,UITableViewDataSource,CSZiroomHomeHeadViewDelegate>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic, strong) CSZiroomHomeHeadView *headerView;
@end

@implementation CSZiroomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadTableView];
    [self loadData];
}
-(void)loadTableView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = ({
        UITableView *table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self.view addSubview:table];
        [table mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
      [table registerClass:[CSZiroomViewMessageCell class] forCellReuseIdentifier:kCSZiroomViewMessageCellReuseIdentifier];
        table.separatorStyle = UITableViewCellSeparatorStyleNone;
        table.delegate = self;
        table.dataSource = self;
        table.backgroundColor = UIColorFromRGB(0xf9f9f9);
        table;
    });
    self.tableView.tableHeaderView = self.headerView;
}
 
-(CSZiroomHomeHeadView *)headerView{
    if(!_headerView){
        CSZiroomHomeHeadView *header = [[CSZiroomHomeHeadView alloc] init];
        header.viewController = self;
        header.delegate = self;
        header.frame = CGRectMake(0, 0, SCREEN_WIDTH,500);
        _headerView = header;
    }
    return _headerView;
}

-(void)loadData{
    
    self.headerView.infiniteCarouselView.imageURLStringsGroup = @[@"https://ss1.bdstatic.com/kvoZeXSm1A5BphGlnYG/skin_zoom/125.jpg",@"https://ss1.bdstatic.com/kvoZeXSm1A5BphGlnYG/skin_zoom/126.jpg",@"https://ss1.bdstatic.com/kvoZeXSm1A5BphGlnYG/skin_zoom/127.jpg"];
    [self.tableView reloadData];
}

#pragma mark - UITableView delegate and datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  [CSZiroomViewMessageCell getCellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CSZiroomViewMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:kCSZiroomViewMessageCellReuseIdentifier forIndexPath:indexPath];
    cell.nameLabel.text = @"公告标题";
    cell.infoLabel.text = @"公告内容摘要";
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
#pragma mark - HeaderViewDelegate -----
-(void)announcementAction{
    
    CSAnnounceListViewController *vc = [[CSAnnounceListViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)approvalAction {
    
    CSEmpleeJoinController *vc = [[CSEmpleeJoinController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)blackListAction {
    
}


- (void)checkInAction {
    
}


- (void)clockInAction {
    
}


- (void)groupChangeAction {
    CSOrganizationViewController *vc = [[CSOrganizationViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)holidayAction {
    
}


- (void)managerAction {
    CSPersonManageViewController *vc = [[CSPersonManageViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
