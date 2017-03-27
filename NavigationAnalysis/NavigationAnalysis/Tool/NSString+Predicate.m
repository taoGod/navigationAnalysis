//
//  NSString+Predicate.m
//  YouLiang
//
//  Created by juliu on 16/10/27.
//  Copyright © 2016年 juliu. All rights reserved.
//

#import "NSString+Predicate.h"

@implementation NSString (Predicate)

- (BOOL)predicatePhoneNumber {
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^1(3[0-9]|4[57]|5[0-35-9]|7[0135678]|8[0-9])\\d{8}$"];
    return [regexTest evaluateWithObject:self];
}

- (NSString *)predicatePhoneOperation {
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^1(3[4-9]|4[7]|5[0-27-9]|7[08]|8[2-478])\\d{8}$"];
    if ([regexTest evaluateWithObject:self]) {
        return @"cm";
    }
    regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^1(3[0-2]|4[5]|5[56]|7[0156]|8[56])\\d{8}$"];
    if ([regexTest evaluateWithObject:self]) {
        return @"cu";
    }
    regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^1(3[3]|4[9]|53|7[037]|8[019])\\d{8}$"];
    if ([regexTest evaluateWithObject:self]) {
        return @"ct";
    } else {
        return @"none";
    }
}

- (BOOL)predicatePassword {
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"[a-zA-Z0-9]{6,12}"];
    return [regexTest evaluateWithObject:self];
}

//- (BOOL)predicateNumber {
//    
//    return false;
//}
//
//- (BOOL)predicateDecimal {
//    
//    return false;
//}
//
//- (BOOL)predicateAlphabet {
//    
//    return false;
//}
//
//- (BOOL)predicateNumberAndAlphabet {
//    
//    return false;
//}
//
//- (BOOL)predicateIDCard {
//    
//    return false;
//}
//
//- (BOOL)predicateCustom {
//    
//    return false;
//}

@end
