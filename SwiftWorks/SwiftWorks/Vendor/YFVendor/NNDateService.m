//
//  NNDateService.m
//  zhunaV3.0
//
//  Created by zhuna on 14-7-13.
//  Copyright (c) 2014年 zhunaer. All rights reserved.
//

#import "NNDateService.h"
#import "NSDate+Category.h"
#import "OCHeader.h"

@implementation NNDateService


//日期格式
+(NSDateFormatter *)dateformatter{
    
    static NSDateFormatter * dateFormatter;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh"];
        dateFormatter=[[NSDateFormatter alloc] init] ;
        dateFormatter.locale  = locale;
    });
    
    return dateFormatter;
}


+ (NSString *)getTodayDate:(NSString *)formatString
{
    NSDate *curDate = [NSDate date];
    NSDateFormatter *formater = [NNDateService  dateformatter];
    [formater setDateFormat:formatString];
    NSString * curTime = [formater stringFromDate:curDate];
    
    return curTime;
}

+ (NSDate *)getDateFromDateString:(NSString *)DateString formatString:(NSString *)formatString
{
    NSDateFormatter *formater = [NNDateService  dateformatter];
    [formater setDateFormat:formatString];
    return [formater dateFromString:DateString];
}

+ (NSString *)getTomorrowDate:(NSString *)formatString
{
    NSDate *curDate = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] ;
    NSDateComponents *components = [gregorian components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:curDate];
    [components setDay:([components day]+1)];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [NNDateService  dateformatter];
    [dateday setDateFormat:formatString];
    return [dateday stringFromDate:beginningOfWeek];
}
#pragma mark 得到当前日期
+(NSString *)nowDateDay
{
    NSDate *date=[NSDate date];
    
    
    NSDateFormatter *inputFormatter=[[self class]dateformatter];
    
     inputFormatter.dateFormat=@"YYYY-MM-dd";
    
    NSString *dateNow=[inputFormatter stringFromDate:date];
    
    NSLog(@" 当前日期 %@",dateNow);
    
    return dateNow;
    
}

+(NSDate *)timeStringFromStringOrNumber:(NSString *)timestr formatString:(NSString *)formatString
{
    if ([timestr isKindOfClass:[NSString class]]== NO && [timestr isKindOfClass:[NSNumber class]] ==NO)
    {
        return nil;
    }
    
    double timeIntervalcreat;
    
    if ([timestr isKindOfClass:[NSString class]])
    {
        if ([timestr rangeOfString:@" "].location != NSNotFound)
        {
            return  nil;
        }
        else
        {
            // 使用Long iPod 会出问题
            timeIntervalcreat = [timestr doubleValueYF];
        }
    }
    else
    {
        timeIntervalcreat = [timestr doubleValueYF];
    }

    
    timeIntervalcreat = timeIntervalcreat / 1000.0;

    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeIntervalcreat];

    return date;
}


