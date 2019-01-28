//
//  NJF_InvocationHelper.h
//  NJF_Project
//
//  Created by niujf on 2019/1/28.
//  Copyright © 2019年 jinfeng niu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
#define TLInvocationDomain @"com.NJF_InvocationHelper.performClass"

typedef NS_ENUM(NSInteger,NJF_InvocationError) {
    NJF_InvocationError_No_Class,
    NJF_InvocationError_No_Selector,
    NJF_InvocationError_Param_Unmatch,
};

@interface NJF_InvocationHelper : NSObject

//失败时返回NSError，成功时返回nil或value
+ (id _Nullable)performClass:(NSString *)className selector:(nonnull SEL)selector params:(NSDictionary *_Nullable)params;
+ (id _Nullable)performInstance:(id)instance selector:(nonnull SEL)selector params:(NSDictionary *_Nullable)params;

@end

NS_ASSUME_NONNULL_END
