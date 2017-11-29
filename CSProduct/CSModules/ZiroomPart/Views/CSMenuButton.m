//
//  CSMenuButton.m
//  CSProduct
//
//  Created by LiGuoTing on 2017/11/29.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSMenuButton.h"

@implementation CSMenuButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // frame image
    CGRect newImageFrame = self.imageView.frame;
    newImageFrame.origin.x = self.frame.size.width/2 - self.imageView.size.width/2;
    newImageFrame.origin.y = self.frame.size.height/2 - self.imageView.size.height + 2;
    self.imageView.frame = newImageFrame;
    
    // frame text
    CGRect newFrame = [self titleLabel].frame;
    newFrame.origin.x = 0;
    newFrame.origin.y = self.frame.size.height/2 + 6;
    newFrame.size.width = self.frame.size.width;
    
    self.titleLabel.frame = newFrame;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}


@end
