//
//  Module.h
//  Big_CoreAnimation
//
//  Created by juliu on 17/3/6.
//  Copyright © 2017年 juliu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Module : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *classStr;

+ (NSArray *)modules;

@end
