//
//  CSOrganizationChartHeadView.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kHeadViewHeight 29.f

typedef void (^clickNumberBlock)(NSInteger number);

@interface CSOrganizationChartHeadView : UIView

/**
     展示数据设置
 */
- (void)showDataWithArray:(NSArray *)array;
/**
     返回选择了第几层级
 */
@property (nonatomic,copy) clickNumberBlock selectBlock;
@end
