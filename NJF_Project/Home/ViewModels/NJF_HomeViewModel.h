//
//  NJF_HomeViewModel.h
//  NJF_Project
//
//  Created by jinfeng niu on 2018/9/28.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NJF_HomeViewModel : NSObject

+ (void)requestUserData:(void(^)(id data))resultBlock;

@end
