//
//  UILabel+CZQExtension.m
//  CZQExtension
//
//  Created by 崔正清 on 2020/6/17.
//  Copyright © 2020 cuizhengqing. All rights reserved.
//

#import "UILabel+CZQExtension.h"

@implementation UILabel (CZQExtension)

+ (UILabel *)czq_labelWithFont:(UIFont *)font textColor:(UIColor *)textColor {
    UILabel *l = [UILabel new];
    font?(l.font = font):nil;
    textColor?(l.textColor = textColor):nil;
    return l;
}

@end
