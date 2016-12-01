//
//  FYBaseScroButtonsView.h
//  FYRrefresh
//
//  Created by FYWCQ on 16/3/31.
//  Copyright © 2016年 FYWCQ. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef enum {
    kFYScroIndicateNone = 0,
    kFYScroIndicateDot = 1,
    kFYScroIndicateLine = 2,
} FYScroStyle;

@interface FYBaseScroButtonsView : UIView

/**
 *   提示 View
 */
@property(nonatomic,strong)UIView *scroIndicView;

/**
 * 滑动提示
 */
@property(nonatomic,assign)FYScroStyle scroStyle;
@property(nonatomic,strong)UIColor *scroStyleColor;



@property(nonatomic,strong)UIScrollView *scrollView;

@property(nonatomic,strong)NSMutableArray *categoryButtonsArray;

@property(nonatomic,strong)UIColor *titleNomalColor;
@property(nonatomic,strong)UIColor *titleSelectColor;
@property(nonatomic,strong)UIFont *titleFont;

-(void)initSettingData;

-(void)setButtonDefaultSetting:(UIButton *)button;






/**
 *  向 外部 传出去 点击的 信息（点击了第几个button），index 从 1 开始
 */
@property(nonatomic,copy)void(^clickIndex)(NSUInteger index);

/**
 * 根据 Title 去加载Button
 */
-(void)loadButtonWithTitle:(NSString *)title;

/**
 * 初始化 加载完Button 之后，去做 相应的设置
 */
-(void)loadButtonEnd;

/**
 *  尽可能 使  相应的分类 标签 显示 到最中间，index 从1 开始
 */
-(void)scrollToCategoryWithIndex:(NSUInteger)index;
/**
 *  列表 scrollVIew 滑动时  调用
 */
-(void)mainScrollViewDidSroll:(UIScrollView *)scrollView;

/**
 *index 从 1 开始，通过 代码 让 该 button 执行 点击方法
 */
-(void)clickButtonOfIndex:(NSUInteger)index;

/**
 *  根据 index（从1 开始）删除对应的Button
 */
-(void)deleteButtonOfIndex:(NSUInteger)index;



-(void)clickCategoryButtonAction:(UIButton *)button;


/**
 * 设置提示View Size通过Frame
 */
-(void)setFrameScroIndicViewSizeToFrame:(CGRect)frame;


@end
