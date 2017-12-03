//
//  CSDataSave.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSDataSave.h"
#define kLoginInfo_PATH @"loginInfo.login"
@interface CSDataSave()

@end
@implementation CSDataSave

+ (void)encodeWithModel:(CSDataSave *)model{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [path stringByAppendingPathComponent:kLoginInfo_PATH];
    [NSKeyedArchiver archiveRootObject:model toFile:filePath];
}

+ (CSDataSave *)getLoginInfo{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [path stringByAppendingPathComponent:kLoginInfo_PATH];
    // 解档
    CSDataSave *lInfo = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    return lInfo;
}


- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.userId forKey:@"userId"];
    [coder encodeObject:self.loginName forKey:@"loginName"];
    [coder encodeObject:self.loginPhone forKey:@"loginPhone"];
    [coder encodeObject:self.loginWNumber forKey:@"loginWNumber"];
    [coder encodeObject:self.loginMail forKey:@"loginMail"];
    [coder encodeObject:self.loginBm forKey:@"loginBm"];
    [coder encodeObject:self.loginPosition forKey:@"loginPosition"];
    [coder encodeInteger:self.isLogin forKey:@"isLogin"];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.userId = [coder decodeObjectForKey:@"userId"];
        self.loginName = [coder decodeObjectForKey:@"loginName"];
        self.loginPhone = [coder decodeObjectForKey:@"loginPhone"];
        self.loginWNumber = [coder decodeObjectForKey:@"loginWNumber"];
        self.loginMail = [coder decodeObjectForKey:@"loginMail"];
        self.loginBm = [coder decodeObjectForKey:@"loginBm"];
        self.loginPosition = [coder decodeObjectForKey:@"loginPosition"];
        self.isLogin = [coder decodeIntegerForKey:@"isLogin"];
    }
    return self;
}

@end
