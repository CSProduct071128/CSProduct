//
//  CSParentmentListController.m
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSParentmentListController.h"
#import "CSParentmentListTableCell.h"

@interface CSParentmentListController ()<UITableViewDelegate,UITableViewDataSource,CSParentmentListTableCellDelegate>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSArray *nameArr;
@end

@implementation CSParentmentListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"部门列表";
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadTableView];
    [self loadData];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden = NO;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)loadTableView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = ({
        UITableView *table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:table];
        [table mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, 0, 0));
        }];
        [table registerClass:[CSParentmentListTableCell class] forCellReuseIdentifier:[CSParentmentListTableCell cellIdentifier]];
        
        table.separatorStyle = UITableViewCellSeparatorStyleNone;
        table.delegate = self;
        table.dataSource = self;
        table.backgroundColor = UIColorFromRGB(0xf9f9f9);
        table;
    });
    
}

-(void)loadData{
    
    self.nameArr = @[@{@"text":@"人力资源部",@"isSelect":@"1"},@{@"text":@"能力发展部",@"isSelect":@"0"},@{@"text":@"运营部",@"isSelect":@"0"},@{@"text":@"系统研发部",@"isSelect":@"1"},@{@"text":@"财务部",@"isSelect":@"0"},@{@"text":@"法务部",@"isSelect":@"0"},@{@"text":@"HRBP",@"isSelect":@"1"}];
    [self.tableView reloadData];
}
#pragma mark - UITableView delegate and datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.nameArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  [CSParentmentListTableCell cellEstimatedHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CSParentmentListTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[CSParentmentListTableCell cellIdentifier]];
    NSDictionary *dic = self.nameArr[indexPath.row];
    cell.cellTitleLabel.text = dic[@"text"];
    cell.delegate = self;
    cell.indexPath = indexPath;
    cell.cellValue =  [dic[@"isSelect"] integerValue];
    return cell;
        
        return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 5){
        
    }
}

#pragma mark - delegate ------
-(void)csParentmentSelectCellValueChanged:(CSParentmentListTableCell *)cell indexPath:(NSIndexPath *)indexPath value:(BOOL)value{
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


