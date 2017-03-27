//
//  IMPController.m
//  NavigationAnalysis
//
//  Created by juliu on 17/3/16.
//  Copyright © 2017年 juliu. All rights reserved.
//

#import "IMPController.h"
#import <objc/runtime.h>

@interface IMPController ()

@end

@implementation IMPController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"viewDidLoad -- %@ 调用了 %s", self, _cmd);
}


@end
