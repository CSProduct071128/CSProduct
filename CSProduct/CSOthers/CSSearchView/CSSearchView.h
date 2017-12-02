//
//  CSSearchView.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kCSSearchViewHeight 46.f


@protocol CSSearchViewDelegate <NSObject>

- (void) textChangeGetTheText:(NSString *)text;

@end

@interface CSSearchView : UIView

@property (nonatomic,strong) NSString *searchPlaceholder;

@property (nonatomic, weak) id <CSSearchViewDelegate>delegate; //代理属性

@end
