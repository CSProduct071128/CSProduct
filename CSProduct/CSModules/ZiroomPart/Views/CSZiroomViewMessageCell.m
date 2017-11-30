//
//  CSZiroomViewMessageCell.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSZiroomViewMessageCell.h"

@implementation CSZiroomViewMessageCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setupViews];
    }
    return self;
}
- (void)setupViews{
    
    self.iconImageView = [[UIImageView alloc] init];
    self.iconImageView.layer.cornerRadius = 27.5f;
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.image= [UIImage imageNamed:@"zrk_user"];
    [self.contentView addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(18);
        make.width.height.equalTo(@55);
    }];
    
   
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.font = [UIFont systemFontOfSize:16.f];
    self.nameLabel.textColor =UIColorFromRGB(0x444444);
    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(12);
        make.top.equalTo(self.contentView).offset(24);
        make.height.equalTo(@16);
    }];
    
    self.infoLabel = [[UILabel alloc] init];
    self.infoLabel.font = [UIFont systemFontOfSize:14.f];
    self.infoLabel.textColor =UIColorFromRGB(0x444444);
    [self.contentView addSubview:self.infoLabel];
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(12);
        make.height.equalTo(@14);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(12);
    }];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor =UIColorFromRGB(0xeeeeee);
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.contentView);
        make.height.equalTo(@.5);
    }];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


+(CGFloat)getCellHeight{
    
    return 90.f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
