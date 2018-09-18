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
#import "NJF_PlistConfig.h"

static NSString *const NJF_ITEM_CONFIG = @"TabBarItemConfig.plist";

@implementation NJF_TabBarController

- (nullable instancetype)initWithItemArr:(NSArray <NSDictionary *> *)itemArr{
    self = [super init];
    if (self) {
//        [itemArr enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            UIViewController *vc = [obj objectForKey:@"vc"];
//            NSString *title = [obj objectForKey:@"title"];
//            NSString *normalImgeName = [obj objectForKey:@"normalImgeName"];
//            NSString *selImgeName = [obj objectForKey:@"selImgeName"];
//            [self addChildVC:vc title:title image:normalImgeName selectedImage:selImgeName];
//        }];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //plist文件解析
    NJF_PlistConfig *config = [[NJF_PlistConfig alloc] initWithName:NJF_ITEM_CONFIG];
    [config.itemArr enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController *vc = [[NSClassFromString([obj objectForKey:@"vc"]) alloc] init]  ;
        NSString *title = [obj objectForKey:@"title"];
        NSString *normalImgeName = [obj objectForKey:@"normalImgeName"];
        NSString *selImgeName = [obj objectForKey:@"selImgeName"];
        [self addChildVC:vc title:title image:normalImgeName selectedImage:selImgeName];
    }];
    // 设置自定义的tabbar
    [self setCustomtabbar];
}



#pragma mark - 设置自定义中心按钮
- (void)setCustomtabbar{
    NJF_TabBar *tabbar = [[NJF_TabBar alloc]init];
    [self setValue:tabbar forKeyPath:@"tabBar"];
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

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSLog(@"点击的item:%ld title:%@", item.tag, item.title);
    [self itemAnimation];
}

- (void)itemAnimation{
    for (UIControl *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

- (void)tabBarButtonClick:(UIControl *)tabBarButton
{
    for (UIView *imageView in tabBarButton.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            //需要实现的帧动画,这里根据需求自定义
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
            animation.duration = 1;
            animation.calculationMode = kCAAnimationCubic;
            //把动画添加上去就OK了
            [imageView.layer addAnimation:animation forKey:nil];
        }
    }
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
