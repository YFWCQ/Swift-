//
//  GTFYAlertView.m
//  FYRrefresh
//
//  Created by FYWCQ on 16/4/4.
//  Copyright © 2016年 FYWCQ. All rights reserved.
//

#import "GTFYAlertView.h"
#import <objc/runtime.h>

static void* FYAlertViewKey = @"FYAlertViewKey_FY";



@implementation GTFYAlertView



+(instancetype)alertWithCallBackBlock:(FYAlertViewCallBackBlock)alertViewCallBackBlock title:(NSString *)title message:(NSString *)message  cancelButtonName:(NSString *)cancelButtonName otherButtonTitles:(NSString *)otherButtonTitles, ... {
    
    GTFYAlertView *alertObject = [[GTFYAlertView alloc] init];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:alertObject cancelButtonTitle:cancelButtonName otherButtonTitles: otherButtonTitles, nil];
    NSString *other = nil;
    va_list args;
    if (otherButtonTitles) {
        va_start(args, otherButtonTitles);
        while ((other = va_arg(args, NSString*))) {
            [alert addButtonWithTitle:other];
        }
        va_end(args);
    }
    alertObject.alertViewCallBackBlock = alertViewCallBackBlock;

    [alert show];
    return alertObject;
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (self.alertViewCallBackBlock) {
        self.alertViewCallBackBlock(buttonIndex);
    }
}

@end
