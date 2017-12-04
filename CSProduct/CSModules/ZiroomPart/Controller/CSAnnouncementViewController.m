//
//  CSAnnouncementViewController.m
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/3.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSAnnouncementViewController.h"
#import "CSAnnounceTableViewCell.h"
#import "CSAnImgTableViewCell.h"
#import "CSParentmentListController.h"
#import "CSZiroomBusnissManage.h"
#import "CSDataSave.h"
#import "CSLoginModel.h"
#import "CSAnounceListDetaiModel.h"

static NSString *const kCSCSAnnounceTableViewCellIdentifi = @"CSAnnounceTableViewCell";
static NSString *const kCSAnImgTableViewCellIdentifi = @"kCSAnImgTableViewCellIdentifi";

@interface CSAnnouncementViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) CSAnounceListDetaiModel *model1;

@property (nonatomic,strong) UILabel *hasReadLabel;
@property (nonatomic,strong) UIView *lineView;
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
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, 60, 0));
        }];
        [table registerClass:[CSAnnounceTableViewCell class] forCellReuseIdentifier:kCSCSAnnounceTableViewCellIdentifi];
         [table registerClass:[CSAnImgTableViewCell class] forCellReuseIdentifier:kCSAnImgTableViewCellIdentifi];
        
        table.separatorStyle = UITableViewCellSeparatorStyleNone;
        table.estimatedRowHeight = 200.f;
        table.rowHeight = UITableViewAutomaticDimension;
        table.delegate = self;
        table.dataSource = self;
        table.backgroundColor = UIColorFromRGB(0xf9f9f9);
        table;
    });
    
    self.hasReadLabel = [[UILabel alloc] init];
    self.hasReadLabel.font = [UIFont systemFontOfSize:16.f];
    self.hasReadLabel.numberOfLines = 0;
    self.hasReadLabel.textColor = UIColorFromRGB(0x666666);
    [self.view addSubview:self.hasReadLabel];
    [self.hasReadLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).with.offset(-20);
        make.left.equalTo(self.view).offset(18);
        make.right.equalTo(self.view).offset(-18);
    }];
    
    _lineView=[[UIView alloc] init];
    _lineView.backgroundColor=UIColorFromRGB(0xeeeeee);
    [self.view addSubview:_lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.hasReadLabel.mas_top).with.offset(0);
        make.height.mas_equalTo(0.5);
    }];
    
}
-(void)setNoticeId:(NSInteger)noticeId{
    @weakify(self);
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:[CSDataSave getUserID] forKey:@"userId"];
    [dic setValue:[NSNumber numberWithInteger:self.noticeId] forKey:@"noticeId"];
    
    [CSZiroomBusnissManage getNoticeDetailWithParams:dic WithModel:[CSAnounceListDetaiModel class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        @strongify(self);
        self.model1 = logicDicData;
        NSMutableString *str = [NSMutableString stringWithCapacity:0];
        for(CSAnounceUserModel *user in self.model1.userList){
            if(user.name){
                [str appendString:user.name];
                [str appendString:@" "];
            }
        }
        self.hasReadLabel.text = str;
        [self.tableView reloadData];
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        [self.view makeToast:errorMsg];
    }];
}
-(void)loadData{
    @weakify(self);
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:[CSDataSave getUserID] forKey:@"userId"];
    [dic setValue:[NSNumber numberWithInteger:self.model.noticeId] forKey:@"noticeId"];
    
    [CSZiroomBusnissManage getNoticeDetailWithParams:dic WithModel:[CSAnounceListDetaiModel class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        @strongify(self);
        self.model1 = logicDicData;
        NSMutableString *str = [NSMutableString stringWithCapacity:0];
        for(CSAnounceUserModel *user in self.model1.userList){
            if(user.name){
                [str appendString:user.name];
                [str appendString:@" "];
            }
        }
         self.hasReadLabel.text = str;
         [self.tableView reloadData];
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        [self.view makeToast:errorMsg];
    }];
}

#pragma mark - UITableView delegate and datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 1)
    {
        return self.model1.picList.count;
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 1){
       return (SCREEN_WIDTH-36)*2/3+12;
    }
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 0){
        CSAnnounceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCSCSAnnounceTableViewCellIdentifi forIndexPath:indexPath];
        cell.titleLable.text = self.model1.noticeTitle;
        cell.contentLabel.text = self.model1.noticeDetail;
         return cell;
    }else
    if(indexPath.section == 1){
       CSAnImgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCSAnImgTableViewCellIdentifi forIndexPath:indexPath];
        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:self.model1.picList[indexPath.row]] placeholderImage:[ UIImage imageNamed:@"cs_placeHolder"]];
        return cell;
    }
    return [UITableViewCell new];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
