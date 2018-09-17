//
//  NJF_PlistConfig.h
//  NJF_Project
//
//  Created by jinfeng niu on 2018/9/17.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NJF_PlistConfigProtocol.h"

@interface NJF_PlistConfig : NSObject <ConfigAPI>
- (nullable instancetype)initWithName:(NSString *)configName;
//- (instancetype)init UNAVAILABLE_ATTRIBUTE;
//+ (instancetype)new UNAVAILABLE_ATTRIBUTE;
@end
