//
//  CSAnnounceListViewController.m
//  CSProduct
//
//  Created by LiGuoTing on 2017/11/30.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSAnnounceListViewController.h"
#import <Masonry.h>
#import "CSZiroomViewMessageCell.h"
#import "CSZiroomHomeHeadView.h"
#import "CSAnnouncementViewController.h"
#import "CSPushAnnounceViewController.h"

static NSString *const kCSZiroomViewMessageCellReuseIdentifier = @"kCSZiroomViewMessageCellReuseIdentifier";

@interface CSAnnounceListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@end

@implementation CSAnnounceListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"公告管理";
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadTableView];
    [self addRightBtn];
}
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:YES];
//    self.navigationController.navigationBar.hidden = NO;
//}
//-(void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:YES];
//    self.navigationController.navigationBar.hidden = YES;
//}
-(void)loadTableView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = ({
        UITableView *table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:table];
        [table mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, 0, 0));
        }];
        [table registerClass:[CSZiroomViewMessageCell class] forCellReuseIdentifier:kCSZiroomViewMessageCellReuseIdentifier];
        table.separatorStyle = UITableViewCellSeparatorStyleNone;
        table.delegate = self;
        table.dataSource = self;
        table.backgroundColor = UIColorFromRGB(0xf9f9f9);
        table;
    });
}
#pragma mark - addRightBtn
- (void)addRightBtn{
    UIButton *checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [checkBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [checkBtn setImage:[UIImage imageNamed:@"zrk_ic_good_add_n"] forState:UIControlStateNormal];
    [checkBtn sizeToFit];
    UIBarButtonItem *settingBtnItem = [[UIBarButtonItem alloc] initWithCustomView:checkBtn];
    
    self.navigationItem.rightBarButtonItems  = @[settingBtnItem];
}
#pragma mark - UITableView delegate and datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
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
    CSAnnouncementViewController * vc = [CSAnnouncementViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)setNavItem{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 44, 64);
    [rightBtn setImage:[UIImage imageNamed:@"zrk_ic_good_add_n"] forState:UIControlStateSelected];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [rightBtn setTitleColor:UIColorFromRGB(0x444444) forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    rightItem.width=64;
    //    UIBarButtonItem *navigationSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //    navigationSpace.width = -20 + 6;
    self.navigationItem.rightBarButtonItem = rightItem;
}

-(void)rightBtnClick:(UIButton *)btn{
    
    CSPushAnnounceViewController * vc = [CSPushAnnounceViewController new];
    [self.navigationController pushViewController:vc animated:YES];
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
