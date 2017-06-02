//
//  NSArray+SafeBox.m
//  SafeBoxExample
//
//  Created by miaoshichang on 2017/5/31.
//  Copyright © 2017年 miaoshichang. All rights reserved.
//

#import "NSArray+SafeBox.h"
#import "NSObject+Swizzle.h"

@implementation NSArray (SafeBox)

- (instancetype)initWithObjects_safebox:(id *)objects count:(NSUInteger)cnt
{
    NSUInteger newCnt = 0;
    
    for (NSUInteger i = 0; i < cnt; i++)
    {
        if (!objects[i])
        {
            break;
        }
        
        newCnt++;
    }
    
    self = [self initWithObjects_safebox:objects count:newCnt];
    
    return self;
}

- (id)safebox_I_objectAtIndex:(NSUInteger)index
{
    if (index < [self count])
    {
        return [self safebox_I_objectAtIndex:index];
    }
    else
    {
        // crash
    }
    
    return nil;
}

- (id)safebox_S_I_objectAtIndex:(NSUInteger)index
{
    if (index < [self count])
    {
        return [self safebox_S_I_objectAtIndex:index];
    }
    else
    {
        // crash
    }
    
    return nil;
}

- (id)safebox_0_objectAtIndex:(NSUInteger)index
{
    return nil;
}

#if SafeBox_Start

+ (void)load
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        [self safebox_swizzleMethod:@selector(initWithObjects_safebox:count:) tarClassName:@"__NSPlaceholderArray" tarSel:@selector(initWithObjects:count:)];
        
        // __NSArray0
        [self safebox_swizzleMethod:@selector(safebox_0_objectAtIndex:) tarClassName:@"__NSArray0" tarSel:@selector(objectAtIndex:)];
        
        // __NSSingleObjectArrayI
        [self safebox_swizzleMethod:@selector(safebox_S_I_objectAtIndex:) tarClassName:@"__NSSingleObjectArrayI" tarSel:@selector(objectAtIndex:)];
        
        // __NSArrayI
        [self safebox_swizzleMethod:@selector(safebox_I_objectAtIndex:) tarClassName:@"__NSArrayI" tarSel:@selector(objectAtIndex:)];
        
    });
}

#endif

@end
