//
//  UIView+ZRToast.m
//  ZiroomerProject
//
//  Created by zhiwei jiang on 2017/11/14.
//  Copyright © 2017年 www.ziroom.com. All rights reserved.
//

#import "UIView+ZRToast.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>
// positions
NSInteger const ZRToastKey = 8989909;
// general appearance
static const CGFloat ZRToastHorizontalPadding   = 12.0;
static const CGFloat ZRToastVerticalPadding     = 7.5f;
static const CGFloat ZRToastCornerRadius        = 2.0;       // 圆角
static const CGFloat ZRToastOpacity             = 0.95;         // 背景透明度
static const CGFloat ZRToastFontSize            = 12.0;         // 文字大小
static const CGFloat ZRToastMaxMessageLines     = 0;      // 最多显示文案行数
static const NSTimeInterval ZRToastFadeDuration = 0.2;     // 隐藏动画时间
static const CGFloat ZRToastMaxWidth            = 200.f - 2*ZRToastHorizontalPadding;      // 固定最大宽度 200
static const CGFloat ZRToastMaxHeight           = CGFLOAT_MAX;        // 固定最大高度 50
static const CGFloat ZRToastLineSpaces           = 4.f;     // 行间距
static const CGFloat ZRToastBottomSpaces      = 48.f;     // 底部距离

// shadow appearance
static const CGFloat ZRToastShadowOpacity       = 0.8;
static const CGFloat ZRToastShadowRadius        = 2.0;
static const CGSize  ZRToastShadowOffset        = { 2.0, 2.0 };
static const BOOL    ZRToastDisplayShadow       = NO;

// display duration
static const NSTimeInterval ZRToastDefaultDuration  = 2.0;

// associative reference keys
static const NSString * ZRToastTimerKey         = @"ZRToastTimerKey";

// positions
NSString * const ZRToastPositionTop             = @"top";
NSString * const ZRToastPositionCenter          = @"center";
NSString * const ZRToastPositionBottom          = @"bottom";

@implementation UIView(ZRToast)

#pragma mark - Toast Methods
/**
 默认toast
 */
- (void)makeToast:(NSString *)message {
    [self makeToast:message duration:ZRToastDefaultDuration position:nil];
}

/**
 自定义时间与位置toast
 */
- (void)makeToast:(NSString *)message duration:(NSTimeInterval)duration position:(id)position {
    
    UIView *befTostView =(UIView *)[[self mainWindow] viewWithTag:ZRToastKey];
    if (befTostView) {
        [self befToastHidenWithView:befTostView completion:^(BOOL finished) {
            if (finished) {
                UIView *toast = [self viewForMessage:message];
                toast.tag = ZRToastKey;
                [self showToast:toast duration:duration position:position];
            }
        }];
    }else{
        UIView *toast = [self viewForMessage:message];
        toast.tag = ZRToastKey;
        [self showToast:toast duration:duration position:position];
    }
}

/**
 添加toast到view上
 */
- (void)showToast:(UIView *)toast duration:(NSTimeInterval)duration position:(id)position
{
    if (!toast) {
        return;
    }
    
    toast.center = [self centerPointForPosition:position withToast:toast];
    toast.alpha = 0.0;
    
    [[self mainWindow] addSubview:toast];
    
    [UIView animateWithDuration:ZRToastFadeDuration
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         toast.alpha = 1.0;
                     } completion:^(BOOL finished) {
                         NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:duration target:self selector:@selector(toastTimerDidFinish:) userInfo:toast repeats:NO];
                         // associate the timer with the toast view
                         objc_setAssociatedObject (toast, &ZRToastTimerKey, timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                     }];
}

/**
 隐藏toast
 */
- (void)hideToast:(UIView *)toast  completion:(void (^ )(BOOL finished))completion{
    [UIView animateWithDuration:ZRToastFadeDuration
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState)
                     animations:^{
                         toast.alpha = 0.0;
                     } completion:^(BOOL finished) {
                         if (finished) {
                             [toast removeFromSuperview];
                             completion(finished);
                         }
                     }];
}

#pragma mark - Events
/**
 计时器调用隐藏toast
 */
- (void)toastTimerDidFinish:(NSTimer *)timer {
    [self hideToast:(UIView *)timer.userInfo completion:^(BOOL finished) {
    }];
}

