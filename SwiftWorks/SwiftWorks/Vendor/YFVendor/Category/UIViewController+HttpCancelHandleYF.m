//
//  UIViewController+HttpCancelHandleYF.m
//  GTW
//
//  Created by FYWCQ on 16/5/22.
//  Copyright © 2016年 imeng. All rights reserved.
//

#import "UIViewController+HttpCancelHandleYF.h"

#import "NSObject+RungtimeFY.h"
#import "Aspects.h"

static const void *kHttpServiceArrayKeyFY = @"kHttpServiceArrayKeyFY";


@interface UIViewController ()
@property(nonatomic,strong)NSMutableArray *httpServiceArrayYF;
@end

@implementation UIViewController (HttpCancelHandleYF)

-(void)yf_addHttpService:(YFHttpService *)service
{
    if (service)
    {
        [self.httpServiceArrayYF addObject:service];
    }
}

-(void)yf_removeHttpService:(YFHttpService *)service
{
    if (service)
    {
        [self.httpServiceArrayYF removeObject:service];
    }
}

-(NSMutableArray *)httpServiceArrayYF
{
    NSMutableArray *array = [self yf_getValueFromObject:self key:&kHttpServiceArrayKeyFY];
    
    if (array == nil)
    {
        array = [[NSMutableArray alloc] init];
        [self yf_setRetainValueToObject:self key:&kHttpServiceArrayKeyFY value:array];
        [self aspect_hookSelector:NSSelectorFromString(@"dealloc") withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> info) {
            NSLog(@"Controller is about to be deallocated: %@", [info instance]);
            [self yf_cancelAllHttpService];
        } error:NULL];
    }
    return array;
}

-(void)yf_cancelAllHttpService
{
    for (YFHttpService *service in self.httpServiceArrayYF)
    {
        // 取消网络请求，会调用 error，记得处理
        [service yf_cancel];
    }
}

@end
