//
//  CSMeFootView.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSMeFootView.h"
@interface CSMeFootView()
{
    UIButton *btnOutLogin;
}
@end
@implementation CSMeFootView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    [self setViews];
    return self;
}

- (void)setViews{
    btnOutLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnOutLogin setTitle:@"退出" forState:(UIControlStateNormal)];
    btnOutLogin.titleLabel.font = kCommonRegularFontOfSize(18);
    [btnOutLogin setTitleColor:UIColorFromRGB(0Xffffff) forState:(UIControlStateNormal)];
    btnOutLogin.backgroundColor = UIColorFromRGB(0X1E90FF);
    [btnOutLogin addTarget:self action:@selector(outLoginClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:btnOutLogin];
    [btnOutLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.equalTo(@49.f);
        make.center.equalTo(self);
    }];
}

/**
     退出登录
 */
- (void)outLoginClick:(UIButton *)sendBtn{
    if (_outLoginBlock) {
        _outLoginBlock(YES);
    }
}

@end
