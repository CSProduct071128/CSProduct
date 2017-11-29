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


static NSString *const kCSZiroomViewMessageCellReuseIdentifier = @"kCSZiroomViewMessageCellReuseIdentifier";

@interface CSZiroomViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic, strong) CSZiroomHomeHeadView *headerView;
@end

@implementation CSZiroomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
     [self loadTableView];
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
        header.frame = CGRectMake(0, 0, SCREEN_WIDTH,500);
        _headerView = header;
    }
    return _headerView;
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 
@end
