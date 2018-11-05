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

/**
 *  计算decimalNumber + otherDecimailNumber
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber sumOtherDecimalNumber:(id)otherDecimailNumber {
    NSDecimalNumber *number = [NSDecimalNumber formatParam:decimalNumber];
    NSDecimalNumber *otherNumber = [NSDecimalNumber formatParam:otherDecimailNumber];
    return [otherNumber decimalNumberByAdding:number];
}

/**
 *  计算decimalNumber - otherDecimalNumber
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber subtractOtherDecimalNumber:(id)otherDecimalNumber {
    NSDecimalNumber *number = [NSDecimalNumber formatParam:decimalNumber];
    NSDecimalNumber *otherNumber = [NSDecimalNumber formatParam:otherDecimalNumber];
    return [number decimalNumberBySubtracting:otherNumber];
}

/**
 *  计算decimalNumber * otherDecimalNumber
 */
+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber multiplyOtherDecimalNumber:(id)otherDecimalNumber {
    NSDecimalNumber *number = [NSDecimalNumber formatParam:decimalNumber];
    NSDecimalNumber *otherNumber = [NSDecimalNumber formatParam:otherDecimalNumber];
    return [number decimalNumberByMultiplyingBy:otherNumber];
}

/**
 *  计算decimalNumber / otherDecimalNumber
 */
//+ (NSDecimalNumber *)czq_decimalNumber:(id)decimalNumber divideOtherDecimalNumber:(id)otherDecimalNumber {
//    NSDecimalNumber *number = [NSDecimalNumber formatParam:decimalNumber];
//    NSDecimalNumber *otherNumber = [NSDecimalNumber formatParam:otherDecimalNumber];
//    if ([NSDecimalNumber isA:otherDecimalNumber equalToB:@"0"]) {
//        return nil;
//    }
//
//    return [numberA decimalNumberByDividingBy:numberB];
//}

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
                number = @"0";
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
