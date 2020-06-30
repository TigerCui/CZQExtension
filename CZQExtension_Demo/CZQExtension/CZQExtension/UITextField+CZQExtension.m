//
//  UITextField+CZQExtension.m
//  CZQExtension
//
//  Created by 崔正清 on 2020/6/20.
//  Copyright © 2020 cuizhengqing. All rights reserved.
//

#import "UITextField+CZQExtension.h"
#import "NSString+CZQExtension.h"
#import "NSNumber+CZQExtension.h"
#import "NSDecimalNumber+CZQExtension.h"
#import "CZQNumberLimit.h"

@implementation UITextField (CZQExtension)

/**
 *  输入框限制逻辑
 *  此方法一般在textField的- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string代理方法中实现
 *  1.根据length参数限制输入的字符串长度
 *  2.根据limitCharacters参数限制不能输入的字符
 *  3.当numberLimit不为空时,要求限制数据为数字,根据numberLimit中的限制条件校验数字,当校验条件与1和2中的条件冲突时,优先执行1和2的限制条件
 *  @param  textField       textField控件
 *  @param  range           字符位置
 *  @param  replace         当次输入的字符
 *  @param  limitCharacters 要限制的字符,为空则不限制
 *  @param  numberLimit     数字限制条件 为空不做特殊限制
 */
+ (BOOL)czq_textField:(UITextField *)textField
                range:(NSRange)range
    replacementString:(NSString *)replace
      limitCharacters:(NSArray <NSString *> * _Nullable)limitCharacters
          numberLimit:(CZQNumberLimit * _Nullable)numberLimit {
    if (!replace.length) {
        return YES;
    }
    if (limitCharacters.count) {
        if ([limitCharacters containsObject:replace]) {
            //限制自定义字符
            return NO;
        }
    }
    if (numberLimit) {
        //限制数字
        if (numberLimit.isSupportNegative.integerValue) {
            //可以为负数
            // 负号只能在0位置输入一次
            if ([replace isEqualToString:@"-"]) {
                if (range.location != 0) {
                    return NO;
                }
                if ([textField.text rangeOfString:@"-"].location != NSNotFound) {
                    return NO;
                }
            }
        } else {
            //不可为负数
            if ([replace isEqualToString:@"-"]) {
                return NO;
            }
        }
        
        //限制小数点
        if (numberLimit.isSupportDecimal.integerValue) {
            //可以为小数
            //小数点只能输入一次,当最开始录入的是小数点,或在接在负号后面时需要补0
            if ([replace isEqualToString:@"."]) {
                if ([textField.text containsString:@"."]) {
                    return NO;
                }
                if (textField.text.length == 0) {
                    textField.text = @"0";
                }
                if ([textField.text isEqualToString:@"-"]) {
                    textField.text = @"-0";
                }
            }
        } else {
            if ([replace isEqualToString:@"."]) {
                return NO;
            }
        }
        
        //限制0的输入
        if ([replace isEqualToString:@"0"]) {
            if ([textField.text hasSuffix:@"."]) {
                return YES;
            }
            if ([textField.text hasPrefix:@"0"] || [textField.text hasPrefix:@"-0"]) {
                return NO;
            }
        }
        
        //判断是否为数字
        NSString *numberStr;
        if (numberLimit.isSupportNegative.integerValue) {
            numberStr = [replace stringByReplacingOccurrencesOfString:@"-" withString:@""];
        } else {
            numberStr = replace;
        }
        if (numberLimit.isSupportDecimal.integerValue) {
            numberStr = [numberStr stringByReplacingOccurrencesOfString:@"." withString:@""];
        }
        if (numberStr.length) {
            if (![NSNumber czq_isStringPureInt:numberStr]) {
                return NO;
            }
        }
        
        //构造输入后的文字
        NSMutableString *tempStr = [NSMutableString stringWithString:textField.text];
        [tempStr insertString:replace atIndex:range.location];
        NSString *inputString = tempStr.copy;
        
        //判断最大值和最小值
        if (numberLimit.maxValue) {
            if ([NSDecimalNumber czq_decimalNumber:inputString isGreaterThanDecimalNumber:numberLimit.maxValue]) {
                return NO;
            };
        }
        if (numberLimit.minValue) {
            if ([NSDecimalNumber czq_decimalNumber:inputString isLessThanDecimalNumber:numberLimit.minValue]) {
                return NO;
            }
        }
        
        //判断整数位数与小数的位数
        if (numberLimit.integerLength) {
            if (numberLimit.isSupportDecimal.integerValue) {
                //支持小数点
                if (numberLimit.isSupportNegative.integerValue) {
                    //支持负数
                    inputString = [inputString stringByReplacingOccurrencesOfString:@"-" withString:@""];
                }
                if (![inputString containsString:@"."]) {
                    //没有输入小数点,则属于整数位
                    if (inputString.length >= numberLimit.integerLength.integerValue) {
                        return NO;
                    }
                }
            }
        }
        if (numberLimit.decimalLength) {
            if (numberLimit.isSupportDecimal.integerValue) {
                //支持小数点
                if (numberLimit.isSupportNegative.integerValue) {
                    //支持负数
                    inputString = [inputString stringByReplacingOccurrencesOfString:@"-" withString:@""];
                }
                if ([inputString containsString:@"."]) {
                    //输入了小数点
                    //将字符串根据小数点拆分为两个字符串
                    NSArray <NSString *> *subString = [inputString componentsSeparatedByString:@"."];
                    if (subString.count == 2) {
                        NSString *decimalStr = subString.lastObject;
                        if (decimalStr.length > numberLimit.decimalLength.integerValue) {
                            return NO;
                        }
                    }
                }
            }
        }
        
    }
    return YES;
}

@end
