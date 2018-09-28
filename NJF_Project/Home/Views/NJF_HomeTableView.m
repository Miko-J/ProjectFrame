//
//  NJF_HomeTableView.m
//  NJF_Project
//
//  Created by niujf on 2018/9/28.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import "NJF_HomeTableView.h"

@interface NJF_HomeTableView()<UITableViewDelegate>
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
#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    static NSString *identifier = @"cell";
    cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }
    cell.textLabel.text = @"hahahh";
    cell.textLabel.textColor = [UIColor grayColor];
    return cell;
}

#pragma mark - lazy loading
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
    }
    return _tableView;
}
@end
