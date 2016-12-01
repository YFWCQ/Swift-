//
//  YFAppservice.m
//  YFMonopolyGo
//
//  Created by FYWCQ on 16/10/11.
//  Copyright © 2016年 YFWCQ. All rights reserved.
//

#import "YFAppservice.h"
#import "UIAlertView+FYAdditions.h"
#import "GTFYAlertView.h"
#import "YFHttpService.h"

@implementation YFAppservice


+ (instancetype)sharedInstance {
    static YFAppservice *sharedInstance =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    return sharedInstance;
}

+(void)asypath:(void (^)())action mainAction:(void (^)())mainAction
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 清除缓存
        action();
        //回调 主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            //调用Block
            if (mainAction)
            {
                mainAction();
            }
        });
    });
    
}

+(void)showAlertMessage:(NSString *)message
{
    [GTFYAlertView alertWithCallBackBlock:^(NSInteger buttonIndex) {
        
    } title:@"温馨提示" message:message cancelButtonName:@"确定" otherButtonTitles:nil];
}

+(void)showAlertMessageWithError:(NSError *)error
{
    [self showAlertMessage:[YFHttpService errorStringFromError:error]];
}

+(void)showAlertMessage:(NSString *)message sureBlock:(void(^)())sureBlock
{
    [UIAlertView alertWithCallBackBlock:^(NSInteger buttonIndex) {
        if (buttonIndex == 1)
        {
            if (sureBlock)
            {
                sureBlock();
            }
        }
    } title:@"温馨提示" message:message cancelButtonName:@"取消" otherButtonTitles:@"确定",nil];
    
    //    [GTFYAlertView alertWithCallBackBlock:^(NSInteger buttonIndex) {
    //        DebugLog(@"%ld",buttonIndex);
    //        if (buttonIndex == 1)
    //        {
    //            if (sureBlock)
    //            {
    //                sureBlock();
    //            }
    //        }
    //    } title:@"提示" message:message cancelButtonName:@"取消" otherButtonTitles:@"确定",nil];
}



+(void)dddAlertbackBlock:(FYAlertViewCallBackBlock)alertViewCallBackBlock title:(NSString *)title message:(NSString *)message cancelButtonName:(NSString *)cancelButtonName otherButtonTitles:(NSString *)sureButtonTitle
{
    [UIAlertView alertWithCallBackBlock:alertViewCallBackBlock title:title message:message cancelButtonName:cancelButtonName otherButtonTitles:sureButtonTitle,nil];
}

+(void)dddAlertbackBlock:(FYAlertViewCallBackBlock)alertViewCallBackBlock title:(NSString *)title message:(NSString *)message cancelButtonName:(NSString *)cancelButtonName twoButtonTitles:(NSString *)sureButtonTitle
{
    [UIAlertView alertWithCallBackBlock:alertViewCallBackBlock title:title message:message cancelButtonName:cancelButtonName otherButtonTitles:@"取消",sureButtonTitle,nil];
}

+(void)dddActionSheetbackBlock:(FYAlertViewCallBackBlock)alertViewCallBackBlock title:(NSString *)title message:(NSString *)message cancelButtonName:(NSString *)cancelButtonName otherButtonTitles:(NSString *)sureButtonTitle
{
    [UIActionSheet actionSWithCallBackBlock:alertViewCallBackBlock title:title message:message cancelButtonName:cancelButtonName otherButtonTitles:sureButtonTitle];
}

+(void)dddActionSheetbackBlock:(FYAlertViewCallBackBlock)alertViewCallBackBlock title:(NSString *)title message:(NSString *)message cancelButtonName:(NSString *)cancelButtonName twoButtonTitles:(NSString *)sureButtonTitle
{
    
}

@end
