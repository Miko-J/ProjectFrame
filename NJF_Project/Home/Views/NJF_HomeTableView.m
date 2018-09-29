//
//  NJF_HomeTableView.m
//  NJF_Project
//
//  Created by niujf on 2018/9/28.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import "NJF_HomeTableView.h"

@interface NJF_HomeTableView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation NJF_HomeTableView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addChildViews];
    }
    return self;
}

- (void)addChildViews{
    [self addSubview:self.tableView];
}

- (void)setHomeViewModel:(NJF_HomeViewModel *)homeViewModel{
    _homeViewModel = homeViewModel;
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.homeViewModel.userInfoArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    NJF_UserInfoModel *userInfoModel = self.homeViewModel.userInfoArr[indexPath.row];
    cell.textLabel.text = userInfoModel.name;
    cell.detailTextLabel.text = userInfoModel.des;
    cell.textLabel.textColor = self.homeViewModel.textColor;
    cell.detailTextLabel.textColor = self.homeViewModel.detailTextColor;
    return cell;
}

#pragma mark - lazy loading
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
@end
