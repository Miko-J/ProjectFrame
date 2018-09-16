//
//  AppDelegate.m
//  NJF_Project
//
//  Created by jinfeng niu on 2018/9/11.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import "AppDelegate.h"
#import "NJF_TabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    NSArray <NSDictionary *> *itemArr = @[@{@"vc":[UIViewController new],@"title":@"首页",@"normalImgeName":@"home_normal",@"selImgeName":@"home_highlight"},
                                          @{@"vc":[UIViewController new],@"title":@"同城",@"normalImgeName":@"mycity_normal",@"selImgeName":@"mycity_highlight"},
                                          @{@"vc":[UIViewController new],@"title":@"消息",@"normalImgeName":@"message_normal",@"selImgeName":@"message_highlight"},
                                          @{@"vc":[UIViewController new],@"title":@"我的",@"normalImgeName":@"account_normal",@"selImgeName":@"account_highlight"},
                                          ];
    NJF_TabBarController *tabBarVC = [[NJF_TabBarController alloc] initWithItemArr:itemArr];
    self.window.rootViewController = tabBarVC;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
