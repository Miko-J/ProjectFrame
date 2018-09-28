//
//  NJF_HomeController.m
//  NJF_Project
//
//  Created by jinfeng niu on 2018/9/15.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import "NJF_HomeController.h"
#import "NJF_HomeTableView.h"
#import "NJF_HomeViewModel.h"

@interface NJF_HomeController ()
@property (nonatomic, strong) NJF_HomeTableView *homeView;
@end

@implementation NJF_HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addChildViews];
    [self requestData];
}

- (void)addChildViews{
    [self.view addSubview:self.homeView];
}

- (void)requestData{
    __weak typeof(self) weakSelf = self;
    [NJF_HomeViewModel requestUserData:^(id data) {
        __strong typeof(self) strongSelf = weakSelf;
        strongSelf.homeView.userInfoModelArr = data;
    }];
}
#pragma mark - lazy loading
- (NJF_HomeTableView *)homeView{
    if (!_homeView) {
        _homeView = [[NJF_HomeTableView alloc] initWithFrame:self.view.bounds];
    }
    return _homeView;
}
@end
