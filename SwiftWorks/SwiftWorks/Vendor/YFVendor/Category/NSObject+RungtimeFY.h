//
//  NSObject+RungtimeFY.h
//  GTW
//
//  Created by FYWCQ on 16/5/14.
//  Copyright © 2016年 imeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RungtimeFY)

-(id)yf_getValueFromObject:(NSObject *)object key:(const void *)key;

-(void)yf_setRetainValueToObject:(NSObject *)object key:(const void *)key value:(id)value;

-(void)yf_setCopyValueToObject:(NSObject *)object key:(const void *)key value:(id)value;

@end
