//
//  FYRefreahBaseHFView.m
//  FYRrefresh
//
//  Created by FYWCQ on 16/3/26.
//  Copyright © 2016年 FYWCQ. All rights reserved.
//

#import "FYRefreahBaseHFView.h"

@implementation FYRefreahBaseHFView
{
    BOOL _isAnimating;
    
    CABasicAnimation *_rotationAnimationFY ;
    UIImageView *_animationImageViewFY;
}


- (void)startAnimatingWithImageView:(UIImageView *)imageView
{
    if (_isAnimating )
    {
        return;
    }
    _isAnimating = YES;
    //取消前一次的
//    [self stopAnimatingWithImageView:imageView];
    
    _animationImageViewFY = imageView;
    [_animationImageViewFY setHidden:NO];
    
    _rotationAnimationFY = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    _rotationAnimationFY.toValue = [NSNumber numberWithFloat:(-2 * M_PI)];
    _rotationAnimationFY.duration = 1;
    _rotationAnimationFY.delegate = self;
    _rotationAnimationFY.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self animationLoopingWithImageView:imageView inAnimation:_rotationAnimationFY];
}

- (void)stopAnimatingWithImageView:(UIImageView*)imageView
{
    if (_animationImageViewFY || _rotationAnimationFY) {
        [_animationImageViewFY.layer removeAllAnimations];
    }
    [_animationImageViewFY setHidden:YES];

    _animationImageViewFY = nil;
    _rotationAnimationFY = nil;
    _isAnimating = NO;
}

- (void)animationLoopingWithImageView:(UIImageView *)imageView inAnimation:(CABasicAnimation *)animation {
    [imageView.layer addAnimation:animation forKey:@"rotateAnimation"];
}

#pragma mark NSObject (CAAnimationDelegate)
- (void)animationDidStart:(CAAnimation *)anim {
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (_animationImageViewFY) {
        [self animationLoopingWithImageView:_animationImageViewFY inAnimation:_rotationAnimationFY];
    }
}


@end
