//
//  CSNetworkLogModel.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/11/26.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSNetworkLogModel : NSObject <NSCoding>
@property (nonatomic, copy) NSString *urlString;

@property (nonatomic, copy) NSString *httpMethodString;

@property (nonatomic, copy) NSString *httpBodyString;

@property (nonatomic, copy) NSString *responseString;

@property (nonatomic, copy) NSString *classString;

@property (nonatomic, copy) NSString *timeString;

@end
