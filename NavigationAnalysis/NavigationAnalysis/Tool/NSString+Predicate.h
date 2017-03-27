//
//  NSString+Predicate.h
//  YouLiang
//
//  Created by juliu on 16/10/27.
//  Copyright © 2016年 juliu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Predicate)

/**
 *  断定为手机号
 */
- (BOOL)predicatePhoneNumber;

/**
 *  断定为手机号运营商.运营商 cm移动 cu联通 ct电信
 */
- (NSString *)predicatePhoneOperation;

/**
 *  断定为密码格式:6-12位数字+英文
 */
- (BOOL)predicatePassword;

/**
 *  断定为数字
 */
//- (BOOL)predicateNumber;
//
///**
// *  断定为小数
// */
//- (BOOL)predicateDecimal;
//
///**
// *  断定为英文字母
// */
//- (BOOL)predicateAlphabet;
//
///**
// *  断定为数字与英文字母
// */
//- (BOOL)predicateNumberAndAlphabet;
//
///**
// *  断定为身份证
// */
//- (BOOL)predicateIDCard;
//
///**
// *  自定义
// */
//- (BOOL)predicateCustom;

@end
