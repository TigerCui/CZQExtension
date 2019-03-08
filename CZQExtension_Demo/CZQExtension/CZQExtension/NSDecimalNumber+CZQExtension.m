//
//  NSDecimalNumber+CZQExtension.m
//  CZQExtension
//
//  Created by 崔正清 on 2018/11/5.
//  Copyright © 2018年 cuizhengqing. All rights reserved.
//

#import "NSDecimalNumber+CZQExtension.h"
#import "NSString+CZQExtension.h"

@implementation NSDecimalNumber (CZQExtension)

#pragma mark - 四则运算(+,-,*,/)
/**
 *  计算decimalNumber + otherDecimailNumber
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber sumDecimalNumber:(id)otherDecimailNumber {
    NSDecimalNumber *number = [NSDecimalNumber formatParam:decimalNumber];
    NSDecimalNumber *otherNumber = [NSDecimalNumber formatParam:otherDecimailNumber];
    return [otherNumber decimalNumberByAdding:number];
}

/**
 *  计算decimalNumber - otherDecimalNumber
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber subtractDecimalNumber:(id)otherDecimalNumber; {
    NSDecimalNumber *number = [NSDecimalNumber formatParam:decimalNumber];
    NSDecimalNumber *otherNumber = [NSDecimalNumber formatParam:otherDecimalNumber];
    return [number decimalNumberBySubtracting:otherNumber];
}

/**
 *  计算decimalNumber * otherDecimalNumber
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber multiplyDecimalNumber:(id)otherDecimalNumber; {
    NSDecimalNumber *number = [NSDecimalNumber formatParam:decimalNumber];
    NSDecimalNumber *otherNumber = [NSDecimalNumber formatParam:otherDecimalNumber];
    return [number decimalNumberByMultiplyingBy:otherNumber];
}

/**
 *  计算decimalNumber / otherDecimalNumber
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber divideDecimalNumber:(id)otherDecimalNumber; {
    NSDecimalNumber *number = [NSDecimalNumber formatParam:decimalNumber];
    NSDecimalNumber *otherNumber = [NSDecimalNumber formatParam:otherDecimalNumber];
    if ([NSDecimalNumber czq_decimalNumber:otherNumber isEqualToDecimalNumber:@"0"]) {
        return nil;
    }

    return [number decimalNumberByDividingBy:otherNumber];
}

#pragma mark - 判断大小
/**
 *  判断decimalNumber是否等于otherDecimalNumber
 *  @return YES相等   NO不等
 */
+ (BOOL)czq_decimalNumber:(id)decimalNumber isEqualToDecimalNumber:(id)otherDecimalNumber {
    NSDecimalNumber *number = [NSDecimalNumber formatParam:decimalNumber];
    NSDecimalNumber *otherNumber = [NSDecimalNumber formatParam:otherDecimalNumber];
    if ([number compare:otherNumber] == kCFCompareEqualTo) {
        return YES;
    } else {
        return NO;
    }
}

/**
 *  判断decimalNumber是否大于otherDecimalNumber
 *  @return YES大于   NO不大于
 */
+ (BOOL)czq_decimalNumber:(id)decimalNumber isGreaterThanDecimalNumber:(id)otherDecimalNumber {
    NSDecimalNumber *number = [NSDecimalNumber formatParam:decimalNumber];
    NSDecimalNumber *otherNumber = [NSDecimalNumber formatParam:otherDecimalNumber];
    if ([number compare:otherNumber] == kCFCompareGreaterThan) {
        return YES;
    } else {
        return NO;
    }
}

/**
 *  判断decimalNumber是否小于otherDecimalNumber
 *  @return YES小于   NO不小于
 */
+ (BOOL)czq_decimalNumber:(id)decimalNumber isLessThanDecimalNumber:(id)otherDecimalNumber {
    NSDecimalNumber *number = [NSDecimalNumber formatParam:decimalNumber];
    NSDecimalNumber *otherNumber = [NSDecimalNumber formatParam:otherDecimalNumber];
    if ([number compare:otherNumber] == kCFCompareLessThan) {
        return YES;
    } else {
        return NO;
    }
}

/**
 *  判断大小
 *  NSOrderedSame           相等
 *  NSOrderedDescending     decimalNumber大于otherDecimalNumber
 *  NSOrderedAscending      decimalNumber小于otherDecimalNumber
 */
