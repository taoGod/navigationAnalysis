//
//  UIColor+Tool.h
//  YouLiangTest
//
//  Created by juliu on 16/10/10.
//  Copyright © 2016年 juliu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Tool)

+ (UIColor *)colorWithRGB:(int)rgb;

+ (UIColor *)colorWithRGB:(int)rgb A:(CGFloat)a;

+ (UIColor *)colorWithHtmlRgbString:(NSString *)htmlRgbStr;

@end
