//
//  CZQNumberLimit.h
//  CZQExtension
//
//  Created by 崔正清 on 2020/6/22.
//  Copyright © 2020 cuizhengqing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CZQNumberLimit : NSObject

/**
 *  是否支持负数
 *  nil     不支持负数,不能输入"-"
 *  @"0"    不支持负数,不能输入"-"
 *  @"1"    支持负数,可以输入"-",且只能输在最前面
 */
@property (nonatomic, strong) NSNumber *isSupportNegative;
/**
 *  是否支持小数
 *  nil     不支持小数,不能输入"."
 *  @"0"    不支持小数,不能输入"."
 *  @"1"    支持小数,可以输入".",且只能输入一个
 */
@property (nonatomic, strong) NSNumber *isSupportDecimal;
/**
 *  限制最大值
 */
@property (nonatomic, strong) NSNumber *maxValue;
/**
 *  限制最小值
 */
@property (nonatomic, strong) NSNumber *minValue;
/**
 *  限制整数位长度
 */
@property (nonatomic, strong) NSNumber *integerLength;
/**
 *  限制小数位长度
 */
@property (nonatomic, strong) NSNumber *decimalLength;

@end

NS_ASSUME_NONNULL_END
