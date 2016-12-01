//
//  FYTBSectionsModel.h
//  GTW
//
//  Created by FYWCQ on 16/4/12.
//  Copyright © 2016年 imeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FYTBSectionsModel : NSObject

@property(nonatomic,strong)NSMutableArray *dataArray;

@property(nonatomic,strong)UIView *headerView;
@property(nonatomic,assign)CGFloat headerHeight;


@property(nonatomic,strong)UIView *footerView;
@property(nonatomic,assign)CGFloat footerHeight;

@property(nonatomic,assign)NSUInteger sectionCount;

@end


