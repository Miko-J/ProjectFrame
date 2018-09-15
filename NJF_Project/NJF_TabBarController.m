//
//  NJF_TabBarController.m
//  NJF_Project
//
//  Created by jinfeng niu on 2018/9/12.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//


#import "NJF_TabBarController.h"
#import "NJF_NavigationController.h"
#import "NJF_TabBar.h"
#import "NJF_MacroDefinition.h"
#import "NJF_HomeController.h"

@interface NJF_TabBarController ()

@end

@implementation NJF_TabBarController

+ (void)initialize{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NJF_HomeController *homeVC = [[NJF_HomeController alloc] init];
    [self addChildVC:homeVC title:@"首页" image:@"home_normal" selectedImage:@"home_highlight"];
    
    UIViewController *vc1 = [[UIViewController alloc] init];
    [self addChildVC:vc1 title:@"同城" image:@"mycity_normal" selectedImage:@"mycity_highlight"];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    [self addChildVC:vc2 title:@"消息" image:@"message_normal" selectedImage:@"message_highlight"];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    [self addChildVC:vc3 title:@"我的" image:@"account_normal" selectedImage:@"account_highlight"];
    
    // 设置自定义的tabbar
    [self setCustomtabbar];
}

#pragma mark - 设置自定义中心按钮
- (void)setCustomtabbar{
    NJF_TabBar *tabbar = [[NJF_TabBar alloc]init];
    [self setValue:tabbar forKeyPath:@"tabBar"];
    [tabbar.centerBtn addTarget:self action:@selector(centerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addChildVC:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSDictionary *dict = [NSDictionary dictionaryWithObject:NJF_Color(255, 211, 59) forKey:NSForegroundColorAttributeName];
    [vc.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    NJF_NavigationController *nav = [[NJF_NavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

- (void)centerBtnClick:(UIButton *)btn{
    NSLog(@"点击了中心的按钮");
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSLog(@"点击的item:%ld title:%@", item.tag, item.title);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
