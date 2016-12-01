//
//  FYTBBaseDatasource.m
//  FYRrefresh
//
//  Created by FYWCQ on 16/3/24.
//  Copyright © 2016年 FYWCQ. All rights reserved.
//

#import "FYTBBaseDatasource.h"

@implementation FYTBBaseDatasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray().count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  1;
}

#pragma mark - UITableView DataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.dataArray().count > indexPath.row)
    {
        FYBaseCellModel * model = self.dataArray()[indexPath.row];
        
        FYBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:model.cellIdentifier];
        if (cell == nil)
        {
            cell = [self cellFromBaseCellModelFY:model];
        }
        
        [model bindCell:cell indexPath:indexPath];
        model.weakCell.currentVC = self.currentVC;

        model.weakCell = cell;
        return cell;
    }
    
    return [self defaultCell:tableView];
    
}

@end
