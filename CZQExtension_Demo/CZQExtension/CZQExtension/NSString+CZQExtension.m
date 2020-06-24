//
//  NSString+CZQExtension.m
//  CZQExtension
//
//  Created by 崔正清 on 2018/11/5.
//  Copyright © 2018年 cuizhengqing. All rights reserved.
//

#import "NSString+CZQExtension.h"
#import "CommonCrypto/CommonDigest.h"
#import "NSDecimalNumber+CZQExtension.h"

@implementation NSString (CZQExtension)
#pragma mark - 判空
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
    if ([string isEqualToString:@"null"] || [string isEqualToString:@"NULL"] || [string isEqualToString:@"(NULL)"]) {
        return YES;
    }
    return NO;
}

#pragma mark - 数字处理
/**
 *  四舍五入小数
 *  @param scale 小数点后保留的位数
 */
- (NSString *)czq_roundPlainWithScale:(short)scale {
    NSDecimalNumber *d = [NSDecimalNumber czq_decimalNumber:self roundPlainWithScale:scale];
    return [NSString stringWithFormat:@"%@",d];
}

/**
 *  小数最后一位向下取整
 *  @param scale  小数点后保留的位数
 *  2.35->2.3   2.32->2.3
 */
- (NSString *)czq_roundDownWithScale:(short)scale {
    NSDecimalNumber *d = [NSDecimalNumber czq_decimalNumber:self roundDownWithScale:scale];
    return [NSString stringWithFormat:@"%@",d];
}

/**
 *  小数最后一位向上取整
 *  @param scale 小数点后保留的位数
 *  2.35->2.4   2.32->2.4
 */
- (NSString *)czq_roundUpWithScale:(short)scale {
    NSDecimalNumber *d = [NSDecimalNumber czq_decimalNumber:self roundUpWithScale:scale];
    return [NSString stringWithFormat:@"%@",d];
}

/**
 *  裁减掉多余的0
 *  @return 裁剪后的数字字符串
 *  1.0->1  1.10->1.1
 */
//- (NSString *)czq_trimMoreZero {
//    if ([self czq_isPureNumber]) {
//        NSDecimalNumber *decimalNum = [NSDecimalNumber decimalNumberWithString:self];
//        return [NSString stringWithFormat:@"%@",decimalNum];
//    } else {
//        return nil;
//    }
//}

#pragma mark - 日期转换
/**
 *  将时间转换成字符串
 *  @param  date            要转换的date
 *  @param  format          日期格式
 */
+ (NSString *)czq_stringWithDate:(NSDate *)date format:(NSString *)format {
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [f setTimeZone:timeZone];
    [f setDateFormat:format];
    NSString *dateStr = [f stringFromDate:date];
    return dateStr;
}

/**
 *  字符串转date
 *  @param format  时间格式
 */
- (NSDate *)czq_stringToDateWithFormat:(NSString *)format {
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = format;
    return [f dateFromString:self];
}

/**
 *  时间戳字符串转换为时间字符串
 */
- (NSString *)czq_stringFromTimeStampStringWithFormat:(NSString *)format {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[self doubleValue]/1000];
    return [NSString czq_stringWithDate:date format:format];
}

/**
 *  时间字符串转换为时间戳字符串
 */
- (NSString *)czq_stringToTimeStampStringWithFormat:(NSString *)format {
    NSDate *date = [self czq_stringToDateWithFormat:format];
    NSString *timeSp = [NSString stringWithFormat:@"%lld", (long long)([date timeIntervalSince1970]*1000)];
    return timeSp;
}

/**
 *  获取当前时间
 */
+ (NSString *)czq_currentTime:(NSString *)format {
    return [NSString czq_stringWithDate:[NSDate date] format:format];
}

/**
 *  获取当前时间戳（以毫秒为单位）
 */
+ (NSString *)czq_currentTimeStamp {
    return [NSString stringWithFormat:@"%lld", (long long)[[NSDate date] timeIntervalSince1970]*1000];
}


#pragma mark - MD5
/**
 *  获取32位MD5
 */
- (NSString *)czq_getMd5_32Bit {
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (unsigned int)self.length, digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    return [result copy];
}

#pragma mark - 计算显示文本需要的大小
/**
 *  返回值是该字符串所占的大小(width, height)
 *  @param  font : 该字符串所用的字体(字体大小不一样,显示出来的面积也不同)
 *  @param  maxSize : 为限制改字体的最大宽和高(如果显示一行,则宽高都设置为MAXFLOAT, 如果显示为多行,只需将宽设置一个有限定长值,高设置为MAXFLOAT)
 */
-(CGSize)czq_sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

#pragma mark - 转16进制字符串
/**
 *  data转16进制字符串
 */
