//
//  DeviceTool.h
//  YouLiang
//
//  Created by juliu on 16/10/19.
//  Copyright © 2016年 juliu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceTool : NSObject

+ (instancetype)sharedTool;

//获取设备所有者的名称
- (NSString *)getDeviceName;
//获取设备的类别
- (NSString *)getDeviceModel;
//获取本地化版本
- (NSString *)getDeviceType;
//获取当前运行的系统
- (NSString *)getDeviceSystemName;
//获取当前系统的版本
- (NSString *)getDeviceSystemVersion;
//获取设备的唯一标示符
- (NSString *)getDeviceIdentifier;
- (BOOL)deleteDeviceIdentifier;

//前端展示设备的唯一标示符
- (NSString *)displayDeviceID;

@end
