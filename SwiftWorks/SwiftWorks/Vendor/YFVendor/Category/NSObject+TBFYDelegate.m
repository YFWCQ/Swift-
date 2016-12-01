//
//  NSObject+TBFYDelegate.m
//  GTW
//
//  Created by FYWCQ on 16/5/14.
//  Copyright © 2016年 imeng. All rights reserved.
//

#import "NSObject+TBFYDelegate.h"

#import "NSObject+RungtimeFY.h"



static const void *TBFYDataArrayKeyFY = @"TBFYDataArrayKeyFY";

static const void *TBFYCurrentVCFY = @"TBFYCurrentVCFY";
#pragma mark - single Section
static const void *TBFYDelegateKeyFY = @"TBFYDelegateKeyFY";
static const void *TBFYDatasourceKeyFY = @"TBFYDatasourceKeyFY";

#pragma mark - Sections
static const void *TBFYDelegateSectionKeyFY = @"TBFYDelegateSectionKeyFY";
static const void *TBFYDatasourceSectionKeyFY = @"TBFYDatasourceSectionKeyFY";

@implementation NSObject (TBFYDelegate)

-(void)setDataArrayFY:(DataArrayBLock)dataArrayFY
{
    [self yf_setCopyValueToObject:self key:&TBFYDataArrayKeyFY value:dataArrayFY];
}
-(DataArrayBLock)dataArrayFY
{
    return [self yf_getValueFromObject:self key:&TBFYDataArrayKeyFY];
}

-(void)setCurrentVCFY:(FYBaseViewController *)currentVCFY
{
    [self yf_setRetainValueToObject:self key:&TBFYCurrentVCFY value:currentVCFY];
}

-(FYBaseViewController *)currentVCFY
{
    return [self yf_getValueFromObject:self key:&TBFYCurrentVCFY];
}


#pragma mark - Singgle Section
-(FYTBBaseDelegate *)delegateSiTBFY
{
   FYTBBaseDelegate *delegateTBFY = [self yf_getValueFromObject:self key:&TBFYDelegateKeyFY];
    if (delegateTBFY == nil) {
        delegateTBFY = [FYTBBaseDelegate tableDelegeteWithArray:self.dataArrayFY currentVC:self.currentVCFY];
        [self setDelegateSiTBFY:delegateTBFY];
    }
    return delegateTBFY;
}

-(void)setDelegateSiTBFY:(FYTBBaseDelegate *)delegateSiTBFY
{
    [self yf_setRetainValueToObject:self key:&TBFYDelegateKeyFY value:delegateSiTBFY];
}


-(FYTBBaseDatasource *)dataSourceSiTBFY
{
    FYTBBaseDatasource *datasourceTBFY = [self yf_getValueFromObject:self key:&TBFYDatasourceKeyFY];
    if (datasourceTBFY == nil) {
        datasourceTBFY = [FYTBBaseDatasource tableDelegeteWithArray:self.dataArrayFY currentVC:self.currentVCFY];
        [self setDataSourceSiTBFY:datasourceTBFY];
    }
    return datasourceTBFY;
}
-(void)setDataSourceSiTBFY:(FYTBBaseDatasource *)dataSourceSiTBFY
{
    [self yf_setRetainValueToObject:self key:&TBFYDatasourceKeyFY value:dataSourceSiTBFY];

}



#pragma mark - Section s
-(FYTBBaseDelegate *)delegateSectionsTBFY
{
    FYTBBaseDelegate *delegateTBFY = [self yf_getValueFromObject:self key:&TBFYDelegateSectionKeyFY];
    if (delegateTBFY == nil) {
        delegateTBFY = [FYTBSectionsDelegate tableDelegeteWithArray:self.dataArrayFY currentVC:self.currentVCFY];
        [self setDelegateSectionsTBFY:delegateTBFY];
    }
    return delegateTBFY;
}


-(void)setDelegateSectionsTBFY:(FYTBBaseDelegate *)delegateSectionsTBFY
{
    [self yf_setRetainValueToObject:self key:&TBFYDelegateSectionKeyFY value:delegateSectionsTBFY];

}

-(FYTBBaseDatasource *)dataSourceSectionsTBFY
{
    FYTBSectionsDataSource *datasourceTBFY = [self yf_getValueFromObject:self key:&TBFYDatasourceSectionKeyFY];
    if (datasourceTBFY == nil) {
        datasourceTBFY = [FYTBSectionsDataSource tableDelegeteWithArray:self.dataArrayFY currentVC:self.currentVCFY];
        [self setDataSourceSectionsTBFY:datasourceTBFY];
    }
    return datasourceTBFY;
}

-(void)setDataSourceSectionsTBFY:(FYTBBaseDatasource *)dataSourceSectionsTBFY
{
    [self yf_setRetainValueToObject:self key:&TBFYDatasourceSectionKeyFY value:dataSourceSectionsTBFY];
}




@end
