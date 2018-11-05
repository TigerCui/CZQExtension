//
//  NSString+CZQExtension.m
//  CZQExtension
//
//  Created by 崔正清 on 2018/11/5.
//  Copyright © 2018年 cuizhengqing. All rights reserved.
//

#import "NSString+CZQExtension.h"

@implementation NSString (CZQExtension)

/**
 *  判断是否为空字符串
 */
+ (BOOL)czq_isBlankString:(id)string {
    if (!string) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedStr = [string stringByTrimmingCharactersInSet:set];
    if (!trimmedStr.length) {
        return YES;
    }
    if ([string isEqualToString:@"null"] || [string isEqualToString:@"NULL"] || [NSString stringWithFormat:@"(NULL)"]) {
        return YES;
    }
    return NO;
}

/**
 *  判断字符串是否为int
 *  @return YES是int NO不是int
 */
- (BOOL)czq_isPureInt {
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

/**
 *  判断字符串是否是浮点数字
 *  @return YES是float   NO不是float
 */
- (BOOL)czq_isPureFloat {
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

/**
 *  判断字符串是否是double
 *  @return YES是double  NO不是double
 */
- (BOOL)czq_isPureDouble {
    NSScanner* scan = [NSScanner scannerWithString:self];
    double val;
    return[scan scanDouble:&val] && [scan isAtEnd];
}

/**
 *  判断字符串是否是integer
 *  @return YES是integer NO不是integer
 */
- (BOOL)czq_isPureInteger {
    NSScanner* scan = [NSScanner scannerWithString:self];
    NSInteger val;
    return[scan scanInteger:&val] && [scan isAtEnd];
}

/**
 *  判断字符串是否是数字
 *  @return YES是数字  NO不是数字
 */
- (BOOL)czq_isPureNumber {
    return [self czq_isPureInt] || [self czq_isPureFloat] || [self czq_isPureDouble] || [self czq_isPureInteger];
}

@end
