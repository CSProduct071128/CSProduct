//
//  CSOrganizationAddOriTipsCell.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/3.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kCSOrganizationAddOriTipsCell @"CSOrganizationAddOriTipsCell_id"

@interface CSOrganizationAddOriTipsCell : UITableViewCell <UITextViewDelegate>
@property (nonatomic,strong) UILabel *labTitle;
@property (nonatomic,strong) UITextView *nameTextView;

@end
