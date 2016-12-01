//
//  NNDateService.h
//  zhunaV3.0
//
//  Created by zhuna on 14-7-13.
//  Copyright (c) 2014年 zhunaer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NNDateService : NSObject


/**
 *单例日期格式
 */
+(NSDateFormatter *)dateformatter;

/**
 *得到当前日期
 */
+ (NSString *)getTodayDate:(NSString *)formatString;

/**
 *得到明天日期
 */
+ (NSString *)getTomorrowDate:(NSString *)formatString;

/**
 * 得到当前日期
 */
+(NSString *)nowDateDay;

/**
 * 根据 字符串 得到 NSDate
 formatString  字符串日期格式
 */
+ (NSDate *)getDateFromDateString:(NSString *)DateString formatString:(NSString *)formatString;

+(NSDate *)timeStringFromStringOrNumber:(NSString *)timestr formatString:(NSString *)formatString;

+(NSString *)timeStringFromStringOrNumberKnowledge:(NSString *)timestr;

+(NSString *)timeStringFromDaeKnowledgeYF:(NSDate *)date time:(NSTimeInterval )timeIntervalcreat;

+(NSString *)timeYearMOnthStringFromStringOrNumber:(NSString *)timestr;

/**
 *timeInterval 秒
 */
+(NSString *)timeStringFromInterval:(NSTimeInterval )timeInterval;

/**
 *  date, 下拉 刷新 用
 */
+(NSString *)timeStringFromDae:(NSDate *)date;

+(NSString *)timeStringFromStringOrNumber:(NSString *)timestr;



@end
