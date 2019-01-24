//
//  NJF_InterfacedConst.m
//  NJF_Project
//
//  Created by niujf on 2019/1/24.
//  Copyright © 2019年 jinfeng niu. All rights reserved.
//

#import "NJF_InterfacedConst.h"

#ifdef DEBUG
NSString *const kApiPrefix = @"https://www.baidu.com";
#else
NSString *const kApiPrefix = @"https://www.baidu.com";
#endif


/** 登录*/
NSString *const kLogin = @"/login";
/** 平台会员退出*/
NSString *const kExit = @"/exit";