+ (NSComparisonResult)czq_decimalNumber:(id)decimalNumber compareWithDecimalNumber:(id)otherDecimalNumber {
    if ([NSDecimalNumber czq_decimalNumber:decimalNumber isEqualToDecimalNumber:otherDecimalNumber]) {
        return NSOrderedSame;//等于
    } else if ([NSDecimalNumber czq_decimalNumber:decimalNumber isGreaterThanDecimalNumber:otherDecimalNumber]) {
        return NSOrderedDescending;//大于
    } else if ([NSDecimalNumber czq_decimalNumber:decimalNumber isLessThanDecimalNumber:otherDecimalNumber]) {
        return NSOrderedAscending;//小于
    } else {
        NSCAssert(YES, @"无法判断");
        return 2;
    }
}

#pragma mark - 小数点控制
/**
 *  小数最后一位舍去
 *  scale   要保留的小数位数
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber roundDownWithScale:(short)scale {
    NSDecimalNumber *oldNumber = [NSDecimalNumber formatParam:decimalNumber];
    NSDecimalNumberHandler *handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:scale raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    NSDecimalNumber *num = [NSDecimalNumber zero];
    NSDecimalNumber *newNumber = [oldNumber decimalNumberByAdding:num withBehavior:handler];
    return newNumber;
}

/**
 *  小数最后一位四舍五入
 *  scale   要保留的小数位数
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber roundPlainWithScale:(short)scale {
    NSDecimalNumber *oldNumber = [NSDecimalNumber formatParam:decimalNumber];
    NSDecimalNumberHandler *handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:scale raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    NSDecimalNumber *num = [NSDecimalNumber zero];
    NSDecimalNumber *newNumber = [oldNumber decimalNumberByAdding:num withBehavior:handler];
    return newNumber;
}

/**
 *  小数最后一位向上取整
 *  @param scale 小数点后保留的位数
 *  2.35->2.4   2.32->2.4
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber roundUpWithScale:(short)scale {
    NSDecimalNumber *oldNumber = [NSDecimalNumber formatParam:decimalNumber];
    NSDecimalNumberHandler *handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundUp scale:scale raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    NSDecimalNumber *num = [NSDecimalNumber zero];
    NSDecimalNumber *newNumber = [oldNumber decimalNumberByAdding:num withBehavior:handler];
    return newNumber;
}

#pragma mark - 正负值转换
/**
 *  将数字转换为正数
 */
+ (NSDecimalNumber *)czq_decimalNumberToPositiveNumber:(id)decimalNumber {
    NSDecimalNumber *n = [NSDecimalNumber formatParam:decimalNumber];
    if ([NSDecimalNumber czq_decimalNumber:n isLessThanDecimalNumber:@"0"]) {
        n = [NSDecimalNumber czq_decimalNumber:n multiplyDecimalNumber:@"-1"];
    }
    return n;
}

/**
 *  将数字转为负数
 */
+ (NSDecimalNumber *)czq_decimalNumberToNegativeNumber:(id)decimalNumber {
    NSDecimalNumber *n = [NSDecimalNumber formatParam:decimalNumber];
    if ([NSDecimalNumber czq_decimalNumber:n isGreaterThanDecimalNumber:@"0"]) {
        n = [NSDecimalNumber czq_decimalNumber:n multiplyDecimalNumber:@"-1"];
    }
    return n;
}

#pragma mark - 格式化数据
+ (NSDecimalNumber *)formatParam:(id)param {
    NSString *number;
    if (!param) {
        number = @"0";
    }
    if ([param isKindOfClass:[NSString class]]) {
        if ([NSString czq_isBlankString:param]) {
            number = @"0";
        } else {
            if (![param czq_isPureNumber]) {
                NSCAssert(YES, ([NSString stringWithFormat:@"%@不是数字",param]));
            }
        }
    } else if([param isKindOfClass:[NSNumber class]]) {
        if ([(NSNumber *)param isEqualToNumber:NSDecimalNumber.notANumber]) {
            number = @"0";
        }
    } else if([param isKindOfClass:[NSDecimalNumber class]]) {
        if ([(NSDecimalNumber *)param isEqualToNumber:NSDecimalNumber.notANumber]) {
            number = @"0";
        }
    } else {
        number = @"0";
    }
    number = [NSString stringWithFormat:@"%@",param];
    return [NSDecimalNumber decimalNumberWithString:number];
}

@end
