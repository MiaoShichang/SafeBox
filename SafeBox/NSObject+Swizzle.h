//
//  NSObject+Swizzle.h
//  SafeBoxExample
//
//  Created by miaoshichang on 2017/5/31.
//  Copyright © 2017年 miaoshichang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SafeBox.h"

@interface NSObject (Swizzle)


+(void)safebox_swizzleMethod:(SEL)srcSel tarSel:(SEL)tarSel;

+(void)safebox_swizzleMethod:(SEL)srcSel tarClassName:(NSString *)tarClassName tarSel:(SEL)tarSel;

+(void)safebox_swizzleMethod:(Class)srcClass srcSel:(SEL)srcSel tarClass:(Class)tarClass tarSel:(SEL)tarSel;

@end
