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
@property (nonatomic, assign) NSInteger selectedIndex;
@end

@implementation NJF_TabBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"post_normal"] forState:UIControlStateNormal];
        button.size = button.currentBackgroundImage.size;
        self.centerBtn = button;
        [self addSubview:button];
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

@end
