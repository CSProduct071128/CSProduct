//
//  CSOrganizationChartHeadView.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSOrganizationChartHeadView.h"
#import "CSOrganizationChartHeadCell.h"
#import "CSOrganizationModel.h"

@interface CSOrganizationChartHeadView() <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) NSArray *showDataArray;

@end
@implementation CSOrganizationChartHeadView

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
//        _tableView.bounces = NO;
        _tableView.transform = CGAffineTransformMakeRotation(-M_PI_2);
        _tableView.showsVerticalScrollIndicator = NO;
        [self addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.height.equalTo(@(self.frame.size.width));
            make.width.equalTo(@(self.frame.size.height));
        }];
        // 注册cell
        [_tableView registerClass:[CSOrganizationChartHeadCell class] forCellReuseIdentifier:kCSOrganizationChartHeadCell];
        
    }
    return _tableView;
}

#pragma mark - tableview Delegate !
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return nil;
    }else{
        UIView *speView = [[UIView alloc] init];
        speView.backgroundColor= [UIColor clearColor];
        
        UIImageView *arrowImage = [[UIImageView alloc] init];
        arrowImage.image = [UIImage imageNamed:@"zrk_ic_arrow_right"];
        arrowImage.transform = CGAffineTransformMakeRotation(M_PI_2);
        [speView addSubview:arrowImage];
        [arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(speView);
            make.height.width.equalTo(@(18.f));
            make.centerX.equalTo(speView);
        }];

        return speView;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.showDataArray.count;
};

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CSOrganizationChartHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:kCSOrganizationChartHeadCell];
    if (_showDataArray.count) {
        CSOrganizationModel *model = _showDataArray[indexPath.section];
        [cell setTitleShow:model.depRootName];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.01f;
    }else{
        return 9.f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_showDataArray.count) {
        
        CSOrganizationModel *model = _showDataArray[indexPath.section];
        return [CSOrganizationChartHeadCell getTitleHeightWithStr:model.depRootName];
    }else{
        return 0.01;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section != _showDataArray.count-1) {
        if (_selectBlock) {
            _selectBlock(indexPath.section);
        }
    }
}

#pragma mark - showData Sets
- (void)showDataWithArray:(NSArray *)array{
    self.showDataArray = [NSArray arrayWithArray:array];
    [self.tableView reloadData];
}

@end
