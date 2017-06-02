//
//  NSMutableDictionary+SafeBox.m
//  SafeBoxExample
//
//  Created by miaoshichang on 2017/5/31.
//  Copyright © 2017年 miaoshichang. All rights reserved.
//

#import "NSMutableDictionary+SafeBox.h"
#import "NSObject+Swizzle.h"


@implementation NSMutableDictionary (SafeBox)

- (void)safebox_removeObjectForKey:(id)aKey
{
    if (aKey)
    {
        [self safebox_removeObjectForKey:aKey];
    }
    else
    {
        // crash
    }
}

- (void)safebox_setObject:(id)anObject forKey:(id <NSCopying>)aKey
{
    if (anObject && aKey)
    {
        [self safebox_setObject:anObject forKey:aKey];
    }
    else
    {
        // crash
    }
}

#if SafeBox_Start

+ (void) load
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        [self safebox_swizzleMethod:@selector(safebox_removeObjectForKey:) tarClassName:@"__NSDictionaryM" tarSel:@selector(removeObjectForKey:)];
        
        [self safebox_swizzleMethod:@selector(safebox_setObject:forKey:) tarClassName:@"__NSDictionaryM" tarSel:@selector(setObject:forKey:)];
        
    });
}

#endif

@end
