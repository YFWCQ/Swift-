//
//  FYTBBaseDelegate.m
//  FYRrefresh
//
//  Created by FYWCQ on 16/3/24.
//  Copyright © 2016年 FYWCQ. All rights reserved.
//

#import "FYTBBaseDelegate.h"
#import "FYRefreshTableView.h"


@implementation FYTBBaseDelegate

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
    if (self.dataArray().count > indexPath.row)
    {
        FYBaseCellModel * model = self.dataArray()[indexPath.row];
        [model tableView:tableView didSelectRowAtIndexPath:indexPath onVC:self.currentVC];
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
