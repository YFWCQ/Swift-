//
//  FYBaseRefreshTableViewController.m
//  FYRefresh
//
//  Created by Medalands on 15/11/1.
//  Copyright © 2015年 medalands. All rights reserved.
//

#import "FYBaseRefreshTableViewController.h"
#import "OCHeader.h"


@interface FYBaseRefreshTableViewController ()

/**
 * YES 刷新  ，NO 加载  用于请求数据方法的判断
 */
@property(nonatomic,assign) BOOL refreshing;

/**
 * 上一次 请求的 页数
 */
@property(nonatomic,assign)NSUInteger lastRequestPage;

/**
 * 上次刷新的时间
 */
@property(nonatomic,assign)CFAbsoluteTime lastRefreshTime;//

/**
 * 当前时间
 */
@property(nonatomic,assign)CFAbsoluteTime currentTime;




@end

@implementation FYBaseRefreshTableViewController
{
    BOOL _isFirstStartRequest;
    BOOL _canPullRefresh;
}
-(void)dealloc
{
    self.baseDataArray = nil;
    
    self.baseTableView.delegate = nil;
    
    self.baseTableView.delegate = nil;
    
    self.baseTableView = nil;
}


-(instancetype)init
{
    self = [super init];
    
    if (self)
    {
        [self initData_FY];
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    [self initData_FY];
}


-(void)loadView
{
    [super loadView];
    
    [self initSubViews_FY];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    [self refreshTableListDataaAtFirstTime];
}

-(void)refreshTableListDataaAtFirstTime
{
    if (_isFirstStartRequest && _canPullRefresh)
    {
        _isFirstStartRequest = NO;
        [self startRequest];
    }
}


#pragma mark - 本类方法 子类不能重写

-(void)initData_FY
{
    _canPullRefresh = YES;
    _canGetMore = YES;
    _isFirstStartRequest = YES;
    _lastRefreshTime = 0;// 只有在刷新成功后才进行赋值
    
    _currentTime = CFAbsoluteTimeGetCurrent();
    
    _baseDataArray = [[NSMutableArray alloc] init];
    
    _firstPage =  1;
    
    _betweenRefreshTimes = 20 * 60;
}


#pragma mark 请求成功 数据处理
-(void)requestSuccessArray:(NSMutableArray *)array
{
    if (self.isReFreshing)
    {
        self.lastRefreshTime = CFAbsoluteTimeGetCurrent(); //更新刷新时间
        
        self.baseDataArray = array;
        
        if (array.count == 0)
        {
            [self.baseTableView clearFoorView];
        }else
        {
            if (_canGetMore == YES)
            {
                if (array.count < _numberOfEachPage || array.count == 0)
                {
                    //没有更多数据
                    self.baseTableView.reachedTheEnd = YES;
                }else
                {
                [self.baseTableView canShowFootView];
                }
            }
        }
        
    }else
    {
        if (array.count >0 )
        {
            [self.baseDataArray addObjectsFromArray:array];
        }
        
        if (array.count < _numberOfEachPage || array.count == 0)
        {
            //没有更多数据
            self.baseTableView.reachedTheEnd = YES;
        }
    }
    
    if (self.sumDataNum>0 && self.baseDataArray.count >= self.sumDataNum)
    {
        self.baseTableView.reachedTheEnd = YES;
    }
    
    [self.baseTableView reloadData];
    
    [self.baseTableView tableViewDidFinishedLoading];

    [self stopLoadingViewWithMessage:nil];
    
    if (self.baseDataArray.count == 0)
    {
        [self emptyDataReminderAction];
    }
    NSLog(@"列表总数------:%ld",[self.baseDataArray count]);
}
#pragma mark 请求失败 数据处理
-(void)requestFail:(NSError *)error
{
    self.dataPage = self.lastRequestPage;
    [self.baseTableView tableViewDidFinishedLoading];
}

#pragma mark TabelView 的加载
-(void)initSubViews_FY
{
    _baseTableView = [[FYRefreshTableView alloc] initWithFrame:self.view.bounds pullingDelegate:self style:UITableViewStylePlain];
    
    _baseTableView.backgroundColor = [UIColor clearColor];
#warning 考虑界面重用 时，这个Key是一样的
    self.baseTableView.headerView.dateStoreKey = NSStringFromClass([self class]);
    _baseTableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;

    //    _baseTableView ->_footerView.emptyDataText = @"没有找到符合条件的酒店！";
    
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
    
    [_baseTableView clearFoorView];// 初始化 不允许加载
    
    [self.view addSubview: _baseTableView];
}

-(void)setTableViewDelegateFY
{
    _baseTableView.delegate = self;
    _baseTableView.dataSource = self;
}

-(void)startRequest
{
    NSLog(@"3333333333");

    [self refreshTableListData];
}

-(void)refreshTableListData
{
    self.refreshing = YES;
    
    [_baseTableView launchRefreshing];
}

-(void)refreshTableListDataIfNeed
{
    _currentTime = CFAbsoluteTimeGetCurrent();
    
    if (_currentTime - _lastRefreshTime  > _betweenRefreshTimes)
    {
        [self refreshTableListData];
    }
}
//-(void)refreshTableListDataIfNeed
//{
//    
//    if (self.baseDataArray.count == 0)
//    {
//        [self refreshTableListData];
//    }
//}
-(void)refreshTableListDataNoPull
{
    _canPullRefresh = NO;
    self.isReFreshing = YES;
    [self showLoadingViewWithMessage:@"加载中"];
    [self requestDataFY];
}

-(void)requestDataFY
{
    //    self.requestDataArray = [[NSMutableArray alloc]init];
    
    _lastRequestPage = _dataPage;
    
    if (self.refreshing)
    {
        _dataPage = _firstPage;
    }
    else
    {
        _dataPage++;
    }
    
    [self requestData];
}

#pragma mark  - 子类方法 ，子类必须重写，在这个方法 去 进行 网络的数据请求
-(void)requestData
{
    
}

//#pragma mark tableView 代理方法
//#pragma mark -

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



#pragma mark 刷新 加载 代理方法
// 停止拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    if ([scrollView isEqual:_baseTableView]) {
        [_baseTableView tableViewDidEndDragging:scrollView];
    }
}

