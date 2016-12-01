//
//  FYTBSingleSectionDelegate.m
//  FYRrefresh
//
//  Created by FYWCQ on 16/3/24.
//  Copyright © 2016年 FYWCQ. All rights reserved.
//

#import "FYTBSingleSectionDelegate.h"

@implementation FYTBSingleSectionDelegate

#pragma mark UITableViewDataSource Delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        if (self.dataArray().count > indexPath.row)
        {
            FYBaseCellModel * model = self.dataArray()[indexPath.row];
            
            return model.cellHeight;
        }
    return 0.0;
}



@end
