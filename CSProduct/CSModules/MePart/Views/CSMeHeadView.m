//
//  CSMeHeadView.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSMeHeadView.h"
@interface CSMeHeadView()
{
    UIImageView *imageHeadIcon;
    UILabel *labNickName;
}

@end

@implementation CSMeHeadView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    [self setViews];
    return self;
}

- (void)setViews{
    imageHeadIcon = [[UIImageView alloc] init];
    imageHeadIcon.layer.borderColor = UIColorFromRGB(0xDDDDDD).CGColor;
    imageHeadIcon.layer.borderWidth = 1.f;
    imageHeadIcon.layer.cornerRadius = 40.f;
    [self addSubview:imageHeadIcon];
    
    [imageHeadIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.equalTo(@(80.f));
        make.center.equalTo(self);
    }];

    labNickName  = [[UILabel alloc] init];
    labNickName.font = kCommonRegularFontOfSize(16.f);
    labNickName.textAlignment = NSTextAlignmentLeft;
    labNickName.textColor = UIColorFromRGB(0x444444);
    [self addSubview:labNickName];
    
    [labNickName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageHeadIcon.mas_bottom).offset(6.f);
        make.height.equalTo(@(18.f));
        make.centerX.equalTo(self);
    }];
}

- (void)setHeadModel:(id)model{
    imageHeadIcon.image = [UIImage imageNamed:@"zrk_ic_arrow_right"];
//    [imageHeadIcon sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@""]];
    labNickName.text = @"nick_holle@163.com";
}

@end
