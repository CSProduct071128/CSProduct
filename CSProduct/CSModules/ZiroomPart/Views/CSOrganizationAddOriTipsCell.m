//
//  CSOrganizationAddOriTipsCell.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/3.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSOrganizationAddOriTipsCell.h"

@implementation CSOrganizationAddOriTipsCell
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
    _labTitle.text = @"组织职能：";
    _labTitle.font = kCommonRegularFontOfSize(16.f);
    _labTitle.textAlignment = NSTextAlignmentLeft;
    _labTitle.textColor = UIColorFromRGB(0x999999);
    [self.contentView addSubview:_labTitle];
    
    [_labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(16.f);
        make.top.equalTo(self.contentView).offset(14.f);
        make.height.equalTo(@18.f);
    }];
    
    _nameTextView = [[UITextView alloc] init];
    _nameTextView.font = kCommonRegularFontOfSize(16.f);
    _nameTextView.textColor = UIColorFromRGB(0x444444);
    _nameTextView.delegate = self;
    _nameTextView.textAlignment = NSTextAlignmentLeft;
    _nameTextView.keyboardType = UIKeyboardTypeDefault;   //设置键盘的样式
    [self.contentView addSubview:_nameTextView];
    
    [_nameTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(88.f);
        make.top.equalTo(self.contentView).offset(5.f);
        make.right.equalTo(self.contentView.mas_right).offset(-5.f);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-5.f);
    }];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = kColorLineColor;
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(@0.5f);
    }];
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
