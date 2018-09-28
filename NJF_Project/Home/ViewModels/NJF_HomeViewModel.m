//
//  NJF_HomeViewModel.m
//  NJF_Project
//
//  Created by jinfeng niu on 2018/9/28.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import "NJF_HomeViewModel.h"
#import "NJF_UserInfoModel.h"

@implementation NJF_HomeViewModel

+ (void)requestUserData:(void(^)(id data))resultBlock{
    //此处应该是网络请求，假定请求结果是
    NSArray *userArr = @[@{@"name":@"lilei",@"des":@"一个安静的美男子"},@{@"name":@"xiaoming",@"des":@"帅是一种态度"},@{@"name":@"xiaoya",@"des":@"小哥哥，来玩啊"}];
    //此处可以框架json转模型
    NSMutableArray *userModelArr = [[NSMutableArray alloc] init];
    [userArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NJF_UserInfoModel *userModel = [[NJF_UserInfoModel alloc] init];
        userModel.name = obj[@"name"];
        userModel.des = obj[@"des"];
        [userModelArr addObject:userModel];
    }];
    if (resultBlock) resultBlock(userModelArr);
}
@end
