//
//  UIImage+Tool.h
//  YouLiangTest
//
//  Created by juliu on 16/10/9.
//  Copyright © 2016年 juliu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tool)

/**
 *  绘制一张图片，颜色为color，大小为rect
 *
 *  @param color 颜色
 *  @param rect 目标尺寸
 */
+ (UIImage *)imageWithColor:(UIColor *)color rect:(CGRect)rect;

/**
 *  绘制一张图片，颜色为color，大小为1
 *
 *  @param color 颜色
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  画一个三角形
 */
+ (UIImage *)imageTriangle;

/**
 *  切成圆形图片
 *
 *  @param image image
 */
- (UIImage*)circleImage;

//设置不要渲染图片
+ (instancetype)renderImageWithNamed:(NSString *)imageName;

//64位编码转图片
+ (UIImage *)imageWithBase64:(NSString *)encode;

//图片64位编码
- (NSString *)base64;

/**
 *  将图片转换成目标尺寸的图片
 *
 *  @param targetSize targetSize
 */
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;

/**
 *  将图片切成圆形图片
 */
- (UIImage*)circleImage;

@end
