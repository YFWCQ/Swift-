//
//  OCHeader.h
//  SwiftWorks
//
//  Created by FYWCQ on 16/11/7.
//  Copyright © 2016年 Medalands. All rights reserved.
//

#ifndef OCHeader_h
#define OCHeader_h


#endif /* OCHeader_h */

// 上拉 下拉 延迟调用设置，有延迟 是为了 在网络快，和测试时 看 下拉的刷新动画测试用的
#if DEBUG
#define  kFYRefreshDelaySecondsssss  0.0
#else
#define kFYRefreshDelaySecondsssss  0.0
#endif

#import "NSString+colorWithHexString.h"
#import "YFAppservice.h"
#import "NSObject+YFExtension.h"
#import "UIAlertView+FYAdditions.h"

#define weakTypesFY  __weak typeof(self)weakS = self;



//-- MD_MULTILINE_TEXTSIZE  字体内容多少判断label的size
#define FY_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) \
attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero;

#define XFrom6FY(x) ([[UIScreen mainScreen] bounds].size.width / 375.0 * x)

#define YFrom6FY(y) ([[UIScreen mainScreen] bounds].size.height / 667.0 * y)


#define RGB_FY(r,g,b) [UIColor colorWithRed:(r)/255. green:(g)/255. blue:(b)/255. alpha:1.0]

#define RGBA_FY(r,g,b,a) [UIColor colorWithRed:(r)/255. green:(g)/255. blue:(b)/255. alpha:a]

#define IPhone4_5_6_6P(a,b,c,d) (CGSizeEqualToSize(CGSizeMake(320, 480), [[UIScreen mainScreen] bounds].size) ?(a) :(CGSizeEqualToSize(CGSizeMake(320, 568), [[UIScreen mainScreen] bounds].size) ? (b) : (CGSizeEqualToSize(CGSizeMake(375, 667), [[UIScreen mainScreen] bounds].size) ?(c) : (CGSizeEqualToSize(CGSizeMake(414, 736), [[UIScreen mainScreen] bounds].size) ?(d) : (a)))))

#define TitleColorFY   [NSString colorWithHexString:@"#666666"]

#define CellTitleColorFY   [NSString colorWithHexString:@"#5e6f74"]
#define CellSubTitleColorFY   [NSString colorWithHexString:@"#b6b6b6"]
#define CellDesTitleColorFY   [NSString colorWithHexString:@"#b6c4c8"]
#define CellCurrencyColorFY   [NSString colorWithHexString:@"#579ee2"]



#define PinkColorFY RGB_FY(240, 119, 67)

#define FontSizeFY(b) [UIFont systemFontOfSize:(b)]

#define BoldFontSizeFY(b) [UIFont boldSystemFontOfSize:(b)]



#define FontBigTitleFY [UIFont systemFontOfSize:18.]

#define FontCellTitleFY [UIFont systemFontOfSize:16.]

#define FontCellSubTitleFY [UIFont systemFontOfSize:11.]

#define FontCellTitleValueFY [UIFont systemFontOfSize:13.]

#define FontCurrencyTitleFY [UIFont systemFontOfSize:14.]



#define ColorLineFY RGB_FY(210, 210, 214)
#define ColorOfGrayCellFY RGB_FY(246, 246, 246)
#define ColorRightNaviButtonFY RGB_FY(139, 139, 139)

#if DEBUG
#define SDK_DEBUG_MODE  (1)
#define DebugLog( s, ... ) \
fprintf(stderr, "%s\n", [[NSString stringWithFormat:@"<%@%@:(%d)> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], \
[NSString stringWithUTF8String:__PRETTY_FUNCTION__], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__]] UTF8String]);

#else //DEBUG
#define DebugLog( s, ... )
#endif //DEBUG
