//
//  NJF_MineViewController.m
//  NJF_Project
//
//  Created by niujf on 2018/9/28.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import "NJF_MineViewController.h"
#import "NJF_PhotoSelectView.h"
#import "NJF_MacroDefinition.h"

@interface NJF_MineViewController ()
@property (nonatomic, strong) NJF_PhotoSelectView *phtotoSelView;
@end

@implementation NJF_MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addChildView];
}

- (void)addChildView{
    self.phtotoSelView = ({
        NJF_PhotoSelectView *photoSelView = [[NJF_PhotoSelectView alloc] initWithFrame:CGRectMake(0, 20, kScreenWidth , 500)];
        photoSelView.maxCountTF = 9;
        photoSelView.VC = self;
        [self.view addSubview:photoSelView];
        photoSelView;
    });
}

@end
