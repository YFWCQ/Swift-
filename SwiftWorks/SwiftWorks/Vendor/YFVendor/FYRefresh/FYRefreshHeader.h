//
//  FYRefreshHeader.h
//  FYRefresh
//
//  Created by Medalands on 15/11/1.
//  Copyright © 2015年 medalands. All rights reserved.
//
#import <UIKit/UIKit.h>



#define kPROffsetY 64.f

#define kPRArrowWidth 23.f
#define kPRBGColor [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1.0]
#define kTextColor [UIColor colorWithRed:150.0/255.0 green:150.0/255.0 blue:150.0/255.0 alpha:1.0]

#define kPRLabelHeight 20.f
#define kPRMargin 5.f
#define kPRArrowHeight 23.f

#define kPRAnimationDuration .18f



typedef enum {
    kPRStateNormal = 0,
    kPRStatePulling = 1,
    kPRStateLoading = 2,
    kPRStateHitTheEnd = 3,
    kPRStateNetTimeOut=4,
    kPRStateNetNotConnect=5
} PRState;


@protocol FYRefreshViewDelegate <NSObject>

@required
- (void)FYRefreshViewDidStartRefreshing:(UIScrollView *)tableView;

@optional
//Implement this method if headerOnly is false
- (void)FYRefreshViewDidStartLoading:(UIScrollView *)tableView;
//Implement the follows to set date you want,Or Ignore them to use current date
- (NSDate *)FYRefreshViewRefreshingFinishedDate;
- (NSDate *)FYRefreshViewLoadingFinishedDate;

@end

