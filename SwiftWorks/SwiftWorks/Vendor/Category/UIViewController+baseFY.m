
//
//  UIViewController+baseFY.m
//  GTW
//
//  Created by FYWCQ on 16/5/18.
//  Copyright © 2016年 imeng. All rights reserved.
//

#import "UIViewController+baseFY.h"


@implementation UIViewController (baseFY)


-(void)addLeftBackButtonFY
{
    UIBarButtonItem *negativeSpacerL = [[UIBarButtonItem alloc]
                                        initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                        target:nil
                                        action:nil];
    negativeSpacerL.width = -10; //去除空白像素设置
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 30, 21);
    [button addTarget:self action:@selector(leftBarButtonClickFY:) forControlEvents:UIControlEventTouchUpInside];
    
    [button setImage:[UIImage imageNamed:@"bigleftarrow"]
            forState:UIControlStateNormal];
    UIBarButtonItem *backButton =
    [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItems =
    [NSArray arrayWithObjects:negativeSpacerL, backButton, nil];
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
}

-(void)leftBarButtonClickFY:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
