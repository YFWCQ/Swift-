//
//  FYRefreshFootView.m
//  FYRefresh
//
//  Created by Medalands on 15/11/1.
//  Copyright © 2015年 medalands. All rights reserved.
//

#import "FYRefreshFootView.h"

@implementation FYRefreshFootView

//Default is at top
- (id)initWithFrame:(CGRect)frame atTop:(BOOL)top
{
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.backgroundColor = kPRBGColor;
        //                self.backgroundColor = [UIColor redColor];
        _stateLabel = [[UILabel alloc] init ];
        _stateLabel.font = [UIFont boldSystemFontOfSize:13];
        _stateLabel.textColor = kTextColor;
        _stateLabel.textAlignment = NSTextAlignmentCenter;
        _stateLabel.backgroundColor = kPRBGColor;
        _stateLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _stateLabel.text = NSLocalizedString(@"下拉刷新", @"");
        [self addSubview:_stateLabel];
        
        //        _dateLabel = [[UILabel alloc] init ];
        //        _dateLabel.font = ft;
        //        _dateLabel.textColor = kTextColor;
        //        _dateLabel.textAlignment = NSTextAlignmentCenter;
        //        _dateLabel.backgroundColor = kPRBGColor;
        //        _dateLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        //        //        _dateLabel.text = NSLocalizedString(@"最后更新", @"");
        //        [self addSubview:_dateLabel];
        
        UIImage * image =[UIImage imageNamed:@"arrow.png"];
        
        _arrowView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        
        _arrowView.image = image;
        
        [self addSubview:_arrowView];
        
        
        
        
        //        _arrow = [CALayer layer];
        //        _arrow.frame = CGRectMake(0, 0, 20, 20);
        //        _arrow.contentsGravity = kCAGravityResizeAspect;
        //
        //        _arrow.contents = (id)[UIImage imageWithCGImage:[UIImage imageNamed:@"arrow.png"].CGImage scale:1 orientation:UIImageOrientationDown].CGImage;
        //
        //        [self.layer addSublayer:_arrow];
        
        UIImage * imageOfAnimating =[UIImage imageNamed:@"refreshFY.png"];
        
        _activityView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imageOfAnimating.size.width, imageOfAnimating.size.height)];
        _activityView.image = imageOfAnimating;
        [self addSubview:_activityView];
        _activityView.hidden = YES;
        
        [self layouts];
        
        
    }
    return self;
}


- (void)layouts {
    
    CGSize size = self.frame.size;
    CGRect stateFrame,dateFrame,arrowFrame;
    
    float x = 0,y,margin;
    //    x = 0;
    margin = (kPROffsetY - 2*kPRLabelHeight)/2;
    y = margin;
    stateFrame = CGRectMake(0, 22, size.width, kPRLabelHeight );
    
    y = y + kPRLabelHeight;
    dateFrame = CGRectMake(0, y , size.width, kPRLabelHeight);
    
    x = kPRMargin;
    y = margin;
    arrowFrame = CGRectMake(self.frame.size.width * 0.5 - 100, (kPROffsetY - _arrowView.frame.size.height) / 2.0, _arrowView.frame.size.width, _arrowView.frame.size.height);
    
    
    _stateLabel.text = NSLocalizedString(@"上拉加载", @"");
    _stateLabel.frame = stateFrame;
    _dateLabel.frame = dateFrame;
    _arrowView.frame = arrowFrame;
    _activityView.center = _arrowView.center;
    
    
}

- (void)updateRefreshDate :(NSDate *)date{
    
    return;
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
    //    _dateLabel.text = [NSString stringWithFormat:@"%@: %@",
    //                       NSLocalizedString(@"最后更新", @""),
    //                       dateString];
    //    //    [df release];
    
}

- (void)setState:(PRState)state animated:(BOOL)animated{
    float duration = animated ? kPRAnimationDuration : 0.f;
    if (_state != state) {
        _state = state;
        if (_state == kPRStateLoading) {    //Loading
            
            _arrowView.hidden = YES;
            _activityView.hidden = NO;
            [self startAnimatingWithImageView:_activityView];
            _loading = YES;
            _stateLabel.text = NSLocalizedString(@"数据刷新中,请稍等", @"");
        } else if (_state == kPRStatePulling && !_loading) {    //Scrolling
            
            _arrowView.hidden = NO;
            _activityView.hidden = YES;
            [_activityView stopAnimating];
            
            // 执行动画
            [UIView animateWithDuration:duration animations:^{
                _arrowView.transform = CGAffineTransformIdentity;
            }];
            
            
            //            [CATransaction begin];
            //            [CATransaction setAnimationDuration:duration];
            //            _arrow.transform = CATransform3DMakeRotation(M_PI, 0, 0, 1);
            //            [CATransaction commit];
            
            
            _stateLabel.text = NSLocalizedString(@"松开马上加载更多数据了", @"");
            
            
        } else if (_state == kPRStateNormal && !_loading){    //Reset
            
            _arrowView.hidden = NO;
            _activityView.hidden = YES;
            [self stopAnimatingWithImageView:_activityView];
            
            
            // 执行动画
            [UIView animateWithDuration:duration animations:^{
                _arrowView.transform = CGAffineTransformMakeRotation(M_PI);
            }];
            
            
            //            [CATransaction begin];
            //            [CATransaction setAnimationDuration:duration];
            //            _arrow.transform = CATransform3DIdentity;
            //            [CATransaction commit];
    
            _stateLabel.text = NSLocalizedString(@"上拉加载更多数据了", @"");
            
        } else if (_state == kPRStateHitTheEnd) {
            
            _arrowView.hidden = YES;
            _stateLabel.text = NSLocalizedString(@"没有更多信息了", @"");
            
        }else if(_state == kPRStateNetTimeOut){
            
            _arrowView.hidden = YES;
            _stateLabel.text = NSLocalizedString(@"网络连接超时", @"");
            
            
        }else if (_state == kPRStateNetNotConnect){
            _arrowView.hidden = YES;
            _stateLabel.text = NSLocalizedString(@"网络异常，请检查后重试", @"");
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