//刷新
- (void)FYRefreshViewDidStartRefreshing:(UIScrollView *)tableView{
    if (_baseTableView.canRefresh)
    {
        
        //    _lastRefreshTime = CFAbsoluteTimeGetCurrent();//上次刷新的时间
        
        self.refreshing = YES;
        
        _baseTableView.reachedTheEnd = NO;
        _baseTableView.canRefresh = NO;
        
        __weak typeof(self)weakS = self;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kFYRefreshDelaySecondsssss * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakS requestDataFY];
        });
    }
    
}
//加载
- (void)FYRefreshViewDidStartLoading:(UIScrollView *)tableView{
    
    if (_baseTableView.canGetMore) {
        
        self.refreshing = NO;
        
        self.isReFreshing = NO;
        
        _baseTableView.canGetMore=NO;
        __weak typeof(self)weakS = self;

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kFYRefreshDelaySecondsssss * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
            [weakS requestDataFY];
        });
    }
}
// 日期
- (NSDate *)FYRefreshViewRefreshingFinishedDate{
    
    return [NSDate date];
    
}


-(void)setRefreshing:(BOOL)refreshing
{
    
    if (refreshing) {
        self.isReFreshing = YES;
    }
    _refreshing = refreshing;
}

-(void)failRequest:(NSError *)error
{
    if (self.dataPage > _firstPage) // 加载 下一页失败 页数 -1
    {
        self.dataPage --;
    }
    
    [_baseTableView tableViewDidFinishedLoading];
    
    [self.baseTableView reloadData];
    [super failRequest:error];
}


@end
