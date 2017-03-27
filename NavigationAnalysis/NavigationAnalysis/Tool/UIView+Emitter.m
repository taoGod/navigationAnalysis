//
//  UIView+Emitter.m
//  YouLiang
//
//  Created by juliu on 16/12/19.
//  Copyright © 2016年 juliu. All rights reserved.
//

#import "UIView+Emitter.h"
#import "UIImage+Tool.h"
#import <objc/runtime.h>

@interface UIView ()



@end

@implementation UIView (Emitter)

#pragma mark - love

- (void)startEmitterLove {
    if (!self.loveLayer) {
        CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
        //发射器发射点的位置
        emitterLayer.emitterPosition = CGPointMake(self.center.x, self.bounds.size.height);
        //发射源的大小,emitterMode= kCAEmitterLayerPoints看不出效果,因为发射源是一个点
        emitterLayer.emitterSize = self.bounds.size;
        //每秒粒子生成的数量,默认1,总数 = birthRate * emitterCells.count
        emitterLayer.birthRate = 1;
        //粒子运动的速度,默认1.0
        emitterLayer.velocity = 0.5;
        //粒子的缩放比例,默认1.0
        emitterLayer.scale = 1.0;
        //粒子的存活时间系数,为1时和粒子cell本身的时间相同,默认是1
        emitterLayer.lifetime = 1;
        
        //渲染模式
        //kCAEmitterLayerOldestFirst//这种模式下,声明久的粒子会被渲染在最上层
        //kCAEmitterLayerOldestLast//这种模式下,年轻的粒子会被渲染在最上层
        //kCAEmitterLayerBackToFront//这种模式下,粒子的渲染按照Z轴的前后顺序进行
        //kCAEmitterLayxerAdditive//叠加
        //kCAEmitterLayerUnordered//这种模式下,粒子层次是无序出现的,多个发射源将混合
        emitterLayer.renderMode = kCAEmitterLayerAdditive;
        
        //发射源形状,默认:kCAEmitterLayerPoint
        //kCAEmitterLayerPoint////点的形状，粒子从一个点发出
        //kCAEmitterLayerLine //线的形状，粒子从一条线发出
        //kCAEmitterLayerRectangle //矩形形状，粒子从一个矩形中发出,矩形有四条边
        //kCAEmitterLayerCuboid //立方体形状，会影响Z平面的效果
        //kCAEmitterLayerCircle //圆形，粒子会在圆形范围发射
        //kCAEmitterLayerSphere //3D球
        emitterLayer.emitterShape = kCAEmitterLayerRectangle;
        
        //粒子cell数组
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 1; i<6; i++) {
            CAEmitterCell *stepCell = [CAEmitterCell emitterCell];
            stepCell.name = [NSString stringWithFormat:@"good%@_30x30_",@(i)];
            stepCell.enabled = YES;//粒子是否被渲染
            
            //粒子的创建速率,默认:1/s
            stepCell.birthRate = 1;
            
            //缩放比例
            stepCell.scale = .4;
            //缩放容差 scale +- scaleRange;
            stepCell.scaleRange = 0.25;
            
            //旋转角度
            stepCell.spin = M_PI;
            //旋转容差
            stepCell.spinRange = M_PI / 4.0;
            
            //粒子存活时间,单位秒,它和CAEmitterLayer的lifetime单位是不一样的,CAEmitterLayer的单位是倍数
            stepCell.lifetime = arc4random_uniform(5) + 2;
            //粒子的生存时间容差,配上lifetime的随机数不至于显示效果是一起产生一起消失
            stepCell.lifetimeRange = 2.0;
            
            //粒子颜色,它是把contents渲染成什么颜色包括透明度,color的优先级要比contents高
            stepCell.color = [UIColor colorWithRed:arc4random_uniform(255)/255.0
                                             green:arc4random_uniform(255)/255.0
                                              blue:arc4random_uniform(255)/255.0
                                             alpha:0.5].CGColor;
            stepCell.redRange = 0.1;
            stepCell.blueRange = 0.1;
            stepCell.greenRange = 0.1;
            stepCell.alphaRange = 0.2;
            stepCell.alphaSpeed = -0.2;
            
            stepCell.contents = (__bridge id)[[UIImage imageNamed:stepCell.name] CGImage];
            
            // 粒子的运动速度,如果设成0,速度会很慢,具体这个是什么算法不知道,总之它是一个float值,看着感觉设就好了
            stepCell.velocity = arc4random_uniform(100) + 100;
            //如果 velocityRange太大的话就有可能 velocity - velocityRange为负值,这样发射方向就反了
            stepCell.velocityRange = 100;
            
            //粒子在xy平面的发射角度,默认值是三点钟方向,它和emissionLatitude的区别是什么?
            stepCell.emissionLongitude = M_PI + M_PI_2;
            //粒子发射角度的容差在,emissionLongitude的基础上扩展成一个弧形可以
            stepCell.emissionRange = M_PI_2 / 4;
            //发射的z轴方向的角度,默认0,M_PI_2会箭头朝屏幕里垂直屏幕发射
            stepCell.emissionLatitude = 0;
            
            //xyz轴上的加速度,用这三个属性可以做一个礼花弹爆炸的动画
            stepCell.xAcceleration = 1.0;
            stepCell.yAcceleration = 1.0;
            stepCell.zAcceleration = 1.0;
            
            [array addObject:stepCell];
        }
        
        emitterLayer.emitterCells = array;
        [self.layer addSublayer:emitterLayer];
        self.loveLayer = emitterLayer;
    }
}

