//
//  FYBaseCellModel.m
//  
//
//  Created by FYWCQ on 15/11/5.
//
//

#import "FYBaseCellModel.h"

@implementation FYBaseCellModel

-(void)bindCell:(FYBaseCell *)baseCell indexPath:(NSIndexPath *)indexPath
{
    
}

-(void)setCell:(FYBaseCell *)baseCell toObjectFY:(NSObject *)object
{
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath onVC:(FYBaseViewController *)viewC
{
    
}

-(NSString *)cellNibName
{
    if (_cellNibName.length == 0)
    {
        return _cellIdentifier;
    }
    return _cellNibName;
}

@end
