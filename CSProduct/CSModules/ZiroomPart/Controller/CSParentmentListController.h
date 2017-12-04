//
//  CSParentmentListController.h
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "BaseViewController.h"

typedef void (^clickNumberBlock)(NSArray *SelectParentmentList);

@interface CSParentmentListController : BaseViewController

/**
 选择的部门
 */
@property (nonatomic,copy) clickNumberBlock SelectParentmentListBlock;

@end
