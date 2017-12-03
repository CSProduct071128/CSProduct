//
//  CSPersonInfoCell.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSPersonInfoCell.h"
@interface CSPersonInfoCell()
{
    UILabel *labTitle;
    UILabel *labContent;
}
@end
@implementation CSPersonInfoCell
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
    labTitle  = [[UILabel alloc] init];
    labTitle.font = kCommonRegularFontOfSize(16.f);
    labTitle.textAlignment = NSTextAlignmentLeft;
    labTitle.textColor = UIColorFromRGB(0x444444);
    [self.contentView addSubview:labTitle];
    
    [labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(16.f);
        make.height.equalTo(@(18.f));
        make.width.equalTo(@(100.f));
        make.centerY.equalTo(self.contentView);
    }];
    
    labContent  = [[UILabel alloc] init];
    labContent.font = kCommonRegularFontOfSize(14.f);
    labContent.textAlignment = NSTextAlignmentLeft;
    labContent.textColor = UIColorFromRGB(0x999999);
    [self.contentView addSubview:labContent];
    
    [labContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(labTitle.mas_right).offset(5.f);
        make.right.equalTo(self.contentView).offset(-16.f);
        make.height.equalTo(@(16.f));
        make.centerY.equalTo(self.contentView);
    }];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor =UIColorFromRGB(0xEEEEEE);
    [self.contentView addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.height.equalTo(@(0.5f));
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
    
}

- (void)setTitle:(NSString *)title andContent:(NSString *)content{
    
    labTitle.text = title;
    labContent.text = content;
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