+(NSString *)timeYearMOnthStringFromStringOrNumber:(NSString *)timestr
{
    if ([timestr isKindOfClass:[NSString class]]== NO && [timestr isKindOfClass:[NSNumber class]] ==NO)
    {
        return @"";
    }
    
    double timeIntervalcreat;
    
    if ([timestr isKindOfClass:[NSString class]])
    {
        if ([timestr rangeOfString:@" "].location != NSNotFound)
        {
            return  timestr;
        }
        else
        {
            // 使用Long iPod 会出问题
            timeIntervalcreat = [timestr doubleValueYF];
        }
    }
    else
    {
        timeIntervalcreat = [timestr doubleValueYF];
    }
    timeIntervalcreat = timeIntervalcreat / 1000.0;

    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeIntervalcreat];
    NSDateFormatter *formatter = [NNDateService dateformatter];

    formatter.dateFormat = @"yyyy年MM月dd日 HH:mm";

    NSString *time = [formatter stringFromDate:date];


    return  time;
}
+(NSString *)timeStringFromStringOrNumber:(NSString *)timestr
{
    if ([timestr isKindOfClass:[NSString class]]== NO && [timestr isKindOfClass:[NSNumber class]] ==NO)
    {
        return @"";
    }
    
    double timeIntervalcreat;
    
    if ([timestr isKindOfClass:[NSString class]])
    {
        if ([timestr rangeOfString:@" "].location != NSNotFound)
        {
            return  timestr;
        }
        else
        {
            // 使用Long iPod 会出问题
            timeIntervalcreat = [timestr doubleValueYF];
        }
    }
    else
    {
        timeIntervalcreat = [timestr doubleValueYF];
    }
    timeIntervalcreat = timeIntervalcreat / 1000.0;
    
    //    NSDateFormatter *dateFormatter = [NNDateService dateformatter];
    //    dateFormatter.dateFormat = @"yyyy年M月d日 HH:mm:ss";
    
    // 现在的时间
    NSTimeInterval  currentTime = [[NSDate date] timeIntervalSince1970];
    // 时间 相差
    NSTimeInterval timeInterval = currentTime - timeIntervalcreat;
    
    if (timeInterval < 60) {
        return @"现在";
        //        return @"1分钟内";
    } else if (timeInterval < 3600) {
        return [NSString stringWithFormat:@"%.f分钟前", timeInterval / 60];
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeIntervalcreat];
    
    return [self timeStringFromDaeYF:date];

}

+(NSString *)timeStringFromStringOrNumberKnowledge:(NSString *)timestr
{
    
    if ([timestr isKindOfClass:[NSString class]]== NO && [timestr isKindOfClass:[NSNumber class]] ==NO)
    {
        return @"";
    }
    
    double timeIntervalcreat;
    
    if ([timestr isKindOfClass:[NSString class]])
    {
        if ([timestr rangeOfString:@" "].location != NSNotFound)
        {
             return  timestr;
        }
        else
        {
            // 使用Long iPod 会出问题
            timeIntervalcreat = [timestr doubleValueYF];
        }
    }
    else
    {
         timeIntervalcreat = [timestr doubleValueYF];
    }
    timeIntervalcreat = timeIntervalcreat / 1000.0;
    
    
    NSString *time = [[NSDate dateWithTimeIntervalSince1970:timeIntervalcreat] timeIntervalDescription];
    return time;
    
//    NSDateFormatter *dateFormatter = [NNDateService dateformatter];
//    dateFormatter.dateFormat = @"yyyy年M月d日 HH:mm:ss";
    
//    // 现在的时间
//    NSTimeInterval  currentTime = [[NSDate date] timeIntervalSince1970];
//    // 时间 相差
//    NSTimeInterval timeInterval = currentTime - timeIntervalcreat;
//
//    if (timeInterval < 60) {
//        return @"现在";
////        return @"1分钟内";
//    } else if (timeInterval < 3600) {
//        return [NSString stringWithFormat:@"%.f分钟前", timeInterval / 60];
//    }
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeIntervalcreat];
//    
//    return [self timeStringFromDaeKnowledgeYF:date time:timeInterval];
}


