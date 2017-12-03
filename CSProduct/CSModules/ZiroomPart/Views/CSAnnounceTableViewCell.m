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
    }];
    
    
    self.imgContentView = [[UIView alloc] init];
    [self.contentView addSubview:self.imgContentView];
    [self.imgContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(40);
        make.height.equalTo(@(imgWidth*2/3*3+12*2));
    }];
    
    self.hasReadLabel = [[UILabel alloc] init];
    self.hasReadLabel.font = [UIFont systemFontOfSize:16.f];
    self.hasReadLabel.numberOfLines = 0;
    self.hasReadLabel.textColor = UIColorFromRGB(0x666666);
    [self.contentView addSubview:self.hasReadLabel];
    [self.hasReadLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView).with.offset(-40);
        make.left.equalTo(self.contentView).offset(18);
        make.right.equalTo(self.contentLabel).offset(-18);
    }];
 
    _lineView=[[UIView alloc] init];
    _lineView.backgroundColor=UIColorFromRGB(0xeeeeee);
    [self.contentView addSubview:_lineView];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.bottom.equalTo(self.hasReadLabel.mas_top).with.offset(-20);
        make.height.mas_equalTo(0.5);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
