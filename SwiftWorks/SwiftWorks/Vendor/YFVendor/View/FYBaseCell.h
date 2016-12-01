//
//  FYBaseCell.h
//  
//
//  Created by FYWCQ on 15/11/5.
//
//

#import <UIKit/UIKit.h>

@interface FYBaseCell : UITableViewCell


@property(nonatomic,weak)UIViewController *currentVC;

@property(nonatomic,copy)void(^changeValueBlock)(id);

//跳转页面
@property(nonatomic,copy)void(^pushVC)(UIViewController*);
//第二分类 每个TableView上有多少个分类图标


-(void)bindModel:(id)model;

@end
