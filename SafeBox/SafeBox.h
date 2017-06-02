//
//  SafeBox.h
//  SafeBoxExample
//
//  Created by miaoshichang on 2017/6/1.
//  Copyright © 2017年 miaoshichang. All rights reserved.
//

#ifndef SafeBox_h
#define SafeBox_h

/**
<><><><><><><><><><><><>
 
代码的主要作用是减少对数组，字典进行一些操作时，带有nil参数造成的崩溃。
这里只进行了一些常用方法的保护，其他方法如有需要请自行添加
 
示例代码：
 
 NSString *value = nil;
 NSDictionary *dict = @{@"key":value};
 NSLog(@"dict -- %@", dict);
 
崩溃日志：
 
 *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '*** -[__NSPlaceholderDictionary initWithObjects:forKeys:count:]: attempt to insert nil object from objects[0]'
 *** First throw call stack:
 (0x18b73efe0 0x18a1a0538 0x18b6259b4 0x18b625824 0x100082220 0x19186fec0 0x19186fa9c 0x19187631c 0x1918737b8 0x1918e5224 0x191aed7ec 0x191af31e0 0x191b07d18 0x191af0474 0x18d2e7884 0x18d2e76f0 0x18d2e7aa0 0x18b6ed42c 0x18b6ecd9c 0x18b6ea9a8 0x18b61ada4 0x1918da384 0x1918d5058 0x100082848 0x18a62959c)
 libc++abi.dylib: terminating with uncaught exception of type NSException
 
<><><><><><><><><><><><>
 
使用说明：
  1 直接将该SDK源码放到项目中就可以了，不需要任何其他的额外操作
 
  注意：使用此SDK也会有副作用
       1 APP不崩溃了，但是数据没出来，产生意想不到的效果；
       2 不崩溃你也就不会收集到相应的崩溃日志，你也就很少发现问题，也无法及时修复问题

 <><><><><><><><><><><><>
 
是否使用请慎重考虑，产生后果自己承担
 
 <><><><><><><><><><><><>
 */


/**
 
 开关说明：
 1 如果是DEBUG模式，应该关掉，这样可以很容易在开发阶段就可以发现问题；
 2 只有在上线以后才打开开关，这样可以减少APP的崩溃。
 
 注意：也可以在DEBUG模式下使用，只是将（SafeBox.h)下面的SafeBox_Start FALSE 改为 SafeBox_Start TRUE 就可以了
 
 */

#ifdef DEBUG
    #define SafeBox_Start FALSE
#else
    #define SafeBox_Start TRUE
#endif



#endif /* SafeBox_h */
