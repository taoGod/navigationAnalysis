//
//  DateTool.m
//  YouLiangTest
//
//  Created by juliu on 16/10/11.
//  Copyright © 2016年 juliu. All rights reserved.
//

#import "DateTool.h"

@implementation DateTool

static DateTool *dateTool;

+ (instancetype)sharedTool {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateTool = [[self alloc] init];
    });
    return dateTool;
}

- (NSString *)getCurrentTime {
    return [self dateStringWithFormater:@"yyyy-MM-dd HH:mm:ss"];
}

- (NSString*)dateStringWithFormater:(NSString *)dateFormat {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = dateFormat;
    return [formatter stringFromDate:[NSDate date]];
}

@end
