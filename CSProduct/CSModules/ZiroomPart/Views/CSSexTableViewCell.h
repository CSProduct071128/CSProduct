//
//  CSSexTableViewCell.h
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSSexTableViewCell : UITableViewCell

@property (nonatomic,strong) UIButton *chooseMaleBtn;
@property (nonatomic,strong) UILabel *maleLabel;
@property (nonatomic,strong) UIButton *chooseFemaleBtn;
@property (nonatomic,strong) UILabel *femaleLabel;

@property (nonatomic,copy) void (^maleBtnBlock)(NSString * textStr);
@property (nonatomic,copy) void (^femaleBtnBlock)(NSString * textStr);

@property (nonatomic,strong) UILabel *nameLabel;

@end
