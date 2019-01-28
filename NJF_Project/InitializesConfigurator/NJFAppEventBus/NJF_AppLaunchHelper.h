//
//  NJF_AppLaunchHelper.h
//  NJF_Project
//
//  Created by niujf on 2019/1/28.
//  Copyright © 2019年 jinfeng niu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AppLaunchProtocol
- (void)initializeWhenLaunch;
@end


@protocol IoCObjectProtocol
-(instancetype)initWithParam:(NSDictionary *)param;
@end


/*
 AutoInitialize.plist
 classes
 item0 classA
 item1  classB
 */

@interface NJF_AppLaunchHelper : NSObject
@property (nonatomic, strong, readonly) dispatch_queue_t launchQueue;
@property (nonatomic, class, readonly) NJF_AppLaunchHelper* shared;

//init modules with AutoInitialize
-(void)autoInitModule;

@end

NS_ASSUME_NONNULL_END
