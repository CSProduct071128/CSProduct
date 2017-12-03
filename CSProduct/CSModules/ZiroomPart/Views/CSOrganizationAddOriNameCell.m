//
//  CSOrganizationAddOriNameCell.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/3.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSOrganizationAddOriNameCell.h"
@interface CSOrganizationAddOriNameCell() <UITextFieldDelegate>

@end

@implementation CSOrganizationAddOriNameCell
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
    _labTitle.text = @"组织名称：";
    _labTitle.font = kCommonRegularFontOfSize(16.f);
    _labTitle.textAlignment = NSTextAlignmentLeft;
    _labTitle.textColor = UIColorFromRGB(0x999999);
    [self.contentView addSubview:_labTitle];
    
    [_labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(16.f);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@18.f);
    }];
    
    _nameTextField = [[UITextField alloc] init];
    _nameTextField.font = kCommonRegularFontOfSize(16.f);
    _nameTextField.textColor = UIColorFromRGB(0x444444);
    _nameTextField.delegate = self;
    _nameTextField.placeholder = @"输入组织名称";
    _nameTextField.textAlignment = NSTextAlignmentLeft;
    _nameTextField.keyboardType = UIKeyboardTypeDefault;   //设置键盘的样式
    [self.contentView addSubview:_nameTextField];
    
    [_nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(88.f);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@20.f);
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

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