+ (NSString *)czq_hexStringWithData:(NSData *)data {
    if (!data || [data length] == 0) {
        return @"";
    }
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[data length]];
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xFF];
            if ([hexStr length] == 2) {
                [string appendString:hexStr];
            } else {
                [string appendFormat:@"0%@", hexStr];
            }
        }
    }];
    return string;
}

/**
 *  byte数组转16进制字符串
 */
+ (NSString *)czq_hexStringWithByteArray:(Byte[])bytes {
    NSMutableString *hexStr = [[NSMutableString alloc]init];
    int i = 0;
    if(bytes) {
        while (bytes[i] != '\0')
        {
            NSString *hexByte = [NSString stringWithFormat:@"%x",bytes[i] & 0xff];///16进制数
            if([hexByte length]==1)
                [hexStr appendFormat:@"0%@", hexByte];
            else
                [hexStr appendFormat:@"%@", hexByte];
            i++;
        }
        hexStr = (NSMutableString *)[hexStr uppercaseString];//将字母转大写 防止后台不适配小写16进制
    }
    return [hexStr copy];
}

#pragma mark - base64编码
/**
 *  base64编码
 */
- (NSString *)czq_encodeBase64 {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [NSString czq_encodeBase64WithData:data];
}

/**
 *  base64编码
 */
+ (NSString *)czq_encodeBase64WithData:(NSData *)data {
    NSData *base64Data = [data base64EncodedDataWithOptions:0];
    NSString *baseString = [[NSString alloc]initWithData:base64Data encoding:NSUTF8StringEncoding];
    return baseString;
}

#pragma mark - 字符串拼接
- (NSString *)czq_appendString:(NSString *)string {
    return [NSString stringWithFormat:@"%@%@",self,string];
}

#pragma mark - 富文本转换
/**
 *  转换富文本
 *  font    字体
 *  color   颜色
 *  range   范围
 */
- (NSAttributedString *)czq_stringToAttributedStringWithFont:(UIFont *)font color:(UIColor *)color range:(NSRange)range {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self];
    [str addAttribute:NSForegroundColorAttributeName value:color range:range];
    [str addAttribute:NSFontAttributeName value:font range:range];
    return [str copy];
}

#pragma mark - json
/**
 *  将字典转换为json字符串
 *  dict    需要被转换的字典
 *  @return 转换后的json字符串
 */
+ (NSString *)czq_jsonStringWithDictionary:(NSDictionary *)dict {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return mutStr;
}

/**
 *  json字符串转字典
 */
- (NSDictionary *)czq_jsonStringToDictionary {
    if (self == nil) {
        return nil;
    }
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

#pragma mark - 半角长度
/**
 *  按半角规则获取字符串长度
 */
- (NSInteger)czq_halfWidthLength {
    NSUInteger asciiLength = 0;
    for (NSUInteger i = 0; i < self.length; i++) {
        unichar uc = [self characterAtIndex: i];
        asciiLength += isascii(uc) ? 1 : 2;
    }
    NSUInteger unicodeLength = asciiLength;
    return unicodeLength;
}

#pragma mark - 格式化数据库表名
/**
 *  格式化数据库表名
 *  将字符串转成大写
 *  使用网络参数拼接数据库表名时,处理表名中特殊符号
 *  @return 格式化后的字符串
 */
- (NSString *)czq_stringToSqlTableName {
    NSString *str = [self uppercaseString];
    str = [str stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    str = [str stringByReplacingOccurrencesOfString:@"?" withString:@"_"];
    return str;
}

#pragma mark - 判断付款码平台
/**
 *  判断付款码平台
 *  @return 付款码平台
 */
- (CZQOnlinePaymentType)determineOnlinePaymentTypes {
    if (!self.length) {
        //没有付款码
        return CZQOnlinePaymentTypeNo;
    }
    if ((self.length >= 16 && self.length <= 24) && ([self hasPrefix:@"25"] || [self hasPrefix:@"26"] || [self hasPrefix:@"27"] || [self hasPrefix:@"28"] || [self hasPrefix:@"29"] || [self hasPrefix:@"30"])) {
        //支付宝
        return CZQOnlinePaymentTypeAli;
    }
    if ((self.length == 18) && ([self hasPrefix:@"10"] || [self hasPrefix:@"11"] || [self hasPrefix:@"12"] || [self hasPrefix:@"13"] || [self hasPrefix:@"14"] || [self hasPrefix:@"15"])) {
        //微信
        return CZQOnlinePaymentTypeWechat;
    }
    if ((self.length == 18) && [self hasPrefix:@"21"]) {
        //京东
        return CZQOnlinePaymentTypeJd;
    }
    //未知类型
    return CZQOnlinePaymentTypeUnknow;
}

@end