/**
 中途取消toast显示
 */
- (void)befToastHidenWithView:(UIView *)view completion:(void (^ )(BOOL finished))completion{
    NSTimer *timer = (NSTimer *)objc_getAssociatedObject(self, &ZRToastTimerKey);
    [timer invalidate];
    
    [view removeFromSuperview];
    completion(YES);
}

#pragma mark - Helpers
/**
 toast获取中心点坐标
 */
- (CGPoint)centerPointForPosition:(id)point withToast:(UIView *)toast {
    if([point isKindOfClass:[NSString class]]) {
        if([point caseInsensitiveCompare:ZRToastPositionTop] == NSOrderedSame) {
            return CGPointMake([self mainWindow].bounds.size.width/2, (toast.frame.size.height / 2) + ZRToastVerticalPadding);
        } else if([point caseInsensitiveCompare:ZRToastPositionCenter] == NSOrderedSame) {
            return CGPointMake([self mainWindow].bounds.size.width / 2, [self mainWindow].bounds.size.height / 2);
        }
    } else if ([point isKindOfClass:[NSValue class]]) {
        return [point CGPointValue];
    }
    
    // default to bottom
    return CGPointMake([self mainWindow].bounds.size.width/2, ([self mainWindow].bounds.size.height - (toast.frame.size.height / 2)) - ZRToastBottomSpaces);
}

/**
 文案大小尺寸计算
 */
- (CGSize)sizeForString:(NSString *)string font:(UIFont *)font constrainedToSize:(CGSize)constrainedSize lineBreakMode:(NSLineBreakMode)lineBreakMode {
    if ([string respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = lineBreakMode;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle};
        
        CGRect boundingRect = [string boundingRectWithSize:constrainedSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
        return CGSizeMake(ceilf(boundingRect.size.width), ceilf(boundingRect.size.height));
    }
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return [string sizeWithFont:font constrainedToSize:constrainedSize lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
}

/**
 toast视图显示设置以及初始化
 */
- (UIView *)viewForMessage:(NSString *)message{
    // sanity
    if(message == nil) return nil;
    
    // dynamically build a toast view with any combination of message, title, & image.
    UILabel *messageLabel = nil;
    
    // create the parent view
    UIView *wrapperView = [[UIView alloc] init];
    wrapperView.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);
    wrapperView.layer.cornerRadius = ZRToastCornerRadius;
    
    if (ZRToastDisplayShadow) {
        wrapperView.layer.shadowColor = [UIColor blackColor].CGColor;
        wrapperView.layer.shadowOpacity = ZRToastShadowOpacity;
        wrapperView.layer.shadowRadius = ZRToastShadowRadius;
        wrapperView.layer.shadowOffset = ZRToastShadowOffset;
    }
    
    wrapperView.backgroundColor = [UIColor colorWithRed:((float)((0x444444 & 0xFF0000) >> 16))/255.0 green:((float)((0x444444 & 0xFF00) >> 8))/255.0 blue:((float)(0x444444 & 0xFF))/255.0 alpha:ZRToastOpacity];
    
    if (message != nil) {
        messageLabel = [[UILabel alloc] init];
        messageLabel.numberOfLines = ZRToastMaxMessageLines;
        messageLabel.font = [UIFont systemFontOfSize:ZRToastFontSize];
        messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.alpha = 1.0;
        messageLabel.text = message;
        messageLabel.textAlignment = NSTextAlignmentCenter;
        
        // size the message label according to the length of the text
        CGSize maxSizeMessage = CGSizeMake( ZRToastMaxWidth , ZRToastMaxHeight);
        CGSize expectedSizeMessage = [self sizeForString:message font:messageLabel.font constrainedToSize:maxSizeMessage lineBreakMode:messageLabel.lineBreakMode];
        messageLabel.frame = CGRectMake(0.0, 0.0, expectedSizeMessage.width, expectedSizeMessage.height);
        
        if (expectedSizeMessage.height>ZRToastFontSize+ZRToastLineSpaces) {
            messageLabel.frame = CGRectMake(0.0, 0.0, expectedSizeMessage.width, expectedSizeMessage.height+ZRToastLineSpaces);

            NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:message attributes:nil];
            NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setLineSpacing:ZRToastLineSpaces];//行间距
            [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [message length])];
            [messageLabel setAttributedText:attributedString];
        }
    }
    
    // messageLabel frame values
    CGFloat messageWidth, messageHeight, messageLeft, messageTop;
    
    if(messageLabel != nil) {
        messageWidth = messageLabel.bounds.size.width;
        messageHeight = messageLabel.bounds.size.height;
        messageLeft =  ZRToastHorizontalPadding;
        messageTop = ZRToastVerticalPadding;
    } else {
        messageWidth = messageHeight = messageLeft = messageTop = 0.0;
    }
    
    CGFloat longerWidth = MAX(0, messageWidth);
    CGFloat longerLeft = MAX(0, messageLeft);
    
    // wrapper width uses the longerWidth or the image width, whatever is larger. same logic applies to the wrapper height
    CGFloat wrapperWidth = MAX(ZRToastHorizontalPadding * 2, (longerLeft + longerWidth + ZRToastHorizontalPadding));
    CGFloat wrapperHeight = MAX(ZRToastVerticalPadding * 2 , (messageTop + messageHeight + ZRToastVerticalPadding));
    
    wrapperView.frame = CGRectMake(0.0, 0.0, wrapperWidth, wrapperHeight);
    
    if(messageLabel != nil) {
        messageLabel.frame = CGRectMake(messageLeft, messageTop, messageWidth, messageHeight);
        [wrapperView addSubview:messageLabel];
    }
    
    return wrapperView;
}

