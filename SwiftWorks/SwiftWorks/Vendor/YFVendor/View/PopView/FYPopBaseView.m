//
//  FYPopBaseView.m
//  
//
//  Created by FYWCQ on 15/11/6.
//
//

#import "FYPopBaseView.h"
#import "MBProgressHUD.h"


@interface FYPopBaseView ()
//加载框
@property(nonatomic,strong)MBProgressHUD *proHUD;

@end

@implementation FYPopBaseView

-(id)initWithFrame:(CGRect)frame
{
    self= [super initWithFrame:frame];
    
    if (self){
        
        CGFloat widthSort =[UIScreen mainScreen].bounds.size.width;
        
        CGFloat heightSort =[UIScreen mainScreen].bounds.size.height;
        
        
        self.frame = CGRectMake(0, 0, widthSort, heightSort);
        
        [self setBackgroundColor:[UIColor colorWithRed:0. green:0. blue:0. alpha:.8]];
        
        self.hidden = YES;
        
        [[[UIApplication sharedApplication].delegate window] addSubview:self];
        
        [self addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];  
    }
    
    return self;
}


-(void)initChildrenViewWithFrame:(CGRect)frame
{
    _originFrame = frame;
    
    
    _hiddenFrame = CGRectMake(_originFrame.origin.x, _originFrame.origin.y + _originFrame.size.height, _originFrame.size.width, _originFrame.size.height);
    
    _childredView = [[UIView alloc] initWithFrame:_hiddenFrame];
    
    _childredView .backgroundColor = [UIColor whiteColor];
    
    [self addSubview:_childredView ];
}



-(void)show
{
    if (self.hidden == NO)
    {
        return;
    }
    
    [[[UIApplication sharedApplication].delegate window]endEditing:YES];
    
    [[[UIApplication sharedApplication].delegate window] addSubview:self];

    self.hidden = NO;
    
    self.userInteractionEnabled = YES;
    
    if (_childredView)
    {
        
        _childredView.alpha = 0.;
        
        if (_originFrame.origin.y != _childredView.frame.origin.y)
        {
            __weak typeof(self)weakSelf  = self;
            
            [UIView animateWithDuration:0.3 animations:^{
                
                _childredView.alpha = 1.;
                weakSelf.childredView.frame = _originFrame;
                
            } completion:^(BOOL finished) {
            }];
            
        }else
        {
            [UIView animateWithDuration:0.1 animations:^{
                
                self.alpha = 1.;
                
            } completion:^(BOOL finished) {
                
                [self removeFromSuperview];
            }];
        }
    }
}

-(void)hide
{
    self.userInteractionEnabled = NO;
    
    if (_childredView)
    {
        if (_hiddenFrame.origin.y != _childredView.frame.origin.y)
        {
            __weak typeof(self)weakSelf  = self;
            
            [UIView animateWithDuration:0.3 animations:^{
                
                _childredView.alpha = 0.;
                
                weakSelf.childredView.frame = _hiddenFrame;
                
            } completion:^(BOOL finished) {
//                [AppModel shareAppModel].chooseId = nil;

                weakSelf.hidden = YES;
                
            }];
        }
        
    }else
    {
        [UIView animateWithDuration:0.1 animations:^{
            
            self.alpha = 0.;
            
        } completion:^(BOOL finished) {
            
        }];
 
    }
}
-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];

    _originFrame = CGRectMake(0, self.frame.size.height - self.childredView.frame.size.height, self.frame.size.width, self.childredView.frame.size.height);
    
    _hiddenFrame = CGRectMake(_originFrame.origin.x, _originFrame.origin.y + _originFrame.size.height, _originFrame.size.width, _originFrame.size.height);
    
    self.childredView.frame = _hiddenFrame;
 
}

-(void)showLoadingViewWithMessage:(NSString*)message
{
    if (message) {
        self.proHUD.labelText = message;
    }
    [self.proHUD show:YES];
}
-(void)stopLoadingViewWithMessage:(NSString*)message
{
    if (_proHUD == nil)
    {
        return;
    }
    if (message.length)
    {
        self.proHUD.labelText = message;
        [self.proHUD hide:YES afterDelay:.5];
    }
    else
    {
        [self.proHUD hide:YES];
    }
}

-(MBProgressHUD *)proHUD
{
    if (_proHUD == nil)
    {
        _proHUD = [[MBProgressHUD alloc] initWithView:self];
        
        [self addSubview:_proHUD];
    }
    [self bringSubviewToFront:_proHUD];
    return _proHUD;
}

//各种错误信息提示
-(void)showErrorInfo:(NSError *)error
{
    //错误提示语
    NSString *errorString = nil;
    
    if (error.code == -1009)
    {
        errorString = @"网络断开连接";
    }
    else if (error.code == -1003 || error.code == -1004)
    {
        errorString = @"服务器异常";
    }
    else if (error.code == -1001)
    {
        errorString = @"请求超时,请检查网络后重试!";
    }
    else if (error.code == 3848)
    {
        errorString = @"转换JOSN格式错误";
    }
    else if (error.code == -1016)
    {
        //不需要提示给用户，调试接口时应该解决掉这个问题
        errorString = @"网络不给力";
    }
    else
    {
        errorString = @"网络不给力";
    }
    [self showAlertViewWithMessage:errorString];
}

/**
 * 弹框方法
 */
- (void)showAlertViewWithMessage:(NSString *)message
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alertView show];
}

@end
