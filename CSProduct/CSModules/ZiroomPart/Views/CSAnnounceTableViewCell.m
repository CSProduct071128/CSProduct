//
//  CSAnnounceTableViewCell.m
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/3.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSAnnounceTableViewCell.h"

#define imgWidth (SCREEN_WIDTH-36-12*2) / 3.f

@implementation CSAnnounceTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setUI];
    }
    return self;
}

-(void)setUI {
    self.titleLable = [[UILabel alloc] init];
    self.titleLable.font = [UIFont systemFontOfSize:16.f];
    self.titleLable.textColor = UIColorFromRGB(0x444444);
    [self.contentView addSubview:self.titleLable];
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).with.offset(20);
        make.centerX.equalTo(self.contentView);
        make.height.equalTo(@16);
    }];
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.font = [UIFont systemFontOfSize:14.f];
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.textColor = UIColorFromRGB(0x444444);
    [self.contentView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLable.mas_bottom).with.offset(20);
        make.left.equalTo(self.contentView).offset(18);
        make.right.equalTo(self.contentView).offset(-18);
        make.bottom.equalTo(self.contentView);
    }];
    
    

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
