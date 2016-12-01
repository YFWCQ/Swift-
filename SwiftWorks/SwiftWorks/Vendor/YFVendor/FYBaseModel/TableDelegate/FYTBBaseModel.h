//
//  FYTBBaseModel.h
//  FYRrefresh
//
//  Created by FYWCQ on 16/3/24.
//  Copyright © 2016年 FYWCQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "FYBaseCell.h"
#import "FYBaseCellModel.h"
#import "FYBaseViewController.h"

typedef NSMutableArray*(^DataArrayBLock)() ;



@interface FYTBBaseModel : NSObject
//@property(nonatomic,weak)NSMutableArray *dataArray;
@property(nonatomic,copy)DataArrayBLock dataArray;

@property(nonatomic,weak)FYBaseViewController *currentVC;
@property(nonatomic,weak)UIView *superViewOfTable;


+(instancetype)tableDelegeteWithArray:(DataArrayBLock)array currentVC:(FYBaseViewController *)currentVC;

+(instancetype)tableDelegeteWithArray:(DataArrayBLock)array superViewOfTable:(UIView *)superView;


-(UITableViewCell *)defaultCell:(UITableView*)tableView;

-(FYBaseCell *)cellFromBaseCellModelFY:(FYBaseCellModel *)cellModel;

@end
