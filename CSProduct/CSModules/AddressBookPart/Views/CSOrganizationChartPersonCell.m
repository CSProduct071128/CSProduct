//
//  CSOrganizationChartPersonCell.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSOrganizationChartPersonCell.h"
@interface CSOrganizationChartPersonCell()
{
    UIImageView *_imageIcon;
    UILabel *_labName;
    UILabel *_labPosition;
}
@end

@implementation CSOrganizationChartPersonCell
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
    _imageIcon = [[UIImageView alloc] init];
    _imageIcon.layer.cornerRadius = 18.f;
    _imageIcon.clipsToBounds = YES;
    [self.contentView addSubview:_imageIcon];
    
    [_imageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(16.f);
        make.centerY.equalTo(self.contentView);
        make.height.width.equalTo(@36.f);
    }];

    _labName  = [[UILabel alloc] init];
    _labName.font = kCommonRegularFontOfSize(16.f);
    _labName.textAlignment = NSTextAlignmentLeft;
    _labName.textColor = UIColorFromRGB(0x444444);
    [self.contentView addSubview:_labName];
    
    [_labName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_imageIcon.mas_right).offset(8.f);
        make.top.equalTo(self.contentView).offset(10.f);
        make.height.equalTo(@18.f);
    }];
    
    _labPosition  = [[UILabel alloc] init];
    _labPosition.font = kCommonRegularFontOfSize(14.f);
    _labPosition.textAlignment = NSTextAlignmentLeft;
    _labPosition.textColor = UIColorFromRGB(0x999999);
    [self.contentView addSubview:_labPosition];
    
    [_labPosition mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_labName);
        make.top.equalTo(_labName.mas_bottom).offset(4.f);
        make.height.equalTo(@16.f);
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

- (void) setCellData:(id)model{
    [_imageIcon sd_setImageWithURL:[NSURL URLWithString:@"http://img.duoziwang.com/2017/09/152146051949.jpg"] placeholderImage:[UIImage imageNamed:@""]];
    _labName.text = @"任若凡";
    _labPosition.text = @"经理";
}

+(CGFloat)getCellHeight{
    return 59.f;
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
