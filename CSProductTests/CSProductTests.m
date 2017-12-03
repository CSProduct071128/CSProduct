//
//  CSProductTests.m
//  CSProductTests
//
//  Created by zhiwei jiang on 2017/11/26.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//


/**
 XCTFail(format…)  //生成一个失败的测试；
 XCTAssertNil(a1, format...)  //为空判断，a1为空时通过，反之不通过；
 XCTAssertNotNil(a1, format…) //不为空判断，a1不为空时通过，反之不通过；
 XCTAssert(expression, format...) //当expression求值为TRUE时通过；
 XCTAssertTrue(expression, format...) //当expression求值为TRUE时通过；
 XCTAssertFalse(expression, format...)  //当expression求值为False时通过；
 XCTAssertEqualObjects(a1, a2, format...)  //判断相等，[a1 isEqual:a2]值为TRUE时通过，其中一个不为空时，不通过；
 XCTAssertNotEqualObjects(a1, a2, format...)  //判断不等，[a1 isEqual:a2]值为False时通过；
 XCTAssertEqual(a1, a2, format...)  //判断相等（当a1和a2是 C语言标量、结构体或联合体时使用,实际测试发现NSString也可以）；
 XCTAssertNotEqual(a1, a2, format...)  //判断不等（当a1和a2是 C语言标量、结构体或联合体时使用）；
 XCTAssertEqualWithAccuracy(a1, a2, accuracy, format...)  //判断相等，（double或float类型）提供一个误差范围，当在误差范围（+/-accuracy）以内相等时通过测试；
 XCTAssertNotEqualWithAccuracy(a1, a2, accuracy, format...)   //判断不等，（double或float类型）提供一个误差范围，当在误差范围以内不等时通过测试；
 XCTAssertThrows(expression, format...)  //异常测试，当expression发生异常时通过；反之不通过；
 XCTAssertThrowsSpecific(expression, specificException, format...)  //异常测试，当expression发生specificException异常时通过；反之发生其他异常或不发生异常均不通过；
 XCTAssertThrowsSpecificNamed(expression, specificException, exception_name, format...)  //异常测试，当expression发生具体异常、具体异常名称的异常时通过测试，反之不通过；
 XCTAssertNoThrow(expression, format…)  //异常测试，当expression没有发生异常时通过测试；
 XCTAssertNoThrowSpecific(expression, specificException, format...)  //异常测试，当expression没有发生具体异常、具体异常名称的异常时通过测试，反之不通过；
 XCTAssertNoThrowSpecificNamed(expression, specificException, exception_name, format...)  //异常测试，当expression没有发生具体异常、具体异常名称的异常时通过测试，反之不通过
 */

#import <XCTest/XCTest.h>
#import "CSBaseService.h"
#import "CSWebRequest.h"
#import "CSMeBusinessManage.h"
#define WAIT do {\
[self expectationForNotification:@"CSNOTIFYTEST" object:nil handler:nil];\
[self waitForExpectationsWithTimeout:10 handler:nil];\
} while (0);

#define NOTIFY \
[[NSNotificationCenter defaultCenter]postNotificationName:@"CSNOTIFYTEST" object:nil];

@interface CSProductTests : XCTestCase
{
    CSMeBusinessManage *busnissManage;
}

@end

@implementation CSProductTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    // 在这里放设置代码。此方法在类中每个测试方法调用之前调用。
    busnissManage  = [[CSMeBusinessManage alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    // 在这里放teardown代码。这个方法是在类中调用每个测试方法之后调用的。
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    // 这是一个功能测试用例的例子。使用XCTAssert和相关函数验证您的测试结果是否正确。
    /**
         每个测试用例开头用test即可
     */
    [CSBaseService postJsonDataRequestWithDetailUrl:@"adat/sk/101110101.html" param:nil header:nil cls:[NSDictionary class] success:^(id logicDicData, NSString *msg, NSString *logiccode) {
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
    // 这是一个性能测试用例。
    //    [self measureBlock:^{
    //        // Put the code you want to measure the time of here.
    //    }];
}

/**
     个人页面业务逻辑测试用例
 */
- (void)testBusnissManage{
    [busnissManage getMeViewShowDataWithBlock:^(NSArray *cellDataArray, NSArray *headDataArray, NSString *errorStr) {
        NSLog(@"cellDataArray:%@",cellDataArray);
        NSLog(@"headDataArray:%@",headDataArray);
        NSLog(@"errorStr:%@",errorStr);
            NOTIFY
            XCTAssertNil(errorStr, @"没有错误信息");
            XCTAssertNotNil(cellDataArray, @"这个正常");
            XCTAssertNotNil(headDataArray, @"登录信息请求出错");
    }];
    WAIT
}


@end
