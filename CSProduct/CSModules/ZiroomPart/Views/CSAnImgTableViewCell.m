//
//  CSAnImgTableViewCell.m
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/4.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSAnImgTableViewCell.h"

@implementation CSAnImgTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setUI];
    }
    return self;
}

-(void)setUI {
    
    self.imgView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(18);
        make.right.equalTo(self.contentView).offset(-18);
        make.top.equalTo(self.contentView).offset(12);
        make.height.equalTo(@((SCREEN_WIDTH-36)*2/3));
    }];
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
