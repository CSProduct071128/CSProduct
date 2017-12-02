//
//  CSPositionViewController.m
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSPositionViewController.h"
#import "CSParentmentListTableCell.h"

@interface CSPositionViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSArray *nameArr;
@end

@implementation CSPositionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"职位列表";
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
    
    self.nameArr = @[@"CEO",@"CTO",@"经理",@"专员"];
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
    cell.cellTitleLabel.text = self.nameArr[indexPath.row];
    cell.cellImageBtn.hidden = YES;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.cellSelectBlock(self.nameArr[indexPath.row]);
    [self.navigationController popViewControllerAnimated:YES];
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
