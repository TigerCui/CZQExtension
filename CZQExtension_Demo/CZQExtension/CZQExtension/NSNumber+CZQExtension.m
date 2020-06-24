//
//  NSNumber+CZQExtension.m
//  CZQExtension
//
//  Created by 崔正清 on 2020/6/24.
//  Copyright © 2020 cuizhengqing. All rights reserved.
//

#import "NSNumber+CZQExtension.h"
#import "YYCategories.h"

@implementation NSNumber (CZQExtension)

/**
 *  判断数字是否为int类型
 *  @return YES是int NO不是int
 */
- (BOOL)czq_isPureInt {
    NSString *str = [NSString stringWithFormat:@"%@",self];
    if ([str containsString:@"."]) {
        return NO;
    }
    NSScanner* scan = [NSScanner scannerWithString:str];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

/**
 *  判断数字字符串是否为int类型
 *  @param  string  数字字符串
 *  @return YES是int NO不是int
 */
+ (BOOL)czq_isStringPureInt:(NSString *)string {
    NSNumber *number = [NSNumber numberWithString:string];
    return [number czq_isPureInt];
}

/**
 *  判断数字是否为float类型
 *  @return YES是float   NO不是float
 */
- (BOOL)czq_isPureFloat {
    NSString *str = [NSString stringWithFormat:@"%@",self];
    if (![str containsString:@"."]) {
        return NO;
    }
    NSScanner* scan = [NSScanner scannerWithString:str];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

/**
 *  判断数字字符串是否为float类型
 *  @param  string  数字字符串
 *  @return YES是float NO不是float
 */
+ (BOOL)czq_isStringPureFloat:(NSString *)string {
    NSNumber *number = [NSNumber numberWithString:string];
    return [number czq_isPureFloat];
}

/**
 *  判断数字是否为double类型
 *  @return YES是double  NO不是double
 */
- (BOOL)czq_isPureDouble {
    NSString *str = [NSString stringWithFormat:@"%@",self];
    if (![str containsString:@"."]) {
        return NO;
    }
    NSScanner* scan = [NSScanner scannerWithString:str];
    double val;
    return[scan scanDouble:&val] && [scan isAtEnd];
}

/**
 *  判断数字字符串是否为double类型
 *  @param  string  数字字符串
 *  @return YES是double  NO不是double
 */
+ (BOOL)czq_isStringPureDouble:(NSString *)string {
    NSNumber *number = [NSNumber numberWithString:string];
    return [number czq_isPureDouble];
}

/**
 *  判断数字是否为integer类型
 *  @return YES是integer NO不是integer
 */
- (BOOL)czq_isPureInteger {
    NSString *str = [NSString stringWithFormat:@"%@",self];
    if ([str containsString:@"."]) {
        return NO;
    }
    NSScanner* scan = [NSScanner scannerWithString:str];
    NSInteger val;
    return[scan scanInteger:&val] && [scan isAtEnd];
}

/**
 *  判断数字字符串是否为integer类型
 *  @return YES是integer NO不是integer
 */
- (BOOL)czq_isStringPureInteger:(NSString *)string {
    NSNumber *number = [NSNumber numberWithString:string];
    return [number czq_isPureInteger];
}

@end
