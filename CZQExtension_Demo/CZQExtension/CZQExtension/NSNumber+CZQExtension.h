//
//  NSNumber+CZQExtension.h
//  CZQExtension
//
//  Created by 崔正清 on 2020/6/24.
//  Copyright © 2020 cuizhengqing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (CZQExtension)

/**
 *  判断数字是否为int类型
 *  @return YES是int NO不是int
 */
- (BOOL)czq_isPureInt;

/**
 *  判断数字字符串是否为int类型
 *  @param  string  数字字符串
 *  @return YES是int NO不是int
 */
+ (BOOL)czq_isStringPureInt:(NSString *)string;

/**
 *  判断数字是否为float类型
 *  @return YES是float   NO不是float
 */
- (BOOL)czq_isPureFloat;

/**
 *  判断数字字符串是否为float类型
 *  @param  string  数字字符串
 *  @return YES是int NO不是int
 */
+ (BOOL)czq_isStringPureFloat:(NSString *)string;

/**
 *  判断数字是否为double类型
 *  @return YES是double  NO不是double
 */
- (BOOL)czq_isPureDouble;

/**
 *  判断数字字符串是否为double类型
 *  @param  string  数字字符串
 *  @return YES是double  NO不是double
 */
+ (BOOL)czq_isStringPureDouble:(NSString *)string;

/**
 *  判断数字是否为integer类型
 *  @return YES是integer NO不是integer
 */
- (BOOL)czq_isPureInteger;

/**
 *  判断数字字符串是否为integer类型
 *  @return YES是integer NO不是integer
 */
- (BOOL)czq_isStringPureInteger:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
