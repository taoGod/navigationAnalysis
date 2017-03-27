//
//  Module.m
//  Big_CoreAnimation
//
//  Created by juliu on 17/3/6.
//  Copyright © 2017年 juliu. All rights reserved.
//

#import "Module.h"

@implementation Module


+ (NSArray *)modules {
    NSString *file = [[NSBundle mainBundle] pathForResource:@"modules.json" ofType:nil];
    NSData *data = [[NSData alloc] initWithContentsOfFile:file];
    NSMutableArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:NULL];
    NSMutableArray *objs = [NSMutableArray arrayWithCapacity:arr.count];
    for (NSDictionary *dict in arr) {
        Module *obj = Module.new;
        for (NSString *key in dict.allKeys) {
            [obj setValue:dict[key] forKey:key];
        }
        [objs addObject:obj];
    }
    return objs;
}

@end
