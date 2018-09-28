//
//  NJF_HomeTableView.h
//  NJF_Project
//
//  Created by niujf on 2018/9/28.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NJF_UserInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NJF_HomeTableView : UIView

@property (nonatomic, strong) NSArray <NJF_UserInfoModel *> *userInfoModelArr;

@end

NS_ASSUME_NONNULL_END
