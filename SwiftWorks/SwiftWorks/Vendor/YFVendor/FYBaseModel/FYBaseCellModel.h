//
//  FYBaseCellModel.h
//  
//
//  Created by FYWCQ on 15/11/5.
//
//

#import "FYBaseModel.h"

#import "FYBaseCell.h"

#import "FYBaseViewController.h"

@interface FYBaseCellModel : FYBaseModel

@property(nonatomic,weak)FYBaseCell *weakCell;


@property(nonatomic,strong)Class cellClass;

@property(nonatomic,assign)CGFloat cellHeight;

@property(nonatomic,copy)NSString *cellIdentifier;

@property(nonatomic,copy)NSString *cellNibName;


//跳转页面
@property(nonatomic,copy)void(^pushVC)(UIViewController*);

-(void)setCell:(FYBaseCell *)baseCell toObjectFY:(NSObject *)object;

-(void)bindCell:(FYBaseCell *)baseCell indexPath:(NSIndexPath*)indexPath;

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath onVC:(FYBaseViewController *)viewC;

@end
