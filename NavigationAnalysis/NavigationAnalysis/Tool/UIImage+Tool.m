//
//  UIImage+Tool.m
//  YouLiangTest
//
//  Created by juliu on 16/10/9.
//  Copyright © 2016年 juliu. All rights reserved.
//

#import "UIImage+Tool.h"

static float arrowH = 6;
static float arrowW = 15;

@implementation UIImage (Tool)

// 通过颜色生成指定大小的图片
+ (UIImage *)imageWithColor:(UIColor *)color rect:(CGRect)rect{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.f, 0.f, 1.f, 1.f);
    return [self imageWithColor:color rect:rect];
}

//一个三角形
+ (UIImage *)imageTriangle {
    CGRect rect = CGRectMake(0, 0, arrowW, arrowH);
    
    UIGraphicsBeginImageContext(rect.size);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, rect.size.height)];
    [path addLineToPoint:CGPointMake(arrowW/2.0, 0)];
    [path addLineToPoint:CGPointMake(arrowW, rect.size.height)];
    [[UIColor whiteColor] setFill];
    [path fill];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

//设置不要渲染图片
+ (UIImage *)renderImageWithNamed:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

//64位编码转图片
+ (UIImage *)imageWithBase64:(NSString *)encode {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:encode options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *image = [UIImage imageWithData:data];
    return image;
}

//图片64位编码
- (NSString *)base64 {
    NSData *data = UIImageJPEGRepresentation(self, 1.0);
    return [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize {
    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    
    if (CGSizeEqualToSize(imageSize, targetSize) == NO) {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        scaleFactor = widthFactor > heightFactor ? widthFactor : heightFactor;
        scaledWidth= width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        if (widthFactor > heightFactor) {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        } else if (widthFactor < heightFactor) {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContext(targetSize); // this will crop
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width= scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil) {
        NSLog(@"could not scale image");
    }
    
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage*)circleImage {
    UIGraphicsBeginImageContext(self.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2);
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    CGRect rect = CGRectMake(0, 0, self.size.width , self.size.height );
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    
    [self drawInRect:rect];
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
}

@end
