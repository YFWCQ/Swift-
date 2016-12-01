//
//  FYTBSectionsDelegate.m
//  FYRrefresh
//
//  Created by FYWCQ on 16/3/24.
//  Copyright © 2016年 FYWCQ. All rights reserved.
//

#import "FYTBSectionsDelegate.h"

#import "FYRefreshTableView.h"

#import "FYTBSectionsModel.h"

@implementation FYTBSectionsDelegate
#pragma mark UITableViewDataSource Delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.dataArray().count > indexPath.section)
    {
        FYTBSectionsModel *sectionModel = self.dataArray()[indexPath.section];
        if (sectionModel.dataArray.count > indexPath.row)
        {
            FYBaseCellModel * model = sectionModel.dataArray[indexPath.row];
            
            return model.cellHeight;
        }
        
        return 0.0;
    }
    
    return 0.0;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (self.dataArray().count > section)
    {
        FYTBSectionsModel *sectionModel = self.dataArray()[section];
        return sectionModel.footerView;
    }
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.dataArray().count > section)
    {
        FYTBSectionsModel *sectionModel = self.dataArray()[section];
        return sectionModel.headerView;
    }
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.dataArray().count > section)
    {
        FYTBSectionsModel *sectionModel = self.dataArray()[section];
        return sectionModel.headerHeight;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (self.dataArray().count > section)
    {
        FYTBSectionsModel *sectionModel = self.dataArray()[section];
        return sectionModel.footerHeight;
    }
    return 0.0;

}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.dataArray().count > indexPath.section)
    {
        FYTBSectionsModel *sectionModel = self.dataArray()[indexPath.section];

        NSArray *array = sectionModel.dataArray;
        if (array.count > indexPath.row)
        {
            FYBaseCellModel * model = array[indexPath.row];
            [model tableView:tableView didSelectRowAtIndexPath:indexPath onVC:self.currentVC];
        }
    }
}

#pragma mark 刷新 加载 代理方法
// 停止拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    if ([scrollView isKindOfClass:[FYRefreshTableView class]]) {
        FYRefreshTableView *tableView = (FYRefreshTableView *)scrollView;
        [tableView tableViewDidEndDragging:tableView];
    }
}

@end
