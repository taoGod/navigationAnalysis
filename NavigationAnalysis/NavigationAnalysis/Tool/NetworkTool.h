//
//  NetworkTool.h
//  YouLiangTest
//
//  Created by juliu on 16/10/9.
//  Copyright © 2016年 juliu. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface NetworkTool : AFHTTPSessionManager

+ (instancetype)sharedNetworkTool;

@end
