//
//  CSOrganizationChartPersonCell.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kCSOrganizationChartPersonCell @"CSOrganizationChartPersonCell_id"

@interface CSOrganizationChartPersonCell : UITableViewCell

- (void) setCellData:(id)model;
+(CGFloat)getCellHeight;
@end
