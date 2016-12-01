//
//  FYBaseViewController.m
//  FYRrefresh
//
//  Created by FYWCQ on 16/3/23.
//  Copyright © 2016年 FYWCQ. All rights reserved.
//

#import "FYBaseViewController.h"
#import "UIView+FYLoadingView.h"


#import "MBProgressHUD.h"

#import "YFAppservice.h"

#import "YFHttpService.h"
#import "OCHeader.h"

@interface FYBaseViewController ()

@property(nonatomic,assign)CGFloat naviOffsetYY;


@end

@implementation FYBaseViewController
{
    UIBarButtonItem *_leftBackSpacerL;
}
-(void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    __weak typeof(self)weakS = self;

    [self setPushVC:^(UIViewController *VC) {
        [weakS pushViewControllerFY:VC];
    }];
    
  
}


-(void)addLeftBackButton
{
    if (!_leftBackSpacerL)
    {
        UIBarButtonItem *negativeSpacerL = [[UIBarButtonItem alloc]
                                            initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                            target:nil
                                            action:nil];
        negativeSpacerL.width = -10; //去除空白像素设置
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 30, 21);
        [button addTarget:self action:@selector(leftBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [button setImage:[UIImage imageNamed:@"bigleftarrow"]
                forState:UIControlStateNormal];
        UIBarButtonItem *backButton =
        [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.leftBarButtonItems =
        [NSArray arrayWithObjects:negativeSpacerL, backButton, nil];
        self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.navigationController.viewControllers.count > 0)
    {
        [self addLeftBackButton];
    }
}

-(void)showLoadingViewWithMessage:(NSString *)message
{
    [self.view showLoadingViewWithMessage:message];
}
-(void)stopLoadingViewWithMessage:(NSString *)message
{
    [self.view stopLoadingViewWithMessage:message];
}

-(void)pushViewControllerFY:(UIViewController *)VC
{
    [self.navigationController pushViewController:VC animated:YES];
}


-(void)addRightutton:(NSString *)title action:(SEL)action
{
    UIFont *font = [UIFont systemFontOfSize:14.0];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    //    button.frame = CGRectMake(0, 20, 44, 44);
    CGFloat width = [self viewWidthFromStr:title font:font];
    
    button.frame = CGRectMake(self.view.frame.size.width - width - 20, 20 + _naviOffsetYY, width, 44);
    [button.titleLabel setFont:font];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:ColorRightNaviButtonFY forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self setRightNaviButton:button];
}

-(CGFloat)viewWidthFromStr:(NSString *)str font:(UIFont *)font
{
    CGSize size = FY_MULTILINE_TEXTSIZE(str, font, CGSizeMake(1000, 40), 0) ;
    
    
    return size.width + 5.0;
}
#pragma mark 设置导航栏 button
-(void)setLeftNaviButton:(UIButton *)button
{
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}
-(void)setRightNaviButton:(UIButton *)button
{
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

-(void)leftBarButtonClick:(UIButton *)btn
{
    if (self.navigationController.viewControllers.count == 1)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else
    {
    [self.navigationController popViewControllerAnimated:YES];
    }
}


- (void)showHint:(NSString *)hint
{
    [self.view showHint:hint];
}
- (void)showAlertViewMessageFY:(NSString *)message
{
    [YFAppservice showAlertMessage:message];
}

-(void)emptyDataReminderAction
{
    [YFAppservice showAlertMessage:@"未查询到数据"];
}


//   ing 失败掉的 方法
-(void)failRequest:(NSError *)error
{
    [YFAppservice showAlertMessage:[YFHttpService errorStringFromError:error]];
    
    //    kCFURLErrorCannotFindHost = -1003, // 找不到服务器
    //    kCFURLErrorCannotConnectToHost = -1004, // 链接不上服务器
    //   kCFURLErrorNotConnectedToInternet = -1009 // 网络断开
    //kCFURLErrorCancelled = -999 取消下载  （operation cancel）
    
    //    if(error.code == -1009)
    //    {
    //        // 网络断开链接
    //    }else if (error.code == -1003 || error.code == - 1004)
    //    {
    //        // 服务器异常
    //    }else if (error.code == -1001)
    //    {
    //        // 网络超时
    //    }else if (error.code == 3848)// 这种情况 是在 开发时 用的 上线时 这种情况不用处理 可以归为网络异常 或别的 上线之后 出现情况 找写接口的那口子  让他改
    //    {
    //        // 转换json 格式错误
    //    }else
    //    {
    //        //
    //        NSLog(@" 未处理 %ld error.code",(long)error.code);
    //    }
    //
    //    // 实际开发 时可能处理的情况 都是几种合在一起的 比如网易新闻  请求失败 都是 网络不给力 一种处理方式
    
}



@end
