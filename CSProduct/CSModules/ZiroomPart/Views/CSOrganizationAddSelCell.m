//
//  CSOrganizationAddSelCell.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/3.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSOrganizationAddSelCell.h"
@interface CSOrganizationAddSelCell()
{
    UILabel *_labTitle;
    UILabel *_labContent;
}
@end

@implementation CSOrganizationAddSelCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        //初始化试图
        [self _initViews];
    }
    return self;
}

- (void)_initViews{
    _labTitle  = [[UILabel alloc] init];
    _labTitle.font = kCommonRegularFontOfSize(16.f);
    _labTitle.textAlignment = NSTextAlignmentLeft;
    _labTitle.textColor = UIColorFromRGB(0x999999);
    [self.contentView addSubview:_labTitle];
    
    [_labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(16.f);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@18.f);
    }];
    
    _labContent  = [[UILabel alloc] init];
    _labContent.font = kCommonRegularFontOfSize(16.f);
    _labContent.textAlignment = NSTextAlignmentLeft;
    _labContent.textColor = UIColorFromRGB(0x999999);
    [self.contentView addSubview:_labContent];
    
    [_labContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(88.f);
        make.right.equalTo(self.contentView.mas_right).offset(-16.f);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@18.f);
    }];

    UIImageView *rightImage = [[UIImageView alloc] init];
    rightImage.image = [UIImage imageNamed:@"zrk_ic_arrow_right"];
    [self.contentView addSubview:rightImage];
    
    [rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-16.f);
        make.height.width.equalTo(@(18.f));
        make.centerY.equalTo(self.contentView);
    }];

    UIView *line = [[UIView alloc] init];
    line.backgroundColor = kColorLineColor;
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(@0.5f);
    }];
}

- (void)setTitle:(NSString *)title andContent:(NSString *)content
{
    _labTitle.text = title;
    _labContent.text = content;
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
