//
//  NSObject+YFExtension.m
//  GTW
//
//  Created by FYWCQ on 16/8/1.
//  Copyright © 2016年 imeng. All rights reserved.
//

#import "NSObject+YFExtension.h"

@implementation NSObject (YFExtension)

-(double)longLongValueYF
{
    
//    return <#expression#>
    if ([self isKindOfClass:[NSString class]]){
        return ((NSString *)self).longLongValue;
    }
    
    if ([self isKindOfClass:[NSNumber class]]){
        return ((NSNumber *)self).longLongValue;
    }
    return 0;
}

-(BOOL)isStringValueYF
{
    if ([self isKindOfClass:[NSString class]])
    {
        return YES;
    }
    return NO;
}

-(double)doubleValueYF
{
    if ([self isKindOfClass:[NSString class]]){
        return ((NSString *)self).doubleValue;
    }
    
    if ([self isKindOfClass:[NSNumber class]]){
        return ((NSNumber *)self).doubleValue;
    }
    return 0;
}



-(BOOL)isEqualToStringYF:(NSString *)string
{
    if ([self isKindOfClass:[NSString class]])
    {
        return [((NSString *)self) isEqualToString:string];
    }
    return NO;
}

-(NSString *)guardStringYF
{
    if ([self isKindOfClass:[NSString class]])
    {
        return (NSString *)self;
    }
    
    if ([self isKindOfClass:[NSNumber class]])
    {
        return [NSString stringWithFormat:@"%@",(NSNumber *)self];
    }
    
    return @"";
}

@end
