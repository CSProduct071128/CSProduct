//
//  CSMeHeadView.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSPersonInfoModel.h"

@interface CSMeHeadView : UIView
- (void)setHeadModel:(CSPersonInfoModel *)model;

- (void)setName:(NSString *)name andImage:(NSString *)url;

@end
