//
//  GTFYAlertView.h
//  FYRrefresh
//
//  Created by FYWCQ on 16/4/4.
//  Copyright © 2016年 FYWCQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^FYAlertViewCallBackBlock)(NSInteger buttonIndex);


@interface GTFYAlertView : NSObject

@property (nonatomic, copy) FYAlertViewCallBackBlock alertViewCallBackBlock;

+(instancetype)alertWithCallBackBlock:(FYAlertViewCallBackBlock)alertViewCallBackBlock title:(NSString *)title message:(NSString *)message  cancelButtonName:(NSString *)cancelButtonName otherButtonTitles:(NSString *)otherButtonTitles, ...;


@end