- (void)stopEmitterLove {
    [self.loveLayer removeFromSuperlayer];
    self.loveLayer = nil;
}

static const char kLoveLayer = '\0';
- (void)setLoveLayer:(CAEmitterLayer *)loveLayer {
    if (self.loveLayer != loveLayer) {
        [self.loveLayer removeFromSuperlayer];
        [self.layer addSublayer:loveLayer];
        
        [self willChangeValueForKey:@"loveLayer"];
        objc_setAssociatedObject(self, &kLoveLayer, loveLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self didChangeValueForKey:@"loveLayer"];
    }
}

- (CAEmitterLayer *)loveLayer {
    return objc_getAssociatedObject(self, &kLoveLayer);
}

#pragma mark - snow

- (void)startEmitterSnow {
    NSLog(@"start layerSnow ---- %@", self.snowLayer);
    NSLog(@"start kSnowLayer ---- %zd", &kSnowLayer);
    NSLog(@"start !layerSnow ---- %d", !self.snowLayer);
    if (!self.snowLayer) {
        CAEmitterLayer *emitter = [[CAEmitterLayer alloc] init];
        emitter.frame = self.layer.bounds;
        emitter.emitterPosition = CGPointMake(self.bounds.size.width/2, 0); // 发射粒子的位置
        emitter.emitterSize = self.bounds.size;
        emitter.emitterShape = kCAEmitterLayerRectangle;
        
        CAEmitterCell *emitterCell = [[CAEmitterCell alloc] init];
        
        emitterCell.contents = (__bridge id _Nullable)([UIImage imageWithColor:[UIColor whiteColor] rect:CGRectMake(0, 0, 5, 5)].CGImage);
        emitterCell.birthRate = 120; // 每秒释放多少个粒子
        emitterCell.lifetime = 3.5;
        emitterCell.color = [UIColor whiteColor].CGColor;
        emitterCell.redRange = 0.0;
        emitterCell.blueRange = 0.1;
        emitterCell.greenRange = 0.0;
        emitterCell.alphaRange = 0.5;
        emitterCell.velocity = 9.8; // 重力加速度
        emitterCell.velocityRange = 350; // 加速范围
        emitterCell.emissionRange = M_PI_2 / 2; // 下落是旋转的角度
        emitterCell.emissionLongitude = - M_PI;
        emitterCell.yAcceleration = 70; // 发射速度
        emitterCell.xAcceleration = 0;
        emitterCell.scale = 0.33;
        emitterCell.scaleRange = 1.25;
        emitterCell.scaleSpeed = -0.25;
        emitterCell.alphaRange = 0.5;
        emitterCell.alphaSpeed = -0.15;
        
        emitter.emitterCells = @[emitterCell]; // 载入
        [self.layer addSublayer:emitter];
        self.snowLayer = emitter;
        NSLog(@"set layerSnow ---- %@", self.snowLayer);
        NSLog(@"set kSnowLayer ---- %zd", &kSnowLayer);
    }
}

