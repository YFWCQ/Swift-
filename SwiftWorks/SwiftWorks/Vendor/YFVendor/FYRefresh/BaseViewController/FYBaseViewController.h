//
//  YFBaseViewController.h
//  FYRrefresh
//
//  Created by FYWCQ on 16/3/23.
//  Copyright © 2016年 FYWCQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FYBaseViewController : UIViewController
//跳转页面
@property(nonatomic,copy)void(^pushVC)(UIViewController*);
/**
 * 加载框
 */
-(void)showLoadingViewWithMessage:(NSString*)message;

-(void)stopLoadingViewWithMessage:(NSString*)message;


-(void)pushViewControllerFY:(UIViewController *)VC;


-(void)addRightutton:(NSString *)title action:(SEL)action;

- (void)showHint:(NSString *)hint;

-(void)emptyDataReminderAction;

- (void)showAlertViewMessageFY:(NSString *)message;

/**
 * 请求失败
 停止刷新动画，失败提示
 */
-(void)failRequest:(NSError *) error;



@end
