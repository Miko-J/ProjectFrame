//
//  NJF_NavigationController.m
//  NJF_Project
//
//  Created by jinfeng niu on 2018/9/12.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import "NJF_NavigationController.h"
#import "NJF_MacroDefinition.h"

@interface NJF_NavigationController ()

@end

@implementation NJF_NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //解决自定义返回按钮后滑动手势失效的问题
    self.interactivePopGestureRecognizer.delegate = nil;
}

+ (void)initialize
{
    //移除导航栏下面的黑线
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    //设置导航栏的背景色
    [UINavigationBar appearance] .backgroundColor = [UIColor grayColor];
    //设置字体和颜色
    [[UINavigationBar appearance] setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
    NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    //这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
    //解决iPhone X push页面时 tabBar上移的问题
    CGRect frame = self.tabBarController.tabBar.frame;
    frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
    self.tabBarController.tabBar.frame = frame;
}

- (void)back
{
    [self popViewControllerAnimated:YES];
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
