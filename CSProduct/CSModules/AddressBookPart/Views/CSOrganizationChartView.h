//
//  CSOrganizationChartView.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^selectOrgBlock)(NSInteger number);
typedef void (^selectPersonBlock)(NSInteger number);

@interface CSOrganizationChartView : UIView

/**
     选择组织架构
 */
@property (nonatomic,strong) selectOrgBlock selOrigitionBlock;

/**
    个人信息
 */
@property (nonatomic,strong) selectPersonBlock selPersonBlock;

- (void)showDataWithOrgArray:(NSArray *)orgArray
              andPersonArray:(NSArray *)personArray
            andHeadDataArray:(NSArray *)headDataArray;


@end
