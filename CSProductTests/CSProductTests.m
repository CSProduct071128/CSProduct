//
//  CSProductTests.m
//  CSProductTests
//
//  Created by zhiwei jiang on 2017/11/26.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CSBaseService.h"
#import "CSWebRequest.h"
#define WAIT do {\
[self expectationForNotification:@"CSNOTIFYTEST" object:nil handler:nil];\
[self waitForExpectationsWithTimeout:30 handler:nil];\
} while (0);

#define NOTIFY \
[[NSNotificationCenter defaultCenter]postNotificationName:@"CSNOTIFYTEST" object:nil];

@interface CSProductTests : XCTestCase

@end

@implementation CSProductTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    [CSBaseService postJsonDataRequestWithDetailRul:@"adat/sk/101110101.html" param:nil header:nil cls:[NSDictionary class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
        NOTIFY
        XCTAssertNotNil(logicDicData, @"出错了");

        NSLog(@"正确：%@",logicDicData);
    } failure:^(CSBaseRequest *request, NSString *errorMsg) {
        NSLog(@"错误：%@",errorMsg);
    }];
    WAIT
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
