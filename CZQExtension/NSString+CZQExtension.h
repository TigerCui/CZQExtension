//
//  NSString+CZQExtension.h
//  CZQExtension
//
//  Created by 崔正清 on 2018/11/5.
//  Copyright © 2018年 cuizhengqing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (CZQExtension)

#pragma mark - 判空
/**
 *  判断是否为空字符串
 *  @return YES是空字符串  NO不是空字符串
 */
+ (BOOL)czq_isBlankString:(id)string;

#pragma mark - 判断数字
/**
 *  判断字符串是否为int
 *  @return YES是int NO不是int
 */
- (BOOL)czq_isPureInt;

/**
 *  判断字符串是否是浮点数字
 *  @return YES是float   NO不是float
 */
- (BOOL)czq_isPureFloat;

/**
 *  判断字符串是否是double
 *  @return YES是double  NO不是double
 */
- (BOOL)czq_isPureDouble;

/**
 *  判断字符串是否是integer
 *  @return YES是integer NO不是integer
 */
- (BOOL)czq_isPureInteger;

/**
 *  判断字符串是否是数字
 *  @return YES是数字  NO不是数字
 */
- (BOOL)czq_isPureNumber;

@end

NS_ASSUME_NONNULL_END
