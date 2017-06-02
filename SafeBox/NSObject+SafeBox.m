//
//  NSObject+SafeBox.m
//  SafeBoxExample
//
//  Created by miaoshichang on 2017/6/2.
//  Copyright © 2017年 miaoshichang. All rights reserved.
//

#import "NSObject+SafeBox.h"
#import "NSObject+Swizzle.h"


@implementation NSObject (SafeBox)

- (NSMethodSignature *)safebox_methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *sig = [self safebox_methodSignatureForSelector:aSelector];
    
    if (sig == nil)
    {
        sig = [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    
    return sig;
}

- (void)safebox_forwardInvocation:(NSInvocation *)anInvocation
{
    //    [self safebox_forwardInvocation:anInvocation];
    
#ifdef DEBUG
    
    NSString *msg = [NSString stringWithFormat:@"the class【%@】don't has the method【%@】！！！", self.class, NSStringFromSelector([anInvocation selector])];
    NSAssert(1 != 1, msg);
    
#endif
    
}

+ (void) load
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        [self safebox_swizzleMethod:@selector(safebox_methodSignatureForSelector:) tarSel:@selector(methodSignatureForSelector:)];
        [self safebox_swizzleMethod:@selector(safebox_forwardInvocation:) tarSel:@selector(forwardInvocation:)];
        
    });
}

@end
