//
//  NJF_MessageViewController.m
//  NJF_Project
//
//  Created by niujf on 2018/9/28.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import "NJF_MessageViewController.h"
#import "UIView+Toast.h"

@interface NJF_MessageViewController ()

@end

@implementation NJF_MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    [self.navigationController.view makeToast:@"This is a piece of toast on top for 3 seconds"
                                     duration:3.0
                                     position:CSToastPositionCenter];
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
