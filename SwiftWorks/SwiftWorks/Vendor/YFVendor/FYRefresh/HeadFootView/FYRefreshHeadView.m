//
//  FYRefreshHeadView.m
//  FYRefresh
//
//  Created by Medalands on 15/11/1.
//  Copyright © 2015年 medalands. All rights reserved.
//

#import "FYRefreshHeadView.h"
#import "NNDateService.h"

NSString *const MDRefreshHeadTimeKey = @"MDRefreshHeadTimeKey";


@implementation FYRefreshHeadView

- (id)initWithFrame:(CGRect)frame atTop:(BOOL)top
{
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.backgroundColor = kPRBGColor;
        //                self.backgroundColor = [UIColor redColor];
        
        _dateStoreKey = MDRefreshHeadTimeKey;
        
        _stateLabel = [[UILabel alloc] init ];
        _stateLabel.font = [UIFont boldSystemFontOfSize:13];
        _stateLabel.textColor = kTextColor;
        _stateLabel.textAlignment = NSTextAlignmentCenter;
        _stateLabel.backgroundColor = kPRBGColor;
        _stateLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _stateLabel.text = NSLocalizedString(@"下拉刷新", @"");
        [self addSubview:_stateLabel];
        
        _dateLabel = [[UILabel alloc] init ];
        _dateLabel.font = [UIFont boldSystemFontOfSize:12];
        _dateLabel.textColor = kTextColor;
        _dateLabel.textAlignment = NSTextAlignmentCenter;
        _dateLabel.backgroundColor = kPRBGColor;
        _dateLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        //        _dateLabel.text = NSLocalizedString(@"最后更新", @"");
        [self addSubview:_dateLabel];
        
        UIImage * image =[UIImage imageNamed:@"arrow.png"];
        _arrowView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        _arrowView.image =image;
        [self addSubview:_arrowView];

        UIImage * imageOfAnimating =[UIImage imageNamed:@"refreshFY.png"];

        _activityView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imageOfAnimating.size.width, imageOfAnimating.size.height)];
        _activityView.image = imageOfAnimating;
        [self addSubview:_activityView];
        _activityView.hidden = YES;
        [self layouts];
        
    }
    return self;
}

-(void)setDateStoreKey:(NSString *)dateStoreKey
{
    
    _dateStoreKey = dateStoreKey;
    
    NSDate * lastUpdateTime   = [[NSUserDefaults standardUserDefaults] objectForKey:_dateStoreKey];
    
    if (lastUpdateTime)
    {
        [self updateRefreshDate:lastUpdateTime];
    }else
    {
        _dateLabel.text = [NSString stringWithFormat:@"%@:  %@",
                           NSLocalizedString(@"最后更新", @""),
                           @"从未"];
    }
}

- (void)layouts {
    
    CGSize size = self.frame.size;
    CGRect stateFrame,dateFrame,arrowFrame;
    
    float x = 0,y,margin;
    //    x = 0;
    margin = (kPROffsetY - 2*kPRLabelHeight)/2;
    y = size.height - margin - kPRLabelHeight;
    dateFrame = CGRectMake(0,self.frame.size.height - 32,size.width,32);
    
    y = y - kPRLabelHeight;
    stateFrame = CGRectMake(0, self.frame.size.height - 64, size.width, 32);
    
    
    x = kPRMargin;
    y = size.height - _arrowView.frame.size.height - 20;
    arrowFrame = CGRectMake(self.frame.size.width * 0.5 - 100, y, _arrowView.frame.size.width, _arrowView.frame.size.height);
    
    
    
    
    _stateLabel.frame = stateFrame;
    _dateLabel.frame = dateFrame;
    _arrowView.frame = arrowFrame;
    _activityView.center = _arrowView.center;
    
    NSDate * lastUpdateTime   = [[NSUserDefaults standardUserDefaults] objectForKey:_dateStoreKey];
    
    if (lastUpdateTime)
    {
        [self updateRefreshDate:lastUpdateTime];
    }else
    {
        _dateLabel.text = [NSString stringWithFormat:@"%@:  %@",
                           NSLocalizedString(@"最后更新", @""),
                           @"从未"];
    }
    
    
}

