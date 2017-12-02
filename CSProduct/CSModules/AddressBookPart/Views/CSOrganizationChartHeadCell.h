//
//  CSOrganizationChartHeadCell.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kCSOrganizationChartHeadCell @"CSOrganizationChartHeadCell_ID"

@interface CSOrganizationChartHeadCell : UITableViewCell
/**
     展示显示内容
 */
- (void)setTitleShow:(NSString *)title;
/**
     计算cell高度
 */
+ ( float )getTitleHeightWithStr:(NSString *)title;

@end
