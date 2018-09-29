//
//  NJF_HomeViewModel.m
//  NJF_Project
//
//  Created by jinfeng niu on 2018/9/28.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NJF_HomeViewModel.h"


@implementation NJF_HomeViewModel

- (nullable instancetype)init{
    if (self = [super init]) {
        self.textColor = [UIColor grayColor];
        self.detailTextColor = [UIColor blackColor];
    }
    return self;
}

- (void)requestUserData:(void (^)(id data))resultBlock{
    //此处应该是网络请求，假定请求结果是
    NSArray *userArr = @[@{@"name":@"lilei",@"des":@"一个安静的美男子"},@{@"name":@"xiaoming",@"des":@"帅是一种态度"},@{@"name":@"xiaoya",@"des":@"小哥哥，来玩啊"}];
    //此处可以框架json转模型
    [userArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NJF_UserInfoModel *userModel = [[NJF_UserInfoModel alloc] init];
        userModel.name = obj[@"name"];
        userModel.des = obj[@"des"];
        [self.userInfoArr addObject:userModel];
    }];
    //如果vm比较简单，可以回调数组,正常的网络请求有成功和失败，到底用一个回调还是两个回调，看个人喜好。
    if (resultBlock) resultBlock(@"获取到网络请求数据");
}

#pragma mark - lazy loading
- (NSMutableArray *)userInfoArr{
    if (!_userInfoArr) {
        _userInfoArr = [NSMutableArray array];
    }
    return _userInfoArr;
}
@end
