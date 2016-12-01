//
//  FYBaseTableVC.h
//  FYRrefresh
//
//  Created by FYWCQ on 16/3/31.
//  Copyright © 2016年 FYWCQ. All rights reserved.
//

#import "FYBaseViewController.h"

@interface FYBaseTableVC : FYBaseViewController<UITableViewDataSource,UITableViewDelegate>

/**
 *  上拉刷新 下拉加载的 UITableView
 */
@property(nonatomic,strong)UITableView * baseTableView;

/**
 * 列表的数据源
 */
@property(nonatomic,strong)NSMutableArray * baseDataArray;

/**
*
 封装功能：array 加到baseDataArray，
 */
-(void)requestSuccessArray:(NSMutableArray *)array;




-(void)setBaseTableViewEdgeInsetFY;

/**
 * 设置 代理和数据源
 */
-(void)setTableViewDelegateFY;

-(void)requestData;

// 异步 加载数据
-(void)loadDataAsyncFY;
@end
