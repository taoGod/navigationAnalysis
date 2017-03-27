//
//  DateTool.h
//  YouLiangTest
//
//  Created by juliu on 16/10/11.
//  Copyright © 2016年 juliu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateTool : NSObject

+ (instancetype)sharedTool;

/**
 *  获取系统当前时间
 */
- (NSString *)getCurrentTime;

/**
 *  dateFormat
 *
 *  @param dateFormat 格式化字符串
 */
- (NSString*)dateStringWithFormater:(NSString *)dateFormat;

@end
