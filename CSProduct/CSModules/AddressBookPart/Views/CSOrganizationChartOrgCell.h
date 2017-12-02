//
//  CSOrganizationChartOrgCell.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kCSOrganizationChartOrgCell @"CSOrganizationChartOrgCell_id"

@interface CSOrganizationChartOrgCell : UITableViewCell
- (void) setCellData:(id)model;
/**
 获取cell高度
 */
+(CGFloat)getCellHeight;

@end
