//
//  NSDictionary+SafeBox.m
//  SafeBoxExample
//
//  Created by miaoshichang on 2017/5/31.
//  Copyright © 2017年 miaoshichang. All rights reserved.
//

#import "NSDictionary+SafeBox.h"
#import "NSObject+Swizzle.h"


@implementation NSDictionary (SafeBox)

-(instancetype)initWithObjects_safebox:(id *)objects forKeys:(id<NSCopying> *)keys count:(NSUInteger)cnt
{
    NSUInteger newCnt = 0;
    
    for (NSUInteger i = 0; i < cnt; i++)
    {
        if (!(keys[i] && objects[i]))
        {
            break;
        }
        
        newCnt++;
    }
    
    self = [self initWithObjects_safebox:objects forKeys:keys count:newCnt];
    
    return self;
}

#if SafeBox_Start

+ (void) load
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        [self safebox_swizzleMethod:@selector(initWithObjects_safebox:forKeys:count:) tarClassName:@"__NSPlaceholderDictionary" tarSel:@selector(initWithObjects:forKeys:count:)];
        
    });
}

#endif

@end
