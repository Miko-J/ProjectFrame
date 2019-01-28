//
//  NJF_BuglyConfigurator.m
//  NJF_Project
//
//  Created by niujf on 2019/1/28.
//  Copyright © 2019年 jinfeng niu. All rights reserved.
//

#import "NJF_BuglyConfigurator.h"
#import "NJF_Project-Swift.h"
#import "NJF_AppLaunchHelper.h"
#import <Bugly/Bugly.h>

@interface NJF_BuglyConfigurator ()
@property (nonatomic, strong) NSString *appkey;
@end

@implementation NJF_BuglyConfigurator

- (void)initializeWhenLaunch{
    NSDictionary *dict = [self dictWithPlist:@"AppConfigurator.plist"];
    [self safeSetValuesForKeys:[dict objectForKey:NSStringFromClass([self class])]];
    dispatch_async(NJF_AppLaunchHelper.shared.launchQueue, ^{
        // 设置key
        NSAssert(self.appkey, @"缺少bugly配置");
        if (self.appkey) {
            [Bugly startWithAppId:self.appkey];
        }
    });
}

@end