//获取当前window
- (UIWindow *)mainWindow
{
    UIApplication *app = [UIApplication sharedApplication];
    if ([app.delegate respondsToSelector:@selector(window)])
    {
        return [app.delegate window];
    }
    else
    {
        return [app keyWindow];
    }
}
@end

@implementation UIView (MBProgressHUD)

+ (MBProgressHUD *)showMBHUDInView:(UIView *)view{
    MBProgressHUD *_hud = [[MBProgressHUD alloc] initWithView:view];
    _hud.color = [UIColor whiteColor];
    _hud.backgroundColor = [UIColor clearColor];
    [view addSubview:_hud];
    _hud.mode = MBProgressHUDModeDeterminate;
//    NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:@"" withExtension:@"gif"];
//    UIImageView *_gifView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
//    _gifView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
//    _gifView.image = [UIImage imageNamed:@""];
//    _gifView.image = [UIImage sd_animatedGIFWithData:[NSData dataWithContentsOfURL:fileUrl]];
//    _hud.customView = _gifView;
    [_hud show:YES];
    return _hud;
}

+ (BOOL)hiddenMBHUDInView:(UIView *)view{
    return [MBProgressHUD hideHUDForView:view animated:YES];
}

+ (BOOL)hiddenAllMBHUDInView:(UIView *)view{
    return [MBProgressHUD hideAllHUDsForView:view animated:YES];
}

- (void)showHUD
{
    self.tag=1;
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *_hud = [[MBProgressHUD alloc] initWithView:self];
        _hud.color = [UIColor whiteColor];
        _hud.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.4];
        [self addSubview:_hud];
        _hud.mode = MBProgressHUDModeDeterminate;
//        NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:@"" withExtension:@"gif"];
        //        SvGifView *_gifView = [[SvGifView alloc] initWithCenter:CGPointMake(50, 50) fileURL:fileUrl];
        //        _gifView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        //        _hud.customView = _gifView;
        //        [_gifView startGif];
        //        [_hud show:YES];
//        UIImageView *_gifView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
//        _gifView.image = [UIImage sd_animatedGIFWithData:[NSData dataWithContentsOfURL:fileUrl]];
//        _gifView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
//        _hud.customView = _gifView;
        [_hud show:YES];
    });
    //    [NSTimer scheduledTimerWithTimeInterval:20 target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

- (void)hide
{
    if (self.tag==110110110) {
        return;
    }
    [self hideHUD];
}

//获取viewd的ViewController
- (UIViewController*)superViewController
{
    for (UIView* next =self; next; next = next.superview)
    {
        UIResponder* nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController*)nextResponder;
        }
    }
    
    return nil;
}


- (void)hideHUD
{
    self.tag=110110110;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self animated:YES];
    });
}


@end
