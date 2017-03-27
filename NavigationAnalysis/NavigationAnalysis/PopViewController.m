//
//  PopViewController.m
//  NavigationAnalysis
//
//  Created by juliu on 2017/3/27.
//  Copyright © 2017年 juliu. All rights reserved.
//

#import "PopViewController.h"
#import "PopAnimationController.h"
#import "TestViewController.h"

@interface PopViewController ()

@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 30);
    [btn setTitle:@"pop-Nav" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)click:(UIButton *)btn {
    TestViewController *vc = [[TestViewController alloc] init];
    vc.view.backgroundColor = [UIColor blueColor];
    PopAnimationController *nav = [[PopAnimationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
//    [self.navigationController pushViewController:nav animated:YES];
}


@end
