//
//  CSMeCell.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSMeCell.h"
@interface CSMeCell ()
{
    UILabel *labTitle;
}
@end

@implementation CSMeCell
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
        make.centerY.equalTo(self.contentView);
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
    line.backgroundColor =UIColorFromRGB(0xEEEEEE);
    [self.contentView addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.height.equalTo(@(0.5f));
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];

}

- (void)setTitleWithStr:(NSString *)title{
    labTitle.text = title;
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
