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
#import "CSOrganizationViewController.h"//组织管理页面
#import "CSPersonManageViewController.h"// 人员管理页面
#import "CSZiroomBusnissManage.h"
#import "CSDataSave.h"
#import "CSLoginModel.h"
#import "CSBannerListModel.h"
#import "CSAnounceListModel.h"
#import "CSAnnouncementViewController.h"
#import "CSWebViewController.h"

static NSString *const kCSZiroomViewMessageCellReuseIdentifier = @"kCSZiroomViewMessageCellReuseIdentifier";

@interface CSZiroomViewController ()<UITableViewDelegate,UITableViewDataSource,CSZiroomHomeHeadViewDelegate>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic, strong) CSZiroomHomeHeadView *headerView;
@property (nonatomic, strong) CSBannerListModel * model;
@property (nonatomic, strong) CSAnounceListModel * anounceListModel;
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
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:[CSDataSave getUserID] forKey:@"userId"];
    @weakify(self);
    [CSZiroomBusnissManage getBannerListWithParams:dic WithModel:[CSBannerListModel class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        @strongify(self);
        self.model = logicDicData;
        NSMutableArray *imgArr = [NSMutableArray arrayWithCapacity:0];
        for(CSBannerModel *imgModel in self.model.bannerList){
            [imgArr addObject:imgModel.pic];
        }
        self.headerView.infiniteCarouselView.imageURLStringsGroup = imgArr;
        [self.tableView reloadData];
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        [self.view makeToast:errorMsg];
    }];
    
    NSMutableDictionary *dic2 = [[NSMutableDictionary alloc] init];
    [dic2 setValue:[CSDataSave getUserID] forKey:@"userId"];
    [dic2 setValue:[NSNumber numberWithInteger:2] forKey:@"noticeStatus"];
    [CSZiroomBusnissManage getNoticeListWithParams:dic2 WithModel:[CSAnounceListModel class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        @strongify(self);
        self.anounceListModel = logicDicData;
        [self.tableView reloadData];
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        [self.view makeToast:errorMsg];
    }];
}

#pragma mark - UITableView delegate and datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.anounceListModel.list.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  [CSZiroomViewMessageCell getCellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CSZiroomViewMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:kCSZiroomViewMessageCellReuseIdentifier forIndexPath:indexPath];
    CSAnounceDetailModel * model = self.anounceListModel.list[indexPath.row];
    cell.nameLabel.text = model.noticeTitle
    ;
    cell.infoLabel.text = model.noticeDetail;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CSAnounceDetailModel * model = self.anounceListModel.list[indexPath.row];
    CSAnnouncementViewController * vc = [CSAnnouncementViewController new];
    vc.model = model;
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - HeaderViewDelegate -----

-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    CSBannerModel *imgModel = self.model.bannerList[index];
    if(imgModel.type == 1){
        CSWebViewController *web = [[CSWebViewController alloc] init];
        [web setWebWithUrl:imgModel.url];
        [self.navigationController pushViewController:web animated:YES];
    }
    if(imgModel.type == 2){
        CSAnnouncementViewController * vc = [CSAnnouncementViewController new];
        vc.noticeId = imgModel.noticeId;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

-(void)announcementAction{
    
    CSAnnounceListViewController *vc = [[CSAnnounceListViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)approvalAction {

    
    
}


- (void)blackListAction {
    
}


- (void)checkInAction {
    
}


- (void)clockInAction {
    [self.view showHUD];
    sleep(0.6);
    [self.view hideHUD];
    [self.view makeToast:@"打卡成功"];
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
