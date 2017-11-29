//
//  ViewController.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/26.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "ViewController.h"
#import "CSZiroomViewController.h"
#import "CSAddressBookViewController.h"
#import "CSMeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //    [CSBaseService postJsonDataRequestWithDetailRul:@"adat/sk/101110101.html" param:nil header:nil cls:[NSDictionary class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
//        NSLog(@"正确：%@",logicDicData);
//    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
//        NSLog(@"错误：%@",errorMsg);
//    }];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"controller Show");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
