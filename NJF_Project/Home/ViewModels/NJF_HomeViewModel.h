//
//  NJF_HomeViewModel.h
//  NJF_Project
//
//  Created by jinfeng niu on 2018/9/28.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NJF_UserInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NJF_HomeViewModel : NSObject

@property (nonatomic, strong) NSMutableArray *userInfoArr;

- (void)requestUserData:(void (^)(id data))resultBlock;

@property (nonatomic, strong) UIColor *textColor;

@property (nonatomic, strong) UIColor *detailTextColor;

@end

NS_ASSUME_NONNULL_END
