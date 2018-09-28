//
//  NJF_TabBar.m
//  NJF_Project
//
//  Created by jinfeng niu on 2018/9/12.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#import "NJF_TabBar.h"
#import "UIView+NJF_Extension.h"

static const NSInteger ITEMCOUNT = 5;

@interface NJF_TabBar()
@property (nonatomic, strong) UIButton *centerBtn;
@end

@implementation NJF_TabBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.centerBtn];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // self.height * 0.2
    self.centerBtn.center = CGPointMake(self.width * 0.5, self.height * 0.1);
    int index = 0;
    CGFloat wigth = self.width / ITEMCOUNT;
    for (UIView *sub in self.subviews) {
        if ([sub isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            sub.x = index * wigth;
            index++;
            if (index == 2) {
                index++;
            }
        }
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.isHidden == NO) {
        CGPoint newPoint = [self convertPoint:point toView:self.centerBtn];
        if ( [self.centerBtn pointInside:newPoint withEvent:event]) {
            return self.centerBtn;
        }else{
            return [super hitTest:point withEvent:event];
        }
    }
    else {
        return [super hitTest:point withEvent:event];
    }
}

- (UIButton *)centerBtn{
    if (!_centerBtn) {
        _centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_centerBtn setBackgroundImage:[UIImage imageNamed:@"post_normal"] forState:UIControlStateNormal];
        [_centerBtn addTarget:self action:@selector(centerBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        _centerBtn.size = _centerBtn.currentBackgroundImage.size;
    }
    return _centerBtn;
}

- (void)centerBtnClicked{
    NSLog(@"点击了中心的按钮");
}
@end
