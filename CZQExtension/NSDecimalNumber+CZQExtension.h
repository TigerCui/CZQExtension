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
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber sumOtherDecimalNumber:(id)otherDecimailNumber;

/**
 *  计算decimalNumber - otherDecimalNumber
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber subtractOtherDecimalNumber:(id)otherDecimalNumber;

/**
 *  计算decimalNumber * otherDecimalNumber
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber multiplyOtherDecimalNumber:(id)otherDecimalNumber;

/**
 *  计算decimalNumber / otherDecimalNumber
 */
//+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber divideOtherDecimalNumber:(id)otherDecimalNumber;

@end

NS_ASSUME_NONNULL_END
