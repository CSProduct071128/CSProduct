//
//  CSMeHeadView.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSMeHeadView.h"

@implementation CSMeHeadView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    [self setViews];
    return self;
}

- (void)setViews{
    self.backgroundColor = [UIColor grayColor];
}

@end