- (void)updateRefreshDate :(NSDate *)date{
    
    // 1. 存储 刷新时间
    [[NSUserDefaults standardUserDefaults] setObject:date forKey:_dateStoreKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    
//    // 1.获得年月日
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSUInteger unitFlags = NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit |NSHourCalendarUnit |NSMinuteCalendarUnit;
//    NSDateComponents *cmp1 = [calendar components:unitFlags fromDate:date];
//    NSDateComponents *cmp2 = [calendar components:unitFlags fromDate:[NSDate date]];
//    
//    // 2.格式化日期
//    NSDateFormatter *formatter = [NNDateService dateformatter];
//    if ([cmp1 day] == [cmp2 day]) { // 今天
//        formatter.dateFormat = @"今天 HH:mm";
//    } else if ([cmp1 year] == [cmp2 year]) { // 今年
//        formatter.dateFormat = @"MM-dd HH:mm";
//    } else {
//        formatter.dateFormat = @"yyyy-MM-dd HH:mm";
//    }
    NSString *time = [NNDateService timeStringFromDae:date];

    
    
//    NSDateFormatter *df = [[NSDateFormatter alloc] init];
//    df.dateFormat = @"yyyy-MM-dd HH:mm";
//    NSString *dateString = [df stringFromDate:date];
//    NSString *title = NSLocalizedString(@"今天", nil);
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay
//                                               fromDate:date toDate:[NSDate date] options:0];
//    NSInteger year = [components year];
//    NSInteger month = [components month];
//    NSInteger day = [components day];
//    if (year == 0 && month == 0 && day < 3) {
//        if (day == 0) {
//            title = NSLocalizedString(@"今天",nil);
//        } else if (day == 1) {
//            title = NSLocalizedString(@"昨天",nil);
//        } else if (day == 2) {
//            title = NSLocalizedString(@"前天",nil);
//        }
//        df.dateFormat = [NSString stringWithFormat:@"%@ HH:mm",title];
//        dateString = [df stringFromDate:date];
//        
//    }
    _dateLabel.text = [NSString stringWithFormat:@"%@: %@",
                       NSLocalizedString(@"最后更新", @""),
                       time];
    //    [df release];
    
}

- (void)setState:(PRState)state animated:(BOOL)animated{
    float duration = animated ? kPRAnimationDuration : 0.f;
    if (_state != state) {
        _state = state;
        if (_state == kPRStateLoading) {    //Loading
            
            _arrowView.hidden = YES;
            _activityView.hidden = NO;
            [self startAnimatingWithImageView:_activityView];
//            [_activityView startAnimating];
            
            _loading = YES;
            _stateLabel.text = NSLocalizedString(@"数据加载中,请稍等", @"");
            
            
        } else if (_state == kPRStatePulling && !_loading) {    //Scrolling
            
            _arrowView.hidden = NO;
            _activityView.hidden = YES;
//            [_activityView stopAnimating];
            [self stopAnimatingWithImageView:_activityView];
            // 执行动画
            [UIView animateWithDuration:duration animations:^{
                _arrowView.transform = CGAffineTransformMakeRotation(M_PI);
            }];
            
            
            
            _stateLabel.text = NSLocalizedString(@"松开马上刷新了", @"");
            
            
        } else if (_state == kPRStateNormal && !_loading){    //Reset
            
            _arrowView.hidden = NO;
            _activityView.hidden = YES;
//            [_activityView stopAnimating];
            [self stopAnimatingWithImageView:_activityView];

            // 执行动画
            [UIView animateWithDuration:duration animations:^{
                _arrowView.transform = CGAffineTransformIdentity;
            }];
            
            //            [CATransaction begin];
            //            [CATransaction setAnimationDuration:duration];
            //            _arrow.transform = CATransform3DIdentity;
            //
            //            [CATransaction commit];
            
            _stateLabel.text = NSLocalizedString(@"下拉可以刷新", @"");
            
        }
    }
}


- (void)setState:(PRState)state {
    [self setState:state animated:YES];
}

- (void)setLoading:(BOOL)loading {
    //    if (_loading == YES && loading == NO) {
    //        [self updateRefreshDate:[NSDate date]];
    //    }
    _loading = loading;
}


@end
