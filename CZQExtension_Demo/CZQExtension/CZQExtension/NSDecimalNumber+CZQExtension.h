//
//  NSDecimalNumber+CZQExtension.h
//  CZQExtension
//
//  Created by 崔正清 on 2018/11/5.
//  Copyright © 2018年 cuizhengqing. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDecimalNumber (CZQExtension)

#pragma mark - 四则运算(+,-,*,/)
/**
 *  计算decimalNumber + otherDecimailNumber
 *  @param  decimalNumber   参与计算的数字(NSString或NSNumber)
 *  @param  otherDecimalNumber 参与计算的数字(NSString或NSNumber)
 *  @return 计算结果,有错误时返回nil
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber sumDecimalNumber:(id)otherDecimalNumber;

/**
 *  计算decimalNumber - otherDecimalNumber
 *  @param  decimalNumber   参与计算的数字(NSString或NSNumber)
 *  @param  otherDecimalNumber 参与计算的数字(NSString或NSNumber)
 *  @return 计算结果,有错误时返回nil
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber subtractDecimalNumber:(id)otherDecimalNumber;

/**
 *  计算decimalNumber * otherDecimalNumber
 *  @param  decimalNumber   参与计算的数字(NSString或NSNumber)
 *  @param  otherDecimalNumber 参与计算的数字(NSString或NSNumber)
 *  @return 计算结果,有错误时返回nil
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber multiplyDecimalNumber:(id)otherDecimalNumber;

/**
 *  计算decimalNumber / otherDecimalNumber
 *  @param  decimalNumber   参与计算的数字(NSString或NSNumber)
 *  @param  otherDecimalNumber 参与计算的数字(NSString或NSNumber)
 *  @return  计算结果,有错误时返回nil
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber divideDecimalNumber:(id)otherDecimalNumber;

#pragma mark - 判断大小
/**
 *  判断decimalNumber是否等于otherDecimalNumber
 *  @param  decimalNumber 参与计算的数字(NSString或NSNumber)
 *  @param  otherDecimalNumber 参与计算的数字(NSString或NSNumber)
 *  @return YES相等   NO不等
 */
+ (BOOL)czq_decimalNumber:(id)decimalNumber isEqualToDecimalNumber:(id)otherDecimalNumber;

/**
 *  判断decimalNumber是否大于otherDecimalNumber
 *  @param  decimalNumber 参与计算的数字(NSString或NSNumber)
 *  @param  otherDecimalNumber 参与计算的数字(NSString或NSNumber)
 *  @return YES大于   NO不大于
 */
+ (BOOL)czq_decimalNumber:(id)decimalNumber isGreaterThanDecimalNumber:(id)otherDecimalNumber;

/**
 *  判断decimalNumber是否小于otherDecimalNumber
 *  @param  decimalNumber 参与计算的数字(NSString或NSNumber)
 *  @param  otherDecimalNumber 参与计算的数字(NSString或NSNumber)
 *  @return YES小于   NO不小于
 */
+ (BOOL)czq_decimalNumber:(id)decimalNumber isLessThanDecimalNumber:(id)otherDecimalNumber;

/**
 *  判断大小
 *  @param  decimalNumber 参与计算的数字(NSString或NSNumber)
 *  @param  otherDecimalNumber 参与计算的数字(NSString或NSNumber)
 *  @return NSOrderedSame           相等
 *          NSOrderedDescending     decimalNumber大于otherDecimalNumber
 *          NSOrderedAscending      decimalNumber小于otherDecimalNumber
 */
+ (NSComparisonResult)czq_decimalNumber:(id)decimalNumber compareWithDecimalNumber:(id)otherDecimalNumber;

#pragma mark - 小数点控制
/**
 *  小数最后一位向下取整
 *  例子:2.35->2.3   2.32->2.3
 *  @param  decimalNumber   需要处理的数字(NSString或NSNumber)
 *  @param  scale  小数点后保留的位数
 *  @return 处理结果
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber roundDownWithScale:(short)scale;

/**
 *  小数最后一位四舍五入
 *  例子:2.35->2.4   2.32->2.3
 *  @param  decimalNumber   需要处理的数字(NSString或NSNumber)
 *  @param scale 小数点后保留的位数
 *  @return 处理结果
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber roundPlainWithScale:(short)scale;

/**
 *  小数最后一位向上取整
 *  例子:2.35->2.4   2.32->2.4
 *  @param  decimalNumber   需要处理的数字(NSString或NSNumber)
 *  @param scale 小数点后保留的位数
 *  @return 处理结果
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber roundUpWithScale:(short)scale;

#pragma mark - 正负值转换
/**
 *  将数字转换为正数
 *  例子:-1->1    1->1
 *  @param  decimalNumber   需要处理的数字(NSString或NSNumber)
 *  @return 处理结果
 */
+ (NSDecimalNumber *)czq_decimalNumberToPositiveNumber:(id)decimalNumber;

/**
 *  将数字转为负数
 *  例子:1->-1    -1->-1
 *  @param  decimalNumber   需要处理的数字(NSString或NSNumber)
 *  @return 处理结果
 */
+ (NSDecimalNumber *)czq_decimalNumberToNegativeNumber:(id)decimalNumber;

@end

