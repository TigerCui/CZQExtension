//
//  NSDecimalNumber+CZQExtension.h
//  CZQExtension
//
//  Created by 崔正清 on 2018/11/5.
//  Copyright © 2018年 cuizhengqing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDecimalNumber (CZQExtension)

#pragma mark - 四则运算(+,-,*,/)
/**
 *  计算decimalNumber + otherDecimailNumber
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber sumDecimalNumber:(id)otherDecimailNumber;

/**
 *  计算decimalNumber - otherDecimalNumber
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber subtractDecimalNumber:(id)otherDecimalNumber;

/**
 *  计算decimalNumber * otherDecimalNumber
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber multiplyDecimalNumber:(id)otherDecimalNumber;

/**
 *  计算decimalNumber / otherDecimalNumber
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber divideDecimalNumber:(id)otherDecimalNumber;

#pragma mark - 判断大小
/**
 *  判断decimalNumber是否等于otherDecimalNumber
 *  @return YES相等   NO不等
 */
+ (BOOL)czq_decimalNumber:(id)decimalNumber isEqualToDecimalNumber:(id)otherDecimalNumber;

/**
 *  判断decimalNumber是否大于otherDecimalNumber
 *  @return YES大于   NO不大于
 */
+ (BOOL)czq_decimalNumber:(id)decimalNumber isGreaterThanDecimalNumber:(id)otherDecimalNumber;

/**
 *  判断decimalNumber是否小于otherDecimalNumber
 *  @return YES小于   NO不小于
 */
+ (BOOL)czq_decimalNumber:(id)decimalNumber isLessThanDecimalNumber:(id)otherDecimalNumber;

/**
 *  判断大小
 *  NSOrderedSame           相等
 *  NSOrderedDescending     decimalNumber大于otherDecimalNumber
 *  NSOrderedAscending      decimalNumber小于otherDecimalNumber
 */
+ (NSComparisonResult)czq_decimalNumber:(id)decimalNumber compareWithDecimalNumber:(id)otherDecimalNumber;

#pragma mark - 小数点控制
/**
 *  小数最后一位舍去
 *  scale   要保留的小数位数
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber roundDownWithScale:(short)scale;

/**
 *  小数最后一位四舍五入
 *  scale   要保留的小数位数
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber roundPlainWithScale:(short)scale;

#pragma mark - 正负值转换
/**
 *  将数字转换为正数
 */
+ (NSDecimalNumber *)czq_decimalNumberToPositiveNumber:(id)decimalNumber;

/**
 *  将数字转为负数
 */
+ (NSDecimalNumber *)czq_decimalNumberToNegativeNumber:(id)decimalNumber;

@end

NS_ASSUME_NONNULL_END
