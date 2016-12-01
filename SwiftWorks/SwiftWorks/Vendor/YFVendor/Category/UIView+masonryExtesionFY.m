//
//  UIView+masonryExtesionFY.m
//  FYRrefresh
//
//  Created by FYWCQ on 16/4/2.
//  Copyright © 2016年 FYWCQ. All rights reserved.
//

#import "UIView+masonryExtesionFY.h"
#import "Masonry.h"
@implementation UIView (masonryExtesionFY)

-(void)setxFY:(CGFloat)xx
{
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.superview.mas_left).offset(xx);

    }];
}

-(void)setyFY:(CGFloat)yy
{
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.superview.mas_top).offset(yy);
    }];
}


-(void)setEqualCenterXOffset:(CGFloat)offset
{
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.superview.mas_centerX).offset(offset);
    }];
}

-(void)setEqualCenterYOffset:(CGFloat)offset
{
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.superview.mas_centerY).offset(offset);
    }];
}


-(void)setLeadingFY:(CGFloat)leading
{
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.superview.mas_left).offset(leading);
    }];
}

-(void)setTrailingFY:(CGFloat)trailing
{
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.superview.mas_right).offset(trailing);
    }];
}



-(void)setBottomFY:(CGFloat)bottom
{
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(bottom));
    }];
}

-(void)setTopFY:(CGFloat)top
{
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.superview.mas_top).offset(top);
    }];
}



-(void)setBottomLine
{
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.superview.mas_left);
        make.right.equalTo(self.superview.mas_right);
        make.height.equalTo(@(0.5));
        make.bottom.equalTo(self.superview.mas_bottom).offset(-0.5);
    }];
}


-(void)setWidthFY:(CGFloat)width
{
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width));
    }];

}

-(void)setHeightFY:(CGFloat)height
{
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(height));
    }];
}


@end
