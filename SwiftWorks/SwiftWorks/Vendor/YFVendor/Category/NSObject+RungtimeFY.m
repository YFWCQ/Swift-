//
//  NSObject+RungtimeFY.m
//  GTW
//
//  Created by FYWCQ on 16/5/14.
//  Copyright © 2016年 imeng. All rights reserved.
//

#import "NSObject+RungtimeFY.h"
#import <objc/runtime.h>


@implementation NSObject (RungtimeFY)

-(id)yf_getValueFromObject:(NSObject *)object key:(const void *)key
{
  return  objc_getAssociatedObject(object, key);
}

-(void)yf_setRetainValueToObject:(NSObject *)object key:(const void *)key value:(id)value
{
    objc_setAssociatedObject(object, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)yf_setCopyValueToObject:(NSObject *)object key:(const void *)key value:(id)value
{
    objc_setAssociatedObject(object, key, value, OBJC_ASSOCIATION_COPY);
}

@end
