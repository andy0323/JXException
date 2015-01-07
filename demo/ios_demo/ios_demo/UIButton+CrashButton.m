//
//  UIButton+CrashButton.m
//  ios_demo
//
//  Created by andy on 1/7/15.
//  Copyright (c) 2015 Andy. All rights reserved.
//

#import "UIButton+CrashButton.h"

@implementation UIButton (CrashButton)
+ (UIButton *)crashButtonWithFrame:(CGRect)frame;
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = frame;
    
    // 背景
    btn.backgroundColor = [UIColor whiteColor];
    
    // 文字
    [btn setTitle:@"点击崩溃" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    
    // 边框
    btn.layer.borderColor = [[UIColor purpleColor] CGColor];
    btn.layer.borderWidth = 1.0f;
    
    // 圆角
    btn.layer.cornerRadius = btn.frame.size.height/2;
    btn.layer.masksToBounds = YES;
    
    // 异常事件
    [btn addTarget:self action:@selector(crash) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}
@end
