//
//  CSOrganizationChartView.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSOrganizationChartView.h"
#import "CSOrganizationChartOrgCell.h"
#import "CSOrganizationChartPersonCell.h"
#import "CSOrganizationChartHeadView.h"

#pragma mark - UIShowSets

@interface CSOrganizationChartView() <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) NSArray *showOrgDataArray;
@property (nonatomic , strong) NSArray *showPersonDataArray;
@property (nonatomic , strong) NSArray *headDataArray;
@property (nonatomic , strong) CSOrganizationChartHeadView *headView;

@end

@implementation CSOrganizationChartView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    [self setViews];
    return self;
}

- (void)setViews{
    [self tableView];
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
        [self addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        // 注册cell
        [_tableView registerClass:[CSOrganizationChartOrgCell class] forCellReuseIdentifier:kCSOrganizationChartOrgCell];
        [_tableView registerClass:[CSOrganizationChartPersonCell class] forCellReuseIdentifier:kCSOrganizationChartPersonCell];
        
    }
    return _tableView;
}

#pragma mark - tableview Delegate !
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return nil;
    }else{
        UIView *speView = [[UIView alloc] init];
        speView.backgroundColor= UIColorFromRGB(0xEEEEEE);
        return speView;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
};

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return _showOrgDataArray.count;
    }else if (section == 1){
        return _showPersonDataArray.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        CSOrganizationChartOrgCell *cell = [tableView dequeueReusableCellWithIdentifier:kCSOrganizationChartOrgCell];
        if (_showOrgDataArray.count) {
            [cell setCellData:_showOrgDataArray[indexPath.row]];
        }
        return cell;
    }else{
        CSOrganizationChartPersonCell *cell = [tableView dequeueReusableCellWithIdentifier:kCSOrganizationChartPersonCell];
        if (_showPersonDataArray.count) {
            [cell setCellData:_showPersonDataArray[indexPath.row]];
        }
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.01f;
    }else{
        return 24.f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && _showOrgDataArray.count) {
        return [CSOrganizationChartOrgCell getCellHeight];
        
    }else if (indexPath.section == 1 && _showPersonDataArray.count){
        return [CSOrganizationChartPersonCell getCellHeight];
        
    }else{
        return 0.01;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (_selOrigitionBlock) {
            _selOrigitionBlock(indexPath.row);
        }
    }else if (indexPath.section == 1){
        if (_selPersonBlock){
            _selPersonBlock(indexPath.row);
        }
    }
}

#pragma mark - headviewAdd
- (void)setHeadViewShow{
    if (!_headView) {
        _headView = [[CSOrganizationChartHeadView alloc] initWithFrame:CGRectMake(0, 0,CSScreenWidth , kHeadViewHeight)];
        _headView.selectBlock = ^(NSInteger number) {
            NSLog(@"我选择了：%ld",number);
            if (_selRootMapBlock) {
                _selRootMapBlock(number);
            }
        };
        [self.tableView setTableHeaderView:_headView];
    }
    [_headView showDataWithArray:self.headDataArray];
}

#pragma mark - showData Sets
- (void)showDataWithOrgArray:(NSArray *)orgArray andPersonArray:(NSArray *)personArray andHeadDataArray:(NSArray *)headDataArray{
    self.showOrgDataArray = [NSArray arrayWithArray:orgArray];
    self.showPersonDataArray = [NSArray arrayWithArray:personArray];
    self.headDataArray = [NSArray arrayWithArray:headDataArray];
    [self.tableView reloadData];
    [self setHeadViewShow];
}


@end
