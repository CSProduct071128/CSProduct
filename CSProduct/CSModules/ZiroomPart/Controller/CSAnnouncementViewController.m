//
//  CSAnnouncementViewController.m
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/3.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSAnnouncementViewController.h"
#import "CSAnnounceTableViewCell.h"
#import "CSParentmentListController.h"
#import "CSZiroomBusnissManage.h"
#import "CSDataSave.h"
#import "CSLoginModel.h"
#import "CSAnounceListDetaiModel.h"

static NSString *const kCSCSAnnounceTableViewCellIdentifi = @"CSAnnounceTableViewCell";

@interface CSAnnouncementViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) CSAnounceListDetaiModel *model1;
@end

@implementation CSAnnouncementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"公告详情";
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadTableView];
    [self loadData];
}
-(void)loadTableView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = ({
        UITableView *table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:table];
        [table mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, 0, 0));
        }];
        [table registerClass:[CSAnnounceTableViewCell class] forCellReuseIdentifier:kCSCSAnnounceTableViewCellIdentifi];
        table.separatorStyle = UITableViewCellSeparatorStyleNone;
        table.delegate = self;
        table.dataSource = self;
        table.backgroundColor = UIColorFromRGB(0xf9f9f9);
        table;
    });
    
}

-(void)loadData{
    @weakify(self);
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:[CSDataSave getUserID] forKey:@"userId"];
    [dic setValue:[NSNumber numberWithInteger:self.model.noticeId] forKey:@"noticeId"];
    
    [CSZiroomBusnissManage getNoticeDetailWithParams:dic WithModel:[CSAnounceListDetaiModel class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        @strongify(self);
        self.model1 = logicDicData;
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        [self.view makeToast:errorMsg];
    }];
    [self.tableView reloadData];
}

#pragma mark - UITableView delegate and datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  SCREEN_HEIGHT - 64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CSAnnounceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCSCSAnnounceTableViewCellIdentifi forIndexPath:indexPath];
    cell.titleLable.text = @"淘汰---陈奕迅";
    cell.contentLabel.text = @"我说了所有的谎,你全都相信,简单的我爱你,你却老不信,你书里的剧情 我不想上演,因为我喜欢喜剧收尾,☆我试过完美放弃,的确很踏实,醒来了 梦散了,你我都走散了,情歌的词何必押韵,就算我是K歌之王,也不见得把爱情唱得完美,★只能说我输了,也许是你怕了,我们的回忆没有皱折,你却用离开烫下句点,只能说我认了,你的不安赢得你信任,我却得到你安慰的淘汰";
    cell.hasReadLabel.text = @"张三已读 | 李四已读 | 王五已读 | 赵六已读";
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
