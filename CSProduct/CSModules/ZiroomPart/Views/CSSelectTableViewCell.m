//
//  CSSelectTableViewCell.m
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSSelectTableViewCell.h"

@implementation CSSelectTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
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
    self.nameLabel.textAlignment = NSTextAlignmentRight;
    self.nameLabel.textColor =UIColorFromRGB(0x444444);
    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(12);
        make.top.equalTo(self.contentView).offset(24);
        make.height.equalTo(@16);
    }];
    
    self.valueLabel = [[UILabel alloc] init];
    self.valueLabel.font = [UIFont systemFontOfSize:16];
    self.valueLabel.textColor = UIColorFromRGB(0x444444);
    [self.contentView addSubview:self.valueLabel];
    [self.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(5);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@30);
    }];
    // 右箭头
    _imageRightArrow = [[UIImageView alloc] init];
    _imageRightArrow.image = [UIImage imageNamed:@"zrk_ic_arrow_right"];
    [self.contentView addSubview:_imageRightArrow];
    [_imageRightArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-18);
        make.centerY.equalTo(self.contentView);
        make.height.width.equalTo(@18);
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
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
