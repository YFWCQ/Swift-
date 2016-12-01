//
//  YFHttpService.m
//  YFMonopolyGo
//
//  Created by FYWCQ on 16/10/11.
//  Copyright © 2016年 YFWCQ. All rights reserved.
//

#import "YFHttpService.h"

@implementation YFHttpService

+(NSString *)errorStringFromError:(NSError *)error
{
    if(error.code == -1009)
    {
        // 网络断开链接
        return @"网络断开链接";
    }
    //    kCFURLErrorCannotFindHost
    //        else if (error.code == -1003 || error.code == - 1004)
    //        {
    //            // 服务器异常
    //        }else if (error.code == -1001)
    //        {
    //            // 网络超时
    //        }else if (error.code == 3848)// 这种情况 是在 开发时 用的 上线时 这种情况不用处理 可以归为网络异常 或别的 上线之后 出现情况 找写接口的那口子  让他改
    //        {
    //            // 转换json 格式错误
    //        }else
    //        {
    //            //
    //            NSLog(@" 未处理 %ld error.code",(long)error.code);
    //        }
    return @"网络不给力";
}

-(void)yf_cancel
{
    
}


@end
