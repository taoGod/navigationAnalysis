//
//  TestViewController.m
//  NavigationAnalysis
//
//  Created by juliu on 2017/3/27.
//  Copyright © 2017年 juliu. All rights reserved.
//

#import "TestViewController.h"
#import "Test2ViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 30);
    [btn setTitle:@"push-Test2" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"icon_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
//    [self.navigationController.navigationController popViewControllerAnimated:YES];
}

- (void)click:(UIButton *)btn {
    Test2ViewController *vc = [[Test2ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
