//
//  CSOrganizationChartOrgCell.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSOrganizationChartOrgCell.h"
@interface CSOrganizationChartOrgCell()
{
    UILabel *_labTitle;
    UILabel *_labNumber;
}
@end

@implementation CSOrganizationChartOrgCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        //初始化试图
        [self _initViews];
    }
    return self;
}

//初始化视图
-(void)_initViews{
    _labTitle  = [[UILabel alloc] init];
    _labTitle.font = kCommonRegularFontOfSize(16.f);
    _labTitle.textAlignment = NSTextAlignmentLeft;
    _labTitle.textColor = UIColorFromRGB(0x444444);
    [self.contentView addSubview:_labTitle];
    
    [_labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(16.f);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@18.f);
    }];
    
    _labNumber  = [[UILabel alloc] init];
    _labNumber.font = kCommonRegularFontOfSize(14.f);
    _labNumber.textAlignment = NSTextAlignmentLeft;
    _labNumber.textColor = UIColorFromRGB(0x999999);
    [self.contentView addSubview:_labNumber];
    
    [_labNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_labTitle.mas_right).offset(5.f);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@16.f);
    }];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = kColorLineColor;
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(@0.5f);
    }];
}

- (void) setCellData:(CSOrganizationListModel *)model{
    _labTitle.text = [NSString stringWithFormat:@"%@",model.depOneName];
    _labNumber.text = @"100";
}

+(CGFloat)getCellHeight{
    return 49.f;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
