//
//  CSParentmentListTableCell.m
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSParentmentListTableCell.h"
#import "UIButton+EnlargeTouchArea.h"

@interface CSParentmentListTableCell()
@end

@implementation CSParentmentListTableCell

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
    
    self.cellImageBtn = [[UIButton alloc] init];
    [_cellImageBtn addTarget:self action:@selector(cellImageBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [_cellImageBtn setImage:[UIImage imageNamed:@"MSLandlord_no_selected"] forState:(UIControlStateNormal)];
    [self.contentView addSubview:_cellImageBtn];
    [_cellImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).with.offset(-30);
        make.width.height.mas_equalTo(20);
    }];
    [_cellImageBtn setEnlargeEdgeWithTop:10 right:10 bottom:10 left:10];
    
    self.cellTitleLabel = [[UILabel alloc] init];
    _cellTitleLabel.font = [UIFont systemFontOfSize:16.f];
    _cellTitleLabel.textColor = UIColorFromRGB(0x666666);
    [self.contentView addSubview:_cellTitleLabel];
    [_cellTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).with.offset(20);
        make.left.equalTo(self.contentView).with.offset(18);
        make.right.equalTo(_cellImageBtn.mas_left).with.offset(-18);
        make.bottom.equalTo(self.contentView).with.offset(-20);
    }];
}

-(void)cellImageBtnClick:(UIButton *)btn {
    self.cellValue = !_cellValue;
    if ([_delegate respondsToSelector:@selector(csParentmentSelectCellValueChanged:indexPath:value:)]) {
        [_delegate csParentmentSelectCellValueChanged:self indexPath:_indexPath value:_cellValue];
    }
}

-(void)reset {
    if (_cellValue) {
        [_cellImageBtn setImage:[UIImage imageNamed:@"MSLandlord_is_selected"] forState:(UIControlStateNormal)];
    }else {
        [_cellImageBtn setImage:[UIImage imageNamed:@"MSLandlord_no_selected"] forState:(UIControlStateNormal)];
    }
}

-(void)setCellValue:(BOOL)cellValue {
    _cellValue = cellValue;
    [self reset];
}

#pragma mark - cellEstimatedHeight
+(CGFloat)cellEstimatedHeight {
    return 20 + 16 + 20;
}

+(NSString *)cellIdentifier {
    return @"MSLandlordPushHouseSelectCellIdentifier";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
