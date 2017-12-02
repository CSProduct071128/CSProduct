//
//  CSPositionViewController.h
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "BaseViewController.h"

@interface CSPositionViewController : BaseViewController

@property (nonatomic,copy) void (^cellSelectBlock)(NSString * textStr);

@end
