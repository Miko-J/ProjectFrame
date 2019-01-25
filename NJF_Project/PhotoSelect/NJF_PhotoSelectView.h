//
//  NJF_PhotoSelectView.h
//  NJF_Project
//
//  Created by niujf on 2019/1/25.
//  Copyright © 2019年 jinfeng niu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NJF_PhotoSelectView : UIView

@property (nonatomic, strong) UIViewController *VC;
@property (nonatomic, copy) void(^imageArrBlock)(NSArray *_Nullable imageArr);
@property (assign, nonatomic) NSInteger maxCountTF;
- (void)takePhoto;
- (void)pushTZImagePickerController;

@end

NS_ASSUME_NONNULL_END
