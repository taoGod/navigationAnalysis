//
//  UIView+Emitter.h
//  YouLiang
//
//  Created by juliu on 16/12/19.
//  Copyright © 2016年 juliu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Emitter)

@property (nonatomic, strong) CAEmitterLayer *loveLayer;
@property (nonatomic, strong) CAEmitterLayer *snowLayer;

@property (nonatomic, strong) CAEmitterLayer *btnLayer1;

- (void)startEmitterLove;
- (void)stopEmitterLove;

- (void)startEmitterSnow;
- (void)stopEmitterSnow;

- (void)startEmitterButton1;
- (void)stopEmitterButton1;

@end
