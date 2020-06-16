//
//  NSString+CZQExtension.h
//  CZQExtension
//
//  Created by 崔正清 on 2018/11/5.
//  Copyright © 2018年 cuizhengqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,CZQOnlinePaymentType) {
    CZQOnlinePaymentTypeUnknow = -2,//未知支付类型
    CZQOnlinePaymentTypeNo = -1,//没有线上支付
    CZQOnlinePaymentTypeAli = 0,//支付宝
    CZQOnlinePaymentTypeWechat,//微信
    CZQOnlinePaymentTypeJd//京东支付
};

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

#pragma mark - 数字处理
/**
 *  小数最后一位四舍五入
 *  @param scale 小数点后保留的位数
 *  2.35->2.4   2.32->2.3
 */
- (NSString *)czq_roundPlainWithScale:(short)scale;

/**
 *  小数最后一位向下取整
 *  @param scale  小数点后保留的位数
 *  2.35->2.3   2.32->2.3
 */
- (NSString *)czq_roundDownWithScale:(short)scale;

/**
 *  小数最后一位向上取整
 *  @param scale 小数点后保留的位数
 *  2.35->2.4   2.32->2.4
 */
- (NSString *)czq_roundUpWithScale:(short)scale;

#pragma mark - 日期
/**
 *  将date转换成字符串
 *  @param  date            要转换的date
 *  @param  format          日期格式
 */
+ (NSString *)czq_stringWithDate:(NSDate *)date format:(NSString *)format;

/**
 *  字符串转date
 *  @param format  时间格式
 */
- (NSDate *)czq_stringToDateWithFormat:(NSString *)format;

/**
 *  时间戳字符串转换为时间字符串
 */
- (NSString *)czq_stringFromTimeStampStringWithFormat:(NSString *)format;

/**
 *  时间字符串转换为时间戳字符串
 */
- (NSString *)czq_stringToTimeStampStringWithFormat:(NSString *)format;

/**
 *  获取当前时间
 */
+ (NSString *)czq_currentTime:(NSString *)format;

/**
 *  获取当前时间戳（以毫秒为单位）
 */
+ (NSString *)czq_currentTimeStamp;

#pragma mark - MD5
/**
 *  获取32位MD5
 */
- (NSString *)czq_getMd5_32Bit;

#pragma mark - 计算显示文本需要的大小
/**
 *  返回值是该字符串所占的大小(width, height)
 *  @param  font : 该字符串所用的字体(字体大小不一样,显示出来的面积也不同)
 *  @param  maxSize : 为限制改字体的最大宽和高(如果显示一行,则宽高都设置为MAXFLOAT, 如果显示为多行,只需将宽设置一个有限定长值,高设置为MAXFLOAT)
 */
- (CGSize)czq_sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

#pragma mark - 16进制字符串
/**
 *  data转16进制字符串
 */
+ (NSString *)czq_hexStringWithData:(NSData *)data;

/**
 *  byte数组转16进制字符串
 */
+ (NSString *)czq_hexStringWithByteArray:(Byte[])bytes;

#pragma mark - base64编码
/**
 *  base64编码
 *  @return 编码后的字符串
 */
- (NSString *)czq_encodeBase64;

/**
 *  base64编码
 *  @param  data    需要编码的data
 *  @return 编码后的字符串
 */
+ (NSString *)czq_encodeBase64WithData:(NSData *)data;

#pragma mark - 字符串拼接
/**
 *  追加字符串
 *  @param  string  追加的字符串
 *  @return 拼接后的字符串
 */
- (NSString *)czq_appendString:(NSString *)string;

#pragma mark - 富文本
/**
 *  转换富文本
 *  @param  font    字体
 *  @param  color   颜色
 *  @param  range   范围
 *  @return 富文本
 */
- (NSAttributedString *)czq_stringToAttributedStringWithFont:(UIFont *)font color:(UIColor *)color range:(NSRange)range;

#pragma mark - json
/**
 *  将字典转换为json字符串
 *  dict    需要被转换的字典
 *  @return 转换后的json字符串
 */
+ (NSString *)czq_jsonStringWithDictionary:(NSDictionary *)dict;

/**
 *  json字符串转字典
 *  @return 字典
 */
- (NSDictionary *)czq_jsonStringToDictionary;

#pragma mark - 半角长度
/**
 *  按半角规则获取字符串长度 英文占一个长度  中文占两个长度
 *  @return 长度
 */
- (NSInteger)czq_halfWidthLength;

#pragma mark - 格式化数据库表名
/**
 *  格式化数据库表名
 *  将字符串转成大写
 *  使用网络参数拼接数据库表名时,处理表名中特殊符号
 *  @return 格式化后的字符串
 */
- (NSString *)czq_stringToSqlTableName;

#pragma mark - 判断付款码平台
/**
 *  判断付款码平台
 *  @return 付款码平台
 */
- (CZQOnlinePaymentType)determineOnlinePaymentTypes;

@end

