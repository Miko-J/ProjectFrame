//
//  NJF_HomeController.m
//  NJF_Project
//
//  Created by jinfeng niu on 2018/9/15.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import "NJF_HomeController.h"
#import "NJF_HomeTableView.h"

@interface NJF_HomeController ()
@property (nonatomic, strong) NJF_HomeTableView *homeView;
@end

@implementation NJF_HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self addChildViews];
}

- (void)addChildViews{
    [self.view addSubview:self.homeView];
}


#pragma mark - lazy loading
- (NJF_HomeTableView *)homeView{
    if (!_homeView) {
        _homeView = [[NJF_HomeTableView alloc] initWithFrame:self.view.bounds];
    }
    return _homeView;
}
@end
