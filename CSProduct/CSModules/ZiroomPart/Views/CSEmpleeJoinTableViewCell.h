//
//  CSEmpleeJoinTableViewCell.h
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSEmpleeJoinTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic,copy) void (^TextFieldBlock)(NSString * textStr);

+(CGFloat) getCellHeight;

@end
