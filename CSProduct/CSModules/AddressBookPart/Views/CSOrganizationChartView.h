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
typedef void (^selectRootTitleBlock)(NSInteger number);

@interface CSOrganizationChartView : UIView

/**
     选择组织架构
 */
@property (nonatomic,copy) selectOrgBlock selOrigitionBlock;

/**
    个人信息
 */
@property (nonatomic,copy) selectPersonBlock selPersonBlock;

/**
     选择根组织
 */
@property (nonatomic,copy) selectPersonBlock selRootMapBlock;

- (void)showDataWithOrgArray:(NSArray *)orgArray
              andPersonArray:(NSArray *)personArray
            andHeadDataArray:(NSArray *)headDataArray;


@end
