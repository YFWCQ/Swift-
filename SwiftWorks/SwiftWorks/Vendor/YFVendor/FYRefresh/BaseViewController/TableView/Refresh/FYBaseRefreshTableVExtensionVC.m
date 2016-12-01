//
//  FYBaseRefreshTableVExtensionVC.m
//  FYRrefresh
//
//  Created by FYWCQ on 16/3/27.
//  Copyright © 2016年 FYWCQ. All rights reserved.
//

#import "FYBaseRefreshTableVExtensionVC.h"

#import "FYTBBaseDatasource.h"
#import "FYTBBaseDelegate.h"

#import "OCHeader.h"

@interface FYBaseRefreshTableVExtensionVC ()

@property(nonatomic,strong)FYTBBaseDatasource *dataSourceTB;
@property(nonatomic,strong)FYTBBaseDelegate *delegateTB;

@end

@implementation FYBaseRefreshTableVExtensionVC


-(void)setTableViewDelegateFY
{
    self.delegateTB = [self delegateTBFY];
    self.dataSourceTB = [self dataSourceTBFY];
    self.baseTableView.delegate = self.delegateTB;
    self.baseTableView.dataSource = self.dataSourceTB;
}

//#pragma mark  代理Model 的设置
-(FYTBBaseDatasource *)dataSourceTBFY
{
    weakTypesFY
    return [FYTBBaseDatasource tableDelegeteWithArray:^NSMutableArray *{
        return weakS.baseDataArray;
    } currentVC:self];
}

-(FYTBBaseDelegate *)delegateTBFY
{
    weakTypesFY
  return [FYTBBaseDelegate tableDelegeteWithArray:^NSMutableArray *{
      return weakS.baseDataArray;

  } currentVC:self];
}



@end
