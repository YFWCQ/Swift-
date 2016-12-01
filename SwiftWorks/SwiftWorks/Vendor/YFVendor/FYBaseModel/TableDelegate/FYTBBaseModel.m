//
//  FYTBBaseModel.m
//  FYRrefresh
//
//  Created by FYWCQ on 16/3/24.
//  Copyright © 2016年 FYWCQ. All rights reserved.
//

#import "FYTBBaseModel.h"
#import "OCHeader.h"

@implementation FYTBBaseModel

+(instancetype)tableDelegeteWithArray:(DataArrayBLock)array currentVC:(FYBaseViewController *)currentVC
{
    
    if (array)
    {
        NSLog(@"fafafasasdf");
    }else
    {
        NSLog(@"12312312313123");
    }
    
    FYTBBaseModel *tableDelegate = [[[self class] alloc] init];
    tableDelegate.dataArray = array;
    if (tableDelegate.dataArray) {
        NSLog(@"******");
    }else
    {
        NSLog(@"&&&&&&&&&&&&");
    }
    tableDelegate.currentVC = currentVC;
    return tableDelegate;
}

+(instancetype)tableDelegeteWithArray:(DataArrayBLock)array superViewOfTable:(UIView *)superView
{
    FYTBBaseModel *tableDelegate = [[[self class] alloc] init];
    tableDelegate.dataArray = array;
    tableDelegate.superViewOfTable = superView;
    return tableDelegate;
}


-(UITableViewCell *)defaultCell:(UITableView*)tableView
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        
    }
    
    return cell;
}

-(FYBaseCell *)cellFromBaseCellModelFY:(FYBaseCellModel *)cellModel
{
    FYBaseCell *cell;
    
    DebugLog(@"%@%@",cellModel.cellNibName,[cellModel class]);
    
    if (cellModel.cellClass)
    {
        cell = [[cellModel.cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellModel.cellIdentifier];
    }else
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:cellModel.cellNibName owner:nil options:nil] firstObject];
    }
    cell.currentVC = self.currentVC;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    [cellModel setCell:cell toObjectFY:self.currentVC];
    
    return cell;
}

@end