- (void)stopEmitterSnow {
    [self.snowLayer removeFromSuperlayer];
    self.snowLayer = nil;
}

static const char kSnowLayer = '\0';
- (void)setSnowLayer:(CAEmitterLayer *)snowLayer {
    if (self.snowLayer != snowLayer) {
        [self.snowLayer removeFromSuperlayer];
        [self.layer addSublayer:snowLayer];
        
        [self willChangeValueForKey:@"snowLayer"];
        objc_setAssociatedObject(self, &kSnowLayer, snowLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self didChangeValueForKey:@"snowLayer"];
    }
}

- (CAEmitterLayer *)snowLayer {
    return objc_getAssociatedObject(self, &kSnowLayer);
}

#pragma mark - 按钮点击特效
- (void)startEmitterButton1 {
    if (!self.btnLayer1) {
        CAEmitterLayer *emitter = [[CAEmitterLayer alloc] init];
//        emitter.frame = self.layer.bounds;
        emitter.emitterSize = self.frame.size;
        emitter.emitterShape = kCAEmitterLayerCircle;
        emitter.emitterMode = kCAEmitterLayerOutline;
        emitter.emitterPosition = CGPointMake(self.frame.size.width /2.0, self.frame.size.height / 2.0);
        [self.layer addSublayer:emitter];
        
        CAEmitterCell *cell = [[CAEmitterCell alloc] init];
        [cell setName:@"btnEmitter1"];
        
        cell.contents = (__bridge id _Nullable)([UIImage imageWithColor:[UIColor blackColor]].circleImage.CGImage);
        cell.birthRate = 0;
        cell.lifetime = 0.4;
        cell.alphaSpeed = -2;
        cell.velocity = 20;
        cell.velocityRange = 20;
        
        emitter.emitterCells = @[cell];
        [self.layer addSublayer:emitter];
        self.btnLayer1 = emitter;
        
        CABasicAnimation *effectLayerAnimation=[CABasicAnimation animationWithKeyPath:@"emitterCells.btnEmitter1.birthRate"];
        [effectLayerAnimation setFromValue:[NSNumber numberWithFloat:1500]];
        [effectLayerAnimation setToValue:[NSNumber numberWithFloat:0]];
        [effectLayerAnimation setDuration:0.0f];
        [effectLayerAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
        [emitter addAnimation:effectLayerAnimation forKey:@"btnEmitter1"];
    } else {
        [self stopEmitterButton1];
    }
}

- (void)stopEmitterButton1 {
    [self.btnLayer1 removeAllAnimations];
    [self.btnLayer1 removeFromSuperlayer];
    self.btnLayer1 = nil;
}

static const char kBtnLayer1 = '\0';
- (void)setBtnLayer1:(CAEmitterLayer *)btnLayer1 {
    if (self.btnLayer1 != btnLayer1) {
        [self.btnLayer1 removeFromSuperlayer];
        [self.layer addSublayer:btnLayer1];
        
        [self willChangeValueForKey:@"btnLayer1"];
        objc_setAssociatedObject(self, &kBtnLayer1, btnLayer1, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self didChangeValueForKey:@"btnLayer1"];
    }
}

- (CAEmitterLayer *)btnLayer1 {
    return objc_getAssociatedObject(self, &kBtnLayer1);
}


@end
