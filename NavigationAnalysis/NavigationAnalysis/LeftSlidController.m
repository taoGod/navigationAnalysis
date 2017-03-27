//
//  LeftSlidController.m
//  NavigationAnalysis
//
//  Created by juliu on 17/3/16.
//  Copyright © 2017年 juliu. All rights reserved.
//

#import "LeftSlidController.h"
#import "PanNavigationController.h"
#import "Slid2ViewController.h"

@interface LeftSlidController ()<UIGestureRecognizerDelegate>

@end

@implementation LeftSlidController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"icon_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    // 方式一
//    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    // 方式二
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(100, 100, 80, 30);
//    [btn setTitle:@"进入Pan手势返回" forState:UIControlStateNormal];
    
    id target = self.navigationController.interactivePopGestureRecognizer.delegate;
//    NSLog(@"%@", target); // _UINavigationInteractiveTransition
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
