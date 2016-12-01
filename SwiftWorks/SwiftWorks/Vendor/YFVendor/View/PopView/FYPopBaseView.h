//
//  FYPopBaseView.h
//  
//
//  Created by FYWCQ on 15/11/6.
//
//

#import <UIKit/UIKit.h>

@interface FYPopBaseView : UIControl


@property(nonatomic,strong)UIView * childredView;

-(void)show;

-(void)hide;
/**
 * 背景
 */
-(void)initChildrenViewWithFrame:(CGRect)frame;

/**
 * 显示加载框
 */
-(void)showLoadingViewWithMessage:(NSString*)message;

/**
 * 加载完毕
 */
-(void)stopLoadingViewWithMessage:(NSString*)message;
/**
 * 各种错误信息提示
 */
-(void)showErrorInfo:(NSError *)error;
/**
 * 弹出框
 */
- (void)showAlertViewWithMessage:(NSString *)message;


@property(nonatomic,assign)CGRect hiddenFrame;

@property(nonatomic,assign)CGRect originFrame;

@end
