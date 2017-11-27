//
//  CSNetworkPrivate.h
//  HttpRequestHelper
//
//  Created by Chris on 15/7/2.
//  Copyright (c) 2015年 Chris. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSBaseRequest.h"

FOUNDATION_EXPORT void CSLog(NSString *format, ...) NS_FORMAT_FUNCTION(1,2);

@interface CSNetworkPrivate : NSObject

+ (BOOL)checkJson:(id)json withValidator:(id)validatorJson;

+ (NSString *)urlStringWithOriginUrlString:(NSString *)originUrlString
                          appendParameters:(NSDictionary *)parameters;
@end

