//
//  UIView+ZRToast.h
//  ZiroomerProject
//
//  Created by zhiwei jiang on 2017/11/14.
//  Copyright © 2017年 www.ziroom.com. All rights reserved.
//

#import <UIKit/UIKit.h>
extern NSInteger const ZRToastKey;
// positions
extern NSString * const ZRToastPositionTop;
extern NSString * const ZRToastPositionCenter;
extern NSString * const ZRToastPositionBottom;

@interface UIView (ZRToast)
/**
	默认toast
 */
- (void)makeToast:(NSString *)message;

/**
	自定义时间与位置toast
 */
- (void)makeToast:(NSString *)message duration:(NSTimeInterval)duration position:(id)position;

@end
