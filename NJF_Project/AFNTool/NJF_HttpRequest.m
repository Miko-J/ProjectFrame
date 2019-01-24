//
//  NJF_HttpRequest.m
//  NJF_Project
//
//  Created by niujf on 2019/1/24.
//  Copyright © 2019年 jinfeng niu. All rights reserved.
//

#import "NJF_HttpRequest.h"
#import "NJF_InterfacedConst.h"
#import "NJF_NetworkTool.h"

@implementation NJF_HttpRequest

/** 登录*/
+ (NSURLSessionTask *)getLoginWithParameters:(id)parameters
                                     success:(NJF_RequestSuccess)success
                                     failure:(NJF_RequestFailure)failure
{
    // 将请求前缀与请求路径拼接成一个完整的URL
    NSString *url = [NSString stringWithFormat:@"%@%@",kApiPrefix,kLogin];
    return [self requestWithURL:url parameters:parameters success:success failure:failure];
}

/** 退出*/
+ (NSURLSessionTask *)getExitWithParameters:(id)parameters
                                    success:(NJF_RequestSuccess)success
                                    failure:(NJF_RequestFailure)failure
{
    NSString *url = [NSString stringWithFormat:@"%@%@",kApiPrefix,kExit];
    return [self requestWithURL:url parameters:parameters success:success failure:failure];
}

/*
 配置好NJF_NetworkHelper各项请求参数,封装成一个公共方法,给以上方法调用,
 相比在项目中单个分散的使用NJF_NetworkHelper/其他网络框架请求,可大大降低耦合度,方便维护
 在项目的后期, 你可以在公共请求方法内任意更换其他的网络请求工具,切换成本小
 */

#pragma mark - 请求的公共方法

+ (NSURLSessionTask *)requestWithURL:(NSString *)URL parameters:(NSDictionary *)parameter
                             success:(NJF_RequestSuccess)success
                             failure:(NJF_RequestFailure)failure
{
    // 在请求之前你可以统一配置你请求的相关参数 ,设置请求头, 请求参数的格式, 返回数据的格式....这样你就不需要每次请求都要设置一遍相关参数
    // 设置请求头
    [NJF_NetworkTool setValue:@"9" forHTTPHeaderField:@"fromType"];
    // 发起请求
    return [NJF_NetworkTool POST:URL parameters:parameter success:^(id responseObject) {
        // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
        success(responseObject);
    } failure:^(NSError *error) {
        // 同上
        failure(error);
    }];
}

@end
