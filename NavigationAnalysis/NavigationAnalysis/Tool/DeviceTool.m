//
//  DeviceTool.m
//  YouLiang
//
//  Created by juliu on 16/10/19.
//  Copyright © 2016年 juliu. All rights reserved.
//

#import "DeviceTool.h"
#import <UIKit/UIKit.h>

@implementation DeviceTool

static DeviceTool *deviceTool;

+ (instancetype)sharedTool {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deviceTool = [[self alloc] init];
    });
    return deviceTool;
}

//获取设备所有者的名称
- (NSString *)getDeviceName {
    
    UIDevice *device = [UIDevice currentDevice];
    
    return device.name;
}

//获取设备的类别
- (NSString *)getDeviceModel {
    
    UIDevice *device = [UIDevice currentDevice];
    
    return device.model;
}

//获取本地化版本
- (NSString *)getDeviceType {
    
    UIDevice *device = [UIDevice currentDevice];
    
    return device.localizedModel;
}

//获取当前运行的系统
- (NSString *)getDeviceSystemName {
    
    UIDevice *device = [UIDevice currentDevice];
    
    return device.systemName;
}

//获取当前系统的版本
- (NSString *)getDeviceSystemVersion {
    
    UIDevice *device = [UIDevice currentDevice];
    
    return device.systemVersion;
}

/*
//获取设备的唯一标示符
- (NSString *)getDeviceIdentifier {
    NSString *currentDeviceUUIDStr = [SSKeychain passwordForService:@"com.juliu.YouLiang" account:@"uuid"];
    if (currentDeviceUUIDStr == nil || [currentDeviceUUIDStr isEqualToString:@""]) {
        currentDeviceUUIDStr = [UIDevice currentDevice].identifierForVendor.UUIDString;
        // JPush 里的别名不能包括 - 等特殊字符
        currentDeviceUUIDStr = [currentDeviceUUIDStr stringByReplacingOccurrencesOfString:@"-" withString:@""];
        currentDeviceUUIDStr = [currentDeviceUUIDStr lowercaseString];
        [SSKeychain setPassword:currentDeviceUUIDStr forService:@"com.juliu.YouLiang" account:@"uuid"];
    }
    return currentDeviceUUIDStr;
}

- (BOOL)deleteDeviceIdentifier {
    return [SSKeychain deletePasswordForService:@"com.juliu.YouLiang" account:@"uuid"];
}
 */

//前端展示设备的唯一标示符
- (NSString *)displayDeviceID {
    
    return [NSString stringWithFormat:@"%@****%@",[[self getDeviceIdentifier] substringToIndex:3],[[self getDeviceIdentifier] substringFromIndex:[[self getDeviceIdentifier] length] - 3]];
}

@end
