//
//  YFHttpService.h
//  YFMonopolyGo
//
//  Created by FYWCQ on 16/10/11.
//  Copyright © 2016年 YFWCQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFHttpService : NSObject
+(nullable NSString *)errorStringFromError:(nullable NSError *)error;

-(void)yf_cancel;
@end
