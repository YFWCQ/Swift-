//
//  FYBaseTableVC.m
//  FYRrefresh
//
//  Created by FYWCQ on 16/3/31.
//  Copyright © 2016年 FYWCQ. All rights reserved.
//

#import "FYBaseTableVC.h"

@interface FYBaseTableVC ()

@end

@implementation FYBaseTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSubViews_FY];
    [self initData_FY];
    [self loadDataAsyncFY];
//    [self requestData];
}

-(void)loadDataAsyncFY
{
    //    [self showLoadingViewWithMessage:@""];
    __weak typeof(self)weakS = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 清除缓存
        [weakS requestData];
    });
    
}

-(void)requestData
{
    
}

#pragma mark - 本类方法 子类不能重写

-(void)initData_FY
{
    self.baseDataArray = [[NSMutableArray alloc] init];
}
#pragma mark TabelView 的加载
-(void)initSubViews_FY
{
    _baseTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _baseTableView.backgroundColor = [UIColor clearColor];
    _baseTableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;

    if ([_baseTableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        _baseTableView.separatorInset = UIEdgeInsetsZero;
    }
    if ([_baseTableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        _baseTableView.layoutMargins = UIEdgeInsetsZero;
    }
    
    [self setTableViewDelegateFY];
    _baseTableView.tableFooterView = [[UIView alloc] init];
    
    //    _baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone; // 去掉横线
    
    [self.view addSubview: _baseTableView];
}
-(void)requestSuccessArray:(NSMutableArray *)array
{
    if ([NSThread isMainThread])
    {
        [self stopLoadingViewWithMessage:@""];
        [self.baseDataArray addObjectsFromArray:array];
        [self.baseTableView reloadData];
        if (self.baseDataArray.count == 0)
        {
            [self emptyDataReminderAction];
        }
    }else
    {
        __weak typeof(self)weakS = self;
        //回调 主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakS stopLoadingViewWithMessage:@""];
            [weakS.baseDataArray addObjectsFromArray:array];
            [weakS.baseTableView reloadData];
            if (weakS.baseDataArray.count == 0)
            {
                [weakS emptyDataReminderAction];
            }
        });
    }
   
}

-(void)setTableViewDelegateFY
{
    _baseTableView.delegate = self;
    _baseTableView.dataSource = self;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _baseDataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
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


#pragma mark - UITableView DataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        
    }
    return cell;
}


-(void)setBaseTableViewEdgeInsetFY
{
    self.baseTableView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0);
    self.baseTableView.scrollIndicatorInsets = self.baseTableView.contentInset;
}



@end
