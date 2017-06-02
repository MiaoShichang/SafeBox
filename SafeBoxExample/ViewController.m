//
//  ViewController.m
//  SafeBoxExample
//
//  Created by miaoshichang on 2017/5/31.
//  Copyright © 2017年 miaoshichang. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSMutableArray *array0 = [[NSMutableArray alloc]init];
//    NSLog(@"array class -- %@", NSStringFromClass([array0 class]));
//    id d = [array0 objectAtIndex:2];
//    NSLog(@"d value = %@", d);

    
    NSString *value = nil;
    
    NSDictionary *dict = @{@"miao":value};
    NSLog(@"dict -- %@", dict);
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
