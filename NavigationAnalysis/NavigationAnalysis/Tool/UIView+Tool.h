//
//  UIView+Tool.h
//  FunctionTest
//
//  Created by juliu on 16/10/12.
//  Copyright © 2016年 juliu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Tool)

@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGSize size;
@property (assign, nonatomic) CGPoint origin;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

- (UIViewController *)viewControll;

@end
