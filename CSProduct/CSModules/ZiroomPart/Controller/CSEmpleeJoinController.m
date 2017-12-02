//
//  CSEmpleeJoinController.m
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSEmpleeJoinController.h"
#import "CSEmpleeJoinTableViewCell.h"
#import "CSSexTableViewCell.h"
#import "CSSelectTableViewCell.h"
#import "CSParentmentListController.h"
#import "CSPositionViewController.h"

static NSString *const kCSEmpleeJoinTableViewCellReuseIdentifier = @"kCSEmpleeJoinTableViewCellReuseIdentifier";
static NSString *const kCSCSSexTableViewCellReuseIdentifier = @"kCSCSSexTableViewCellReuseIdentifier";
static NSString *const kCSCSSelectTableViewCell = @"kCSCSSelectTableViewCellReuseIdentifier";

@interface CSEmpleeJoinController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSArray *nameArr;
@property (nonatomic ,strong) NSMutableArray *valueArr;

@end

@implementation CSEmpleeJoinController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"办理人员入职";
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
        [table registerClass:[CSEmpleeJoinTableViewCell class] forCellReuseIdentifier:kCSEmpleeJoinTableViewCellReuseIdentifier];
         [table registerClass:[CSSexTableViewCell class] forCellReuseIdentifier:kCSCSSexTableViewCellReuseIdentifier];
        [table registerClass:[CSSelectTableViewCell class] forCellReuseIdentifier:kCSCSSelectTableViewCell];
        
        table.separatorStyle = UITableViewCellSeparatorStyleNone;
        table.delegate = self;
        table.dataSource = self;
        table.backgroundColor = UIColorFromRGB(0xf9f9f9);
        table;
    });
    
}

-(void)loadData{
    self.nameArr = @[@"姓名：",@"性别：",@"证件号码：",@"联系方式：",@"住址：",@"所属部门：",@"职位："];
    self.valueArr = [NSMutableArray arrayWithArray:@[@"",@"0",@"",@"",@"",@"",@""]];
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
    return  [CSEmpleeJoinTableViewCell getCellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    @weakify(self);
    if(indexPath.row == 1){
       
        CSSexTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCSCSSexTableViewCellReuseIdentifier forIndexPath:indexPath];
        cell.nameLabel.text = self.nameArr[indexPath.row];
        cell.maleLabel.text = @"男";
        cell.femaleLabel.text = @"女";
        if([self.valueArr[indexPath.row] isEqualToString:@"0"]){
            [cell.chooseMaleBtn setImage:[UIImage imageNamed:@"sign_radiobtn_selected"] forState:UIControlStateNormal];
            [cell.chooseFemaleBtn setImage:[UIImage imageNamed:@"pay_unselected"] forState:UIControlStateNormal];
        }else{
            [cell.chooseMaleBtn setImage:[UIImage imageNamed:@"pay_unselected"] forState:UIControlStateNormal];
            [cell.chooseFemaleBtn setImage:[UIImage imageNamed:@"sign_radiobtn_selected"] forState:UIControlStateNormal];
        }
        cell.maleBtnBlock = ^(NSString *textStr) {
            @strongify(self);
            [self.valueArr replaceObjectAtIndex:1 withObject:textStr];
            [self.tableView reloadData];
        };
        cell.femaleBtnBlock = ^(NSString *textStr) {
            @strongify(self);
            [self.valueArr replaceObjectAtIndex:1 withObject:textStr];
            [self.tableView reloadData];
        };
        
        return cell;
    }else if(indexPath.row == 5 || indexPath.row == 6){
        
        CSSelectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCSCSSelectTableViewCell forIndexPath:indexPath];
        cell.nameLabel.text = self.nameArr[indexPath.row];
        cell.valueLabel.text = self.valueArr[indexPath.row];
        
        return cell;
    }else{
        CSEmpleeJoinTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCSEmpleeJoinTableViewCellReuseIdentifier forIndexPath:indexPath];
        cell.nameLabel.text = self.nameArr[indexPath.row];
        cell.textField.placeholder = self.valueArr[indexPath.row];
        
        return cell;
        
    }
    return [UITableViewCell new];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    @weakify(self);
    if(indexPath.row == 5){
         CSParentmentListController  * vc = [CSParentmentListController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if(indexPath.row == 6){
        CSPositionViewController  * vc = [CSPositionViewController new];
        vc.cellSelectBlock = ^(NSString *textStr) {
            @strongify(self);
            [self.valueArr replaceObjectAtIndex:6 withObject:textStr];
            [self.tableView reloadData];
        };
        [self.navigationController pushViewController:vc animated:YES];
        
    }
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
