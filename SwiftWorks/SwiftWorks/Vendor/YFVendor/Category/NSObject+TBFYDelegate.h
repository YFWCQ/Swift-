//
//  NSObject+TBFYDelegate.h
//  GTW
//
//  Created by FYWCQ on 16/5/14.
//  Copyright © 2016年 imeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FYTBBaseDatasource.h"
#import "FYTBBaseDelegate.h"

#import "FYTBSectionsDelegate.h"
#import "FYTBSectionsDataSource.h"


#import "FYBaseViewController.h"

@interface NSObject (TBFYDelegate)

/**
 * 第一步 实现 这个Block
 [self setDataArray:^NSMutableArray *{
 return weakS.baseDataArray;// 数据源
 }]
 */
@property(nonatomic,weak)DataArrayBLock dataArrayFY;
@property(nonatomic,weak)FYBaseViewController* currentVCFY;


@property(nonatomic,strong)FYTBBaseDatasource *dataSourceSiTBFY;
@property(nonatomic,strong)FYTBBaseDelegate *delegateSiTBFY;

@property(nonatomic,strong)FYTBBaseDatasource *dataSourceSectionsTBFY;
@property(nonatomic,strong)FYTBBaseDelegate *delegateSectionsTBFY;

@end
