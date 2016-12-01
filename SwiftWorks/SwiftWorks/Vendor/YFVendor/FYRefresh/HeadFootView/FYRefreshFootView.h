//
//  FYRefreshFootView.h
//  FYRefresh
//
//  Created by Medalands on 15/11/1.
//  Copyright © 2015年 medalands. All rights reserved.
//

#import "FYRefreahBaseHFView.h"

#import "FYRefreshHeader.h"

@interface FYRefreshFootView : FYRefreahBaseHFView

@property (nonatomic,getter = isLoading) BOOL loading;
@property (nonatomic) PRState state;
@property(nonatomic,retain)UILabel *stateLabel;
@property(nonatomic,retain)UILabel *dateLabel;
@property(nonatomic,retain)UIImageView *arrowView;
@property(nonatomic,retain)UIImageView *activityView;

@property(nonatomic,copy)NSString * emptyDataText;

- (id)initWithFrame:(CGRect)frame atTop:(BOOL)top;

- (void)updateRefreshDate:(NSDate *)date;

- (void)setState:(PRState)state animated:(BOOL)animated;

@end
