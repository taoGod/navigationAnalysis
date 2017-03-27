//
//  UIViewController+Swizzling.m
//  NavigationAnalysis
//
//  Created by juliu on 17/3/16.
//  Copyright © 2017年 juliu. All rights reserved.
//

#import "UIViewController+Swizzling.h"
#import <objc/runtime.h>

typedef void (*_VIMP)(id, SEL, ...);

@implementation UIViewController (Swizzling)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 方式一
        SEL s1 = @selector(viewDidLoad);
        SEL s2 = @selector(viewDidLoad_swizzling);
        Method m1 = class_getInstanceMethod(self, s1);
        Method m2 = class_getInstanceMethod(self, s2);
        BOOL success = class_addMethod(self, s1, method_getImplementation(m2), method_getTypeEncoding(m2));
        if (success){
            class_replaceMethod(self, s2, method_getImplementation(m1), method_getTypeEncoding(m1));
        } else {
            method_exchangeImplementations(m1, m2);
        }
        
        /* 方式二。 
         * 需要修改Enable Strict checking of objc_msgSend calls的方式，因为IMP没有参数。感觉可以重新定义，就不用修改方式了。
         * 需要重新定义一个_VIMP，处理无返回值的方法实现。IMP是有返回值的
         */
//        Method viewDidLoad = class_getInstanceMethod(self, @selector(viewDidLoad));
//        _VIMP viewDidLoad_imp = (_VIMP)method_getImplementation(viewDidLoad);
//        method_setImplementation(viewDidLoad, imp_implementationWithBlock(^(id target, SEL action) {
//            viewDidLoad_imp(target, @selector(viewDidLoad));
//            NSLog(@"viewDidLoad_swizzling -- %@ 调用了 %s", self, _cmd);
//        }));
        
    });
}

- (void)viewDidLoad_swizzling {
    [self viewDidLoad_swizzling];
    
//    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"viewDidLoad_swizzling -- %@ 调用了 %s", self, _cmd);
}

@end
