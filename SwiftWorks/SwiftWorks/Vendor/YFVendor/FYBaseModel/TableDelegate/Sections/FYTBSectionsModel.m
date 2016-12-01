//
//  FYTBSectionsModel.m
//  GTW
//
//  Created by FYWCQ on 16/4/12.
//  Copyright © 2016年 imeng. All rights reserved.
//

#import "FYTBSectionsModel.h"

@implementation FYTBSectionsModel



-(NSUInteger)sectionCount
{
   return  self.dataArray.count;
}

-(UIView *)headerView
{
    return _headerView;
}

-(UIView *)footerView
{
    if ([self sectionCount] == 0)
    {
        return nil;
    }
    return _footerView;
}


-(CGFloat)footerHeight
{
    if (self.sectionCount == 0)
    {
        return 0;
    }
    return _footerHeight;
}




-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

@end
