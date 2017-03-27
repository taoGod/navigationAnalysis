//
//  NetworkTool.m
//  YouLiangTest
//
//  Created by juliu on 16/10/9.
//  Copyright © 2016年 juliu. All rights reserved.
//

#import "NetworkTool.h"

#define kApiBaseUrl @""

@implementation NetworkTool

static NetworkTool *networkTool;

+ (instancetype)sharedNetworkTool{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        networkTool = [[self alloc] initWithBaseURL:[NSURL URLWithString:kApiBaseUrl] sessionConfiguration:configuration];
        
        networkTool.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript", nil];
    });
    
    return networkTool;
}
@end
