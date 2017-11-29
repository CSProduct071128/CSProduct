//
//  UIView+ViewProperty.h
//  CSProduct
//
//  Created by LiGuoTing on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ViewProperty)

- (CGFloat)y;

- (CGFloat)centerY;

- (CGFloat)centerX;

- (CGFloat)maxY;

- (CGFloat)x;

- (CGFloat)maxX;

- (CGPoint)xy;

- (CGFloat)width;

- (CGFloat)height;

- (CGSize)size;

- (void)setY:(CGFloat)Y;

- (void)setX:(CGFloat)X;

- (void)setCenterX:(CGFloat)centerX;

- (void)setCenterY:(CGFloat)centerY;

- (void)setXy:(CGPoint)point;

- (void)setSize:(CGSize)size;

- (void)setWidth:(CGFloat)width;

- (void)setHeight:(CGFloat)height;


@end
