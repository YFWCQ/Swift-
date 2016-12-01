//
//  UIView+FYLoadingView.m
//  FYRrefresh
//
//  Created by FYWCQ on 16/3/23.
//  Copyright © 2016年 FYWCQ. All rights reserved.
//

#import "UIView+FYLoadingView.h"
#import "MBProgressHUD.h"
#import <objc/runtime.h>
static const void *kHttpRequestHUDKeyFY = @"kHttpRequestHUDKeyFY";
static const void *kHttpHintHUDKeyFY = @"kHttpHintHUDKeyFY";


@interface UIView ()
@property(nonatomic,strong)MBProgressHUD *progressHUDFY;
@property(nonatomic,strong)MBProgressHUD *hintHUDFY;

@end

@implementation UIView (FYLoadingView)

-(MBProgressHUD *)progressHUDFY
{
    MBProgressHUD *HUD = objc_getAssociatedObject(self, &kHttpRequestHUDKeyFY);
    if (HUD == nil)
    {
         HUD = [[MBProgressHUD alloc] initWithView:self];
        objc_setAssociatedObject(self, &kHttpRequestHUDKeyFY, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self addSubview:HUD];
    [self bringSubviewToFront:HUD];
    return HUD;
}

-(MBProgressHUD *)hintHUDFY
{
    MBProgressHUD *HUD = objc_getAssociatedObject(self, &kHttpHintHUDKeyFY);
    if (HUD == nil)
    {
        HUD = [MBProgressHUD showHUDAddedTo:self animated:YES];
        objc_setAssociatedObject(self, &kHttpRequestHUDKeyFY, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        HUD.userInteractionEnabled = NO;
        // Configure for text only and offset down
        HUD.mode = MBProgressHUDModeText;
        HUD.margin = 10.f;
        HUD.yOffset =-45.0;
    }
    [self addSubview:HUD];
    [self bringSubviewToFront:HUD];
    return HUD;
}

-(void)showLoadingViewWithMessage:(NSString*)message
{
    if (message) {
        self.progressHUDFY.labelText = message;
    }else
    {
        self.progressHUDFY.labelText = @"";
    }
    
    [self.progressHUDFY show:YES];
}

-(void)stopLoadingViewWithMessage:(NSString*)message
{
    
    if (message.length)
    {
        self.progressHUDFY.labelText = message;
        [self.progressHUDFY hide:YES afterDelay:.5];
    }
    else
    {
        [self.progressHUDFY hide:YES];
    }
}

- (void)showHint:(NSString *)hint
{
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = hint;
    [hud hide:YES afterDelay:1];
}

@end
