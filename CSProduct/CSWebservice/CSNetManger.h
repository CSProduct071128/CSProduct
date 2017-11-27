//
//  CSNetManger.h
//  HttpRequestHelper
//
//  Created by Chris on 15/7/3.
//  Copyright (c) 2015年 Chris. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    
    NETWORK_TYPE_NONE= 0,
    
    NETWORK_TYPE_2G= 1,
    
    NETWORK_TYPE_3G= 2,
    
    NETWORK_TYPE_4G= 3,
    
    NETWORK_TYPE_5G= 4,//  5G目前为猜测结果
    
    NETWORK_TYPE_WIFI= 5,
    
}NETWORK_TYPE;

@interface CSNetManger : NSObject

+ (CSNetManger *)instance;

/**
 *  检测网络函数
 *
 *  @return 有网络时 YES
 */
- (BOOL)isNetworkRunning;

- (NETWORK_TYPE)networkType;

@end
