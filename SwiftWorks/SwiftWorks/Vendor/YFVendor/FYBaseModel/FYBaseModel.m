//
//  FYBaseModel.m
//  
//
//  Created by FYWCQ on 15/11/5.
//
//

#import "FYBaseModel.h"

#import "YFHttpService.h"
#import "OCHeader.h"

@implementation FYBaseModel

- (id)initWithDictionary:(NSDictionary*)jsonDic
{
    if ((self = [super init]))
    {
        if ([jsonDic isKindOfClass:[NSDictionary class]] == NO)
        {
//            DebugLog(@"%@ %@",jsonDic,[self class]);
            return self;
        }else

        [self setValuesForKeysWithDictionary:jsonDic];
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    DebugLog(@"Undefined Key:%@ in %@",key,[self class]);
}

//   ing 失败掉的 方法
-(void)failRequest:(NSError *)error
{
    [YFAppservice showAlertMessage:[YFHttpService errorStringFromError:error]];
}

@end
