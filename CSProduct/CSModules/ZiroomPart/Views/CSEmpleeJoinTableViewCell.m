//
//  CSEmpleeJoinTableViewCell.m
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSEmpleeJoinTableViewCell.h"

@interface CSEmpleeJoinTableViewCell ()<UITextFieldDelegate>

@property (nonatomic,strong) UIView *lineView;

@end

@implementation CSEmpleeJoinTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setupViews];
    }
    return self;
}

- (void)setupViews{
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.font = [UIFont systemFontOfSize:16.f];
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    self.nameLabel.textColor =UIColorFromRGB(0x444444);
    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(12);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@16);
        make.width.equalTo(@85);
    }];
    
    self.textField = [[UITextField alloc] init];
    self.textField.font = [UIFont systemFontOfSize:16];
    self.textField.textColor = UIColorFromRGB(0x444444);
    self.textField.placeholder = @"请填写";
    [self.textField setValue:UIColorFromRGB(0xDDDDDD) forKeyPath:@"_placeholderLabel.textColor"];
    self.textField.delegate = self;
    [self.contentView addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(0);
        make.right.equalTo(self.contentView.mas_right).offset(-18);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@30);
    }];
    
    _lineView=[[UIView alloc] init];
    _lineView.backgroundColor=UIColorFromRGB(0xeeeeee);
    [self.contentView addSubview:_lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
    }];
}
//根据textfield的tag值来判断是点击的是哪个textfield
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (self.TextFieldBlock) {
        self.TextFieldBlock(textField.text);
    }
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return YES;
}

+(CGFloat)getCellHeight{
    
    return 24*2+16;
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
