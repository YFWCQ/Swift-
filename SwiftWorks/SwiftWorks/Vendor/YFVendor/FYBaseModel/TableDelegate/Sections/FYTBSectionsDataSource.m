//
//  FYTBSectionsDataSource.m
//  FYRrefresh
//
//  Created by FYWCQ on 16/3/24.
//  Copyright © 2016年 FYWCQ. All rights reserved.
//

#import "FYTBSectionsDataSource.h"

#import "FYTBSectionsModel.h"


@implementation FYTBSectionsDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.dataArray().count > section)
    {
        FYTBSectionsModel *sectionModel = self.dataArray()[section];
       
        return sectionModel.sectionCount;
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  self.dataArray().count;
}

#pragma mark - UITableView DataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.dataArray().count > indexPath.section)
    {
        FYTBSectionsModel *sectionModel= self.dataArray()[indexPath.section];
        
        NSArray *array  = sectionModel.dataArray;
        
        if (array.count > indexPath.row)
        {
            FYBaseCellModel * model = array[indexPath.row];
            FYBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:model.cellIdentifier];
            if (cell == nil)
            {
                cell = [self cellFromBaseCellModelFY:model];
            }
            model.weakCell = cell;
            model.weakCell.currentVC = self.currentVC;
            [model bindCell:cell indexPath:indexPath];
            
            return cell;
        }
    }
    
    return [self defaultCell:tableView];
    
}

@end
