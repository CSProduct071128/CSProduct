//
//  CSPersonInfoViewController.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSPersonInfoViewController.h"
#import "CSMeHeadView.h"
#import "CSPersonInfoCell.h"
#import "CSBaseService.h"

#define kShowContentCZ (self.tableViewDataArray.count-self.titleArray.count)

@interface CSPersonInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    CSMeHeadView *headView;
}
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,strong) NSMutableArray *tableViewDataArray;

@end

@implementation CSPersonInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"个人信息";
    self.tableViewDataArray = [NSMutableArray arrayWithCapacity:0];
    self.titleArray = @[@"所属部门:",@"职位:",@"工号:",@"企业邮箱:",@"联系方式:"];
    [self tableView];
    [self headViewShow];
    [self tableViewHeadViewDataWithUserId:_personId completion:^(BOOL isFinish, NSString *errorMessage) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        [_tableView registerClass:[CSPersonInfoCell class] forCellReuseIdentifier:kCSPersonInfoCellID];
        
    }
    return _tableView;
}

#pragma mark - tableview Delegate !
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
};

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    CSPersonInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:kCSPersonInfoCellID];
    if (self.tableViewDataArray.count) {
        [cell setTitle:self.titleArray[indexPath.row] andContent:self.tableViewDataArray[indexPath.row+kShowContentCZ]];
    }else{
        [cell setTitle:self.titleArray[indexPath.row] andContent:@""];
    }
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
    if (!headView) {
        headView = [[CSMeHeadView alloc] initWithFrame:CGRectMake(0, 0, CSScreenWidth, CSScreenWidth*2/3.0)];
        [self.tableView setTableHeaderView:headView];
    }
    [headView setName:[self.tableViewDataArray firstObject] andImage:nil];
}

- (void)tableViewHeadViewDataWithUserId:(NSString *)userid completion:(cscompletionBlock)completion{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:userid forKey:@"userId"];
    
    [CSBaseService getJsonDataRequestWithDetailUrl:kURL_UserInfo_get param:dict header:nil cls:[CSPersonInfoModel class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        if (logicDicData && [logicDicData isKindOfClass:[CSPersonInfoModel class]]) {
            [self dataFormWithModel:(CSPersonInfoModel *)logicDicData] ;
            [self headViewShow];
        }else{
            [self.view makeToast:msg?msg:kRequestErrorMessage];
        }
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        [self.view makeToast:errorMsg?errorMsg:kRequestErrorMessage];
//        completion(NO,errorMsg?errorMsg:kRequestErrorMessage);
    }];
}

- (void) dataFormWithModel:(CSPersonInfoModel *)model{
    [self.tableViewDataArray addObject:model.name?model.name:@""];
    [self.tableViewDataArray addObject:model.picUrl?model.picUrl:@""];
    [self.tableViewDataArray addObject:model.departmnet?model.departmnet:@""];
    [self.tableViewDataArray addObject:model.role?model.role:@""];
    [self.tableViewDataArray addObject:model.cardNumber?model.cardNumber:@""];
    [self.tableViewDataArray addObject:model.cardNumber?model.cardNumber:@""];
    [self.tableViewDataArray addObject:model.phoneNumber?model.phoneNumber:@""];
    [self.tableView reloadData];
}
@end
