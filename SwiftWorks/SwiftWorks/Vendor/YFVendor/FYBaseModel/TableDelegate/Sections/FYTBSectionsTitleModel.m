//
//  FYTBSectionsTitleModel.m
//  GTW
//
//  Created by FYWCQ on 16/5/8.
//  Copyright © 2016年 imeng. All rights reserved.
//

#import "FYTBSectionsTitleModel.h"
#import "OCHeader.h"

@implementation FYTBSectionsTitleModel
{
    UIView *_subHeadView;
}

-(UIView *)headerView
{
    if (_subHeadView == nil && self.sectionTitle.length)
    {
        UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 30)];
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 30)];
        title.font = [UIFont systemFontOfSize:14];
        title.textAlignment = NSTextAlignmentLeft;
        title.text = self.sectionTitle;
        title.textColor = CellTitleColorFY;
        [headerView addSubview:title];
        headerView.backgroundColor = RGB_FY(239, 239, 244);
        title.backgroundColor = RGB_FY(239, 239, 244);
        _subHeadView = headerView;
    }
    return _subHeadView;
}

@end
