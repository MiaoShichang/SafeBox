//
//  NSObject+Swizzle.m
//  SafeBoxExample
//
//  Created by miaoshichang on 2017/5/31.
//  Copyright © 2017年 miaoshichang. All rights reserved.
//

#import "NSObject+Swizzle.h"
#import <objc/runtime.h>


@implementation NSObject (Swizzle)

+ (void)safebox_swizzleMethod:(SEL)srcSel tarSel:(SEL)tarSel
{
    Class clazz = [self class];
    [self safebox_swizzleMethod:clazz srcSel:srcSel tarClass:clazz tarSel:tarSel];
}

+ (void)safebox_swizzleMethod:(SEL)srcSel tarClassName:(NSString *)tarClassName tarSel:(SEL)tarSel
{
    if (!tarClassName)
    {
        return;
    }
    
    Class srcClass = [self class];
    Class tarClass = NSClassFromString(tarClassName);
    [self safebox_swizzleMethod:srcClass srcSel:srcSel tarClass:tarClass tarSel:tarSel];
}

+ (void)safebox_swizzleMethod:(Class)srcClass srcSel:(SEL)srcSel tarClass:(Class)tarClass tarSel:(SEL)tarSel
{
    if (!srcClass || !srcSel || !tarClass || !tarSel)
    {
        return;
    }
    
    Method srcMethod = class_getInstanceMethod(srcClass,srcSel);
    Method tarMethod = class_getInstanceMethod(tarClass,tarSel);
    method_exchangeImplementations(srcMethod, tarMethod);
}

@end
