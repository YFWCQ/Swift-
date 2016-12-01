//
//  UIViewController+HttpCancelHandleYF.h
//  GTW
//
//  Created by FYWCQ on 16/5/22.
//  Copyright © 2016年 imeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YFHttpService.h"

@interface UIViewController (HttpCancelHandleYF)

-(void)yf_addHttpService:(YFHttpService *)service;
-(void)yf_removeHttpService:(YFHttpService *)service;

@end
