//
//  CSOrganizationChartHeadCell.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSOrganizationChartHeadCell.h"

#define kFontOrganization kCommonRegularFontOfSize(16.f)

@interface CSOrganizationChartHeadCell()

@property (nonatomic,strong) UILabel *labTitle;

@end

@implementation CSOrganizationChartHeadCell

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
    _labTitle.font = kFontOrganization;
    _labTitle.textAlignment = NSTextAlignmentCenter;
    _labTitle.transform = CGAffineTransformMakeRotation(M_PI_2);
    _labTitle.textColor = UIColorFromRGB(0x444444);
    [self.contentView addSubview:_labTitle];
    
    [_labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
    }];
}

- (void)setTitleShow:(NSString *)title{
    _labTitle.text = title;
}

+ ( float )getTitleHeightWithStr:(NSString *)title{
    CGSize titleSize = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, CGFLOAT_MAX) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:kFontOrganization}
                                                  context:nil].size;
    return titleSize.width+24.f;
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
