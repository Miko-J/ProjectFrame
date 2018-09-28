//
//  NJF_PlistConfig.m
//  NJF_Project
//
//  Created by jinfeng niu on 2018/9/17.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import "NJF_PlistConfig.h"

@interface NJF_PlistConfig()
@property (nonatomic, copy) NSString *configName;
@property (nonatomic, copy) void(^configUrlBlock)(NSURL *url);
@end
@implementation NJF_PlistConfig

- (void)dealloc{
    
}

- (instancetype)initWithName:(NSString *)configName url:(void(^)(NSURL *configUrl))url{
    self = [super init];
    if (self) {
        self.configName = configName;
        self.configUrlBlock = url;
        [self loadConfig];
    }
    return self;
}

+ (nullable instancetype)configWithName:(NSString *)configName url:(void(^)(NSURL *configUrl))url{
    return [[self alloc] initWithName:configName url:url];
}

- (NSURL *)urlWithName:(NSString *)configName {
    NSURL *fileURL = nil;
    BOOL isDirectory = NO;
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [cachePath stringByAppendingPathComponent:configName];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory] && !isDirectory) {
        fileURL = [NSURL fileURLWithPath:filePath];
    } else {
        fileURL = [[NSBundle mainBundle] URLForResource:configName withExtension:nil];
        if (![[NSFileManager defaultManager] fileExistsAtPath:fileURL.path isDirectory:&isDirectory] || isDirectory) {
            NSAssert(NO, @"%@", [configName stringByAppendingString:@"配置文件未找到"]);
        }
    }
    return fileURL;
}

- (BOOL)loadConfig {
    NSURL *configUrl = [self urlWithName:self.configName];
    NSAssert(configUrl, @"未读取到配置文件!");
    if (!configUrl) {
        return NO;
    }
    if (self.configUrlBlock) {
        self.configUrlBlock(configUrl);
    }
    return YES;
}

@end
