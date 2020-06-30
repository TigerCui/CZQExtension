//
//  UITextField+CZQExtension.h
//  CZQExtension
//
//  Created by 崔正清 on 2020/6/20.
//  Copyright © 2020 cuizhengqing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZQNumberLimit;

NS_ASSUME_NONNULL_BEGIN


@interface UITextField (CZQExtension)

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
    replacementString:(NSString  *)replace
      limitCharacters:(NSArray <NSString *>  * _Nullable )limitCharacters
          numberLimit:(CZQNumberLimit * _Nullable )numberLimit;

/**
 *  限制字符串最长长度
 *  在UIControlEventEditingChanged事件中调用
 *  将超出限制的字符串截取到符合限制
 *  @param  length  要限制的长度
 *  @return 超出长度是返回error,否则返回nil
 */
- (NSError *)czq_limitLength:(NSUInteger)length;

@end

NS_ASSUME_NONNULL_END
