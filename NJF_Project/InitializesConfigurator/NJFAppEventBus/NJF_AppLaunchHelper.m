//
//  NJF_AppLaunchHelper.m
//  NJF_Project
//
//  Created by niujf on 2019/1/28.
//  Copyright © 2019年 jinfeng niu. All rights reserved.
//

#import "NJF_AppLaunchHelper.h"
#import "NJF_InvocationHelper.h"

NSString *const AutoInitializePlist = @"AutoInitialize.plist";

@interface NJF_AppLaunchHelper(){
@private
dispatch_queue_t _launchQueue;
NSDictionary<NSString *,NSString*> *dict;
}
@end

@implementation NJF_AppLaunchHelper

+(NJF_AppLaunchHelper *)shared {
    static NJF_AppLaunchHelper * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [NJF_AppLaunchHelper new];
    });
    return instance;
}

-(dispatch_queue_t)launchQueue {
    if (!_launchQueue) {
        _launchQueue = dispatch_queue_create("com.appLaunch.quene", DISPATCH_QUEUE_CONCURRENT);
    }
    return _launchQueue;
}

-(void)autoInitModule {
    NSURL *url = [[NSBundle mainBundle] URLForResource:AutoInitializePlist withExtension:nil];
    if (url) {
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfURL:url];
        NSArray<NSString *> *classArr = [dict objectForKey:@"classes"];
        [classArr enumerateObjectsUsingBlock:^(NSString * _Nonnull className, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([className isKindOfClass:[NSString class]]) {
                [NJF_InvocationHelper performClass:className selector:@selector(initializeWhenLaunch) params:nil];
            }
            else {
                @throw [NSException exceptionWithName:NSInvalidArgumentException
                                               reason:@"className must be string"
                                             userInfo:nil];
            }
        }];
    }
}


@end
