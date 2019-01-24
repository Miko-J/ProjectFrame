//
//  NJF_HttpRequest.h
//  NJF_Project
//
//  Created by niujf on 2019/1/24.
//  Copyright © 2019年 jinfeng niu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
 以下Block的参数你根据自己项目中的需求来指定, 这里仅仅是一个演示的例子
 */

/**
 请求成功的block
 @param response 响应体数据
 */
typedef void(^NJF_RequestSuccess)(id response);
/**
 请求失败的block
 @param error 扩展信息
 */
typedef void(^NJF_RequestFailure)(NSError *error);

@interface NJF_HttpRequest : NSObject

#pragma mark - 登陆退出
/** 登录*/
+ (NSURLSessionTask *)getLoginWithParameters:(id)parameters
                                     success:(NJF_RequestSuccess)success
                                     failure:(NJF_RequestFailure)failure;

/** 退出*/
+ (NSURLSessionTask *)getExitWithParameters:(id)parameters
                                    success:(NJF_RequestSuccess)success
                                    failure:(NJF_RequestFailure)failure;

@end

NS_ASSUME_NONNULL_END
