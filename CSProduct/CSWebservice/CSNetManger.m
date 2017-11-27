//
//  CSNetManger.m
//  HttpRequestHelper
//
//  Created by Chris on 15/7/3.
//  Copyright (c) 2015年 Chris. All rights reserved.
//

#import "CSNetManger.h"
#import <Reachability/Reachability.h>
#import <UIKit/UIApplication.h>

static CSNetManger *netWorkManger = nil;

@implementation CSNetManger

+ (CSNetManger *)instance
{
    @synchronized(self){
        if (netWorkManger == nil) {
            netWorkManger = [[[self class] alloc] init];
        }
        return netWorkManger;
    }
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self){
        if (netWorkManger == nil) {
            netWorkManger = [super allocWithZone:zone];
        }
        return netWorkManger;
    }
}

+ (id)copyWithZone:(NSZone *)zone
{
    return netWorkManger;
}



- (BOOL)isNetworkRunning
{
    Reachability * reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus state = reachability.currentReachabilityStatus;
    BOOL result = NO;
    switch (state) {
        case NotReachable: {
            result = NO;
        }
            break;
        case ReachableViaWiFi: {
            result = YES;
        }
            break;
        case ReachableViaWWAN: {
            result = YES;
        }
            break;
        default: {
            result = YES;
        }
            break;
    }
    return result;
}


- (NETWORK_TYPE)networkType
{
    Reachability * reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus state = reachability.currentReachabilityStatus;
    NETWORK_TYPE result = NETWORK_TYPE_NONE;
    switch (state) {
        case NotReachable: {
            result = NETWORK_TYPE_NONE;
        }
            break;
        case ReachableViaWiFi: {
            result = NETWORK_TYPE_WIFI;
        }
            break;
        case ReachableViaWWAN: {
            result = NETWORK_TYPE_4G;
        }
            break;
        default: {
            result = NETWORK_TYPE_3G;
        }
            break;
    }
    return result;
}

@end
