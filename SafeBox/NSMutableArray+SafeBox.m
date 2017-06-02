//
//  NSMutableArray+SafeBox.m
//  SafeBoxExample
//
//  Created by miaoshichang on 2017/5/31.
//  Copyright © 2017年 miaoshichang. All rights reserved.
//

#import "NSMutableArray+SafeBox.h"
#import "NSObject+Swizzle.h"

@implementation NSMutableArray (SafeBox)

- (void)safebox_addObject:(id)anObject
{
    if (anObject)
    {
        [self safebox_addObject:anObject];
    }
    else
    {
        // crash
    }
}

- (void)safebox_removeObjectAtIndex:(NSUInteger)index
{
    if (index < [self count])
    {
        [self safebox_removeObjectAtIndex:index];
    }
    else
    {
        // crash
    }
}

- (void)safebox_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject && index <= [self count])
    {
        [self safebox_insertObject:anObject atIndex:index];
    }
    else
    {
        // crash
    }
}

- (void)safebox_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (anObject && index < [self count])
    {
        [self safebox_replaceObjectAtIndex:index withObject:anObject];
    }
    else
    {
        // crash
    }
}

- (id)safebox_M_objectAtIndex:(NSUInteger)index
{
    if (index < [self count])
    {
        return [self safebox_M_objectAtIndex:index];
    }
    else
    {
        // crash
    }
    
    return nil;
}

#if SafeBox_Start

+ (void)load
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        [self safebox_swizzleMethod:@selector(safebox_addObject:) tarClassName:@"__NSArrayM" tarSel:@selector(addObject:)];
        
        [self safebox_swizzleMethod:@selector(safebox_insertObject:atIndex:) tarClassName:@"__NSArrayM" tarSel:@selector(insertObject:atIndex:)];
        
        [self safebox_swizzleMethod:@selector(safebox_removeObjectAtIndex:) tarClassName:@"__NSArrayM" tarSel:@selector(removeObjectAtIndex:)];
        
        [self safebox_swizzleMethod:@selector(safebox_replaceObjectAtIndex:withObject:) tarClassName:@"__NSArrayM" tarSel:@selector(replaceObjectAtIndex:withObject:)];
        
        [self safebox_swizzleMethod:@selector(safebox_M_objectAtIndex:) tarClassName:@"__NSArrayM" tarSel:@selector(objectAtIndex:)];
        
    });
}

#endif

@end
