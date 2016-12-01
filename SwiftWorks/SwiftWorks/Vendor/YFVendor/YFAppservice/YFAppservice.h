//
//  YFAppservice.h
//  YFMonopolyGo
//
//  Created by FYWCQ on 16/10/11.
//  Copyright © 2016年 YFWCQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIAlertView+FYAdditions.h"
#import "UIActionSheet+FYAdditions.h"

@interface YFAppservice : NSObject

+ (instancetype)sharedInstance;
/**
 * action 异步
 mainAction 回调主线程
 */
+(void)asypath:(void (^)())action mainAction:(void (^)())mainAction;

+(void)showAlertMessage:(NSString *)message;

+(void)showAlertMessage:(NSString *)message sureBlock:(void(^)())sureBlock;

+(void)showAlertMessageWithError:(NSError *)error;


+(void)dddAlertbackBlock:(FYAlertViewCallBackBlock)alertViewCallBackBlock title:(NSString *)title message:(NSString *)message cancelButtonName:(NSString *)cancelButtonName otherButtonTitles:(NSString *)sureButtonTitle;

+(void)dddAlertbackBlock:(FYAlertViewCallBackBlock)alertViewCallBackBlock title:(NSString *)title message:(NSString *)message cancelButtonName:(NSString *)cancelButtonName twoButtonTitles:(NSString *)sureButtonTitle;

+(void)dddActionSheetbackBlock:(FYAlertViewCallBackBlock)alertViewCallBackBlock title:(NSString *)title message:(NSString *)message cancelButtonName:(NSString *)cancelButtonName otherButtonTitles:(NSString *)sureButtonTitle;


@end
