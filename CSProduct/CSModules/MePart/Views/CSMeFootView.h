//
//  CSMeFootView.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^outLoginBtnClickBlock)(BOOL isClick);

@interface CSMeFootView : UIView

@property (nonatomic,copy) outLoginBtnClickBlock outLoginBlock;

@end
