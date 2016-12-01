//
//  FYBaseTableExtensionVC.m
//  FYRrefresh
//
//  Created by FYWCQ on 16/3/31.
//  Copyright © 2016年 FYWCQ. All rights reserved.
//

#import "FYBaseTableExtensionVC.h"

#import "NSObject+TBFYDelegate.h"
#import "OCHeader.h"

//#import "FYTBBaseDatasource.h"
//#import "FYTBBaseDelegate.h"


@interface FYBaseTableExtensionVC ()

@property(nonatomic,strong)FYTBBaseDatasource *dataSourceTB;
@property(nonatomic,strong)FYTBBaseDelegate *delegateTB;

@end

@implementation FYBaseTableExtensionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



-(void)setTableViewDelegateFY
{
    weakTypesFY
    [self setDataArrayFY:^NSMutableArray *{
        return weakS.baseDataArray;
    }];
    self.currentVCFY = self;
    
    self.delegateTB = [self delegateTBFY];
    self.dataSourceTB = [self dataSourceTBFY];
    self.baseTableView.delegate = self.delegateTB;
    self.baseTableView.dataSource = self.dataSourceTB;
}

////#pragma mark  代理Model 的设置
//#pragma mark  代理Model 的设置
//-(FYTBBaseDatasource *)dataSourceTBFY
//{
//    weakTypesFY
//    return [FYTBBaseDatasource tableDelegeteWithArray:^NSMutableArray *{
//        return weakS.baseDataArray;
//    } currentVC:self];
//}
//
//-(FYTBBaseDelegate *)delegateTBFY
//{
//    weakTypesFY
//    return [FYTBBaseDelegate tableDelegeteWithArray:^NSMutableArray *{
//        return weakS.baseDataArray;
//        
//    } currentVC:self];
//}
-(FYTBBaseDatasource *)dataSourceTBFY
{
    return self.dataSourceSiTBFY;
}

-(FYTBBaseDelegate *)delegateTBFY
{
    return self.delegateSiTBFY;
}



@end
