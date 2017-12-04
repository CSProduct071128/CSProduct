//
//  CSWebViewController.m
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/4.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSWebViewController.h"

@interface CSWebViewController ()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView *webView;

@end

@implementation CSWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
  
}

-(void)setWebWithUrl:(NSString *)url{
    
    CGRect bounds = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_WIDTH-64);
    UIWebView* webView = [[UIWebView alloc]initWithFrame:bounds];
    webView.delegate = self;
    webView.scalesPageToFit = YES;//自动对页面进行缩放以适应屏幕
    webView.detectsPhoneNumbers = YES;//自动检测网页上的电话号码，单击可以拨打
    [self.view addSubview:webView];
    self.webView = webView;
    NSURL *nsurl = [NSURL URLWithString:url];//创建URL
    NSURLRequest* request = [NSURLRequest requestWithURL:nsurl];//创建NSURLRequest
    [_webView loadRequest:request];//加载
    
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    
   
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
