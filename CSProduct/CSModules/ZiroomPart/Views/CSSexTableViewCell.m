//
//  CSSexTableViewCell.m
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSSexTableViewCell.h"

@interface CSSexTableViewCell ()

@property (nonatomic,strong) UIView *lineView;

@end

@implementation CSSexTableViewCell

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
    
    self.chooseMaleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:self.chooseMaleBtn];
    [self.chooseMaleBtn addTarget:self action:@selector(maleBtnDown) forControlEvents:UIControlEventTouchUpInside];
    [self.chooseMaleBtn setImage:[UIImage imageNamed:@"sign_radiobtn_selected"] forState:UIControlStateNormal];
    [self.chooseMaleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(24);
        make.centerY.equalTo(self.contentView);
        make.width.height.equalTo(@48);
    }];
    self.maleLabel = [[UILabel alloc] init];
    self.femaleLabel.text = @"男";
    self.maleLabel.font = [UIFont systemFontOfSize:16.f];
    self.maleLabel.textAlignment = NSTextAlignmentRight;
    self.maleLabel.textColor =UIColorFromRGB(0x444444);
    [self.contentView addSubview:self.maleLabel];
    [self.maleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.chooseMaleBtn.mas_right).offset(18);
         make.centerY.equalTo(self.contentView);
        make.height.equalTo(@16);
    }];
    
    self.chooseFemaleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:self.chooseFemaleBtn];
    [self.chooseFemaleBtn addTarget:self action:@selector(femaleBtnDown) forControlEvents:UIControlEventTouchUpInside];
    [self.chooseFemaleBtn setImage:[UIImage imageNamed:@"pay_unselected"] forState:UIControlStateNormal];
    [self.chooseFemaleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.maleLabel.mas_right).offset(24);
        make.centerY.equalTo(self.contentView);
        make.width.height.equalTo(@48);
    }];
    self.femaleLabel = [[UILabel alloc] init];
    self.femaleLabel.text = @"女";
    self.femaleLabel.font = [UIFont systemFontOfSize:16.f];
    self.femaleLabel.textAlignment = NSTextAlignmentRight;
    self.femaleLabel.textColor =UIColorFromRGB(0x444444);
    [self.contentView addSubview:self.femaleLabel];
    [self.femaleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.chooseFemaleBtn.mas_right).offset(18);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@16);
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

-(void)maleBtnDown{
// [self.chooseMaleBtn setImage:[UIImage imageNamed:@"sign_radiobtn_selected"] forState:UIControlStateNormal];
// [self.chooseFemaleBtn setImage:[UIImage imageNamed:@"pay_unselected"] forState:UIControlStateNormal];
    self.maleBtnBlock(@"0");
    
}
-(void)femaleBtnDown{
//    [self.chooseMaleBtn setImage:[UIImage imageNamed:@"pay_unselected"] forState:UIControlStateNormal];
//    [self.chooseFemaleBtn setImage:[UIImage imageNamed:@"sign_radiobtn_selected"] forState:UIControlStateNormal];
    self.maleBtnBlock(@"1");
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
