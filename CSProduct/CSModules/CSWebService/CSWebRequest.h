//
//  CSBaseRequest.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/26.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSBaseRequest.h"

@interface CSWebRequest : CSBaseRequest
@property(nonatomic,copy)NSString *httpDetailUrl;

@property(nonatomic,assign)CSRequestMethod method;

@property(nonatomic,copy)NSDictionary *httpHeaderFieldDictionary;

@end