+(NSString *)timeStringFromInterval:(NSTimeInterval)timeInterval
{
    timeInterval = timeInterval;

    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    return [self timeStringFromDae:date];
    
    
    // 1.获得年月日
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit |NSHourCalendarUnit |NSMinuteCalendarUnit;
    NSDateComponents *cmp1 = [calendar components:unitFlags fromDate:date];
    NSDateComponents *cmp2 = [calendar components:unitFlags fromDate:[NSDate date]];
    
    // 2.格式化日期
    NSDateFormatter *formatter = [self dateformatter];
    if ([cmp1 day] == [cmp2 day]) { // 今天
        formatter.dateFormat = @"今天 HH:mm";
    } else if ([cmp1 year] == [cmp2 year]) { // 今年
        formatter.dateFormat = @"MM-dd HH:mm";
    } else {
        formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    }
    NSString *time = [formatter stringFromDate:date];

    return time;
}
+(NSString *)timeStringFromDae:(NSDate *)date
{
    // 1.获得年月日
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit |NSHourCalendarUnit |NSMinuteCalendarUnit;
    NSDateComponents *cmp1 = [calendar components:unitFlags fromDate:date];
    NSDateComponents *cmp2 = [calendar components:unitFlags fromDate:[NSDate date]];
    
//    DebugLog(@"***************KKKKKKKKKK:%ld---%ld",[cmp1 day],[cmp2 day]);
    
    // 2.格式化日期
    NSDateFormatter *formatter = [NNDateService dateformatter];
    if ([cmp1 year] == [cmp2 year] && [cmp1 month] == [cmp2 month] && [cmp1 day] == [cmp2 day]) { // 今天
        formatter.dateFormat = @"今天 HH:mm";
    }else if ([cmp1 year] == [cmp2 year] && [cmp1 month] == [cmp2 month] && [cmp1 day] -  [cmp2 day] == -1) // 昨天
    {
        formatter.dateFormat = @"昨天 HH:mm";
    }
    else if ([cmp1 year] == [cmp2 year]) { // 今年
        formatter.dateFormat = @"MM-dd HH:mm";
    } else {
        formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    }
    NSString *time = [formatter stringFromDate:date];
    
    return time;
}
+(NSString *)timeStringFromDaeKnowledgeYF:(NSDate *)date time:(NSTimeInterval )timeIntervalcreat
{
    // 1.获得年月日
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit |NSHourCalendarUnit |NSMinuteCalendarUnit;
    NSDateComponents *cmp1 = [calendar components:unitFlags fromDate:date];
    NSDateComponents *cmp2 = [calendar components:unitFlags fromDate:[NSDate date]];
    
    //    DebugLog(@"***************KKKKKKKKKK:%ld---%ld",[cmp1 day],[cmp2 day]);
    
    // 2.格式化日期
    NSDateFormatter *formatter = [NNDateService dateformatter];
    if ([cmp1 year] == [cmp2 year] && [cmp1 month] == [cmp2 month] && [cmp1 day] == [cmp2 day]) { // 今天
        formatter.dateFormat = @"今天 HH:mm";
        return [NSString stringWithFormat:@"%ld小时前", ((NSInteger)timeIntervalcreat) / 3600];

    }else if ([cmp1 year] == [cmp2 year] && [cmp1 month] == [cmp2 month] && [cmp2 day] -  [cmp1 day] > 0) // 昨天
    {
        formatter.dateFormat = @"昨天 HH:mm";
        
        return [NSString stringWithFormat:@"%ld天前", [cmp2 day] -  [cmp1 day]];

    }
    else if ([cmp1 year] == [cmp2 year]) { // 今年
        formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    } else {
        formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    }
    NSString *time = [formatter stringFromDate:date];
    
    return time;
}
+(NSString *)timeStringFromDaeYF:(NSDate *)date
{
    // 1.获得年月日
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit |NSHourCalendarUnit |NSMinuteCalendarUnit;
    NSDateComponents *cmp1 = [calendar components:unitFlags fromDate:date];
    NSDateComponents *cmp2 = [calendar components:unitFlags fromDate:[NSDate date]];
    
    //    DebugLog(@"***************KKKKKKKKKK:%ld---%ld",[cmp1 day],[cmp2 day]);
    
    // 2.格式化日期
    NSDateFormatter *formatter = [NNDateService dateformatter];
    if ([cmp1 year] == [cmp2 year] && [cmp1 month] == [cmp2 month] && [cmp1 day] == [cmp2 day]) { // 今天
        formatter.dateFormat = @"今天 HH:mm";
    }else if ([cmp1 year] == [cmp2 year] && [cmp1 month] == [cmp2 month] && [cmp1 day] -  [cmp2 day] == -1) // 昨天
    {
        formatter.dateFormat = @"昨天 HH:mm";
    }
    else if ([cmp1 year] == [cmp2 year]) { // 今年
        formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    } else {
        formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    }
    NSString *time = [formatter stringFromDate:date];
    
    return time;
}

@end
