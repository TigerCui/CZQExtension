//
//  UIView+CZQExtension.m
//  CZQExtension
//
//  Created by 崔正清 on 2019/3/8.
//  Copyright © 2019 cuizhengqing. All rights reserved.
//

#import "UIView+CZQExtension.h"

@implementation UIView (CZQExtension)

/**
 *  x
 */
- (void)setCzq_x:(CGFloat)czq_x {
    CGPoint point = self.czq_origin;
    point.x = czq_x;
    self.czq_origin = point;
}

- (CGFloat)czq_x {
    return self.czq_origin.x;
}

/**
 *  y
 */
- (void)setCzq_y:(CGFloat)czq_y {
    CGPoint point = self.czq_origin;
    point.y = czq_y;
    self.czq_origin = point;
}

- (CGFloat)czq_y {
    return self.czq_origin.y;
}

/**
 *  width
 */
- (void)setCzq_width:(CGFloat)czq_width {
    CGSize size = self.czq_size;
    size.width = czq_width;
    self.czq_size = size;
}

- (CGFloat)czq_width {
    return self.czq_size.width;
}

/**
 *  height
 */
- (void)setCzq_height:(CGFloat)czq_height {
    CGSize size = self.czq_size;
    size.height = czq_height;
    self.czq_size = size;
}

- (CGFloat)czq_height {
    return self.czq_size.height;
}

/**
 *  centerX
 */
- (void)setCzq_centerX:(CGFloat)czq_centerX {
    CGPoint point = self.center;
    point.x = czq_centerX;
    self.center = point;
}

- (CGFloat)czq_centerX {
    return self.center.x;
}

/**
 *  centerY
 */
- (void)setCzq_centerY:(CGFloat)czq_centerY {
    CGPoint point = self.center;
    point.y = czq_centerY;
    self.center = point;
}

- (CGFloat)czq_centerY {
    return self.center.y;
}

/**
 *  rightX
 */
- (CGFloat)czq_rightX {
    return self.czq_x + self.czq_width;
}

/**
 *  bottomY
 */
- (CGFloat)czq_bottomY {
    return self.czq_y + self.czq_height;
}

/**
 *  origin
 */
- (void)setCzq_origin:(CGPoint)czq_origin {
    CGRect rect = self.frame;
    rect.origin = czq_origin;
    self.frame = rect;
}

- (CGPoint)czq_origin {
    return self.frame.origin;
}

/**
 *  size
 */
- (void)setCzq_size:(CGSize)czq_size {
    CGRect rect = self.frame;
    rect.size = czq_size;
    self.frame = rect;
}

- (CGSize)czq_size {
    return self.frame.size;
}

/**
 *  查找当前视图下指定类型的子视图
 *  @param  aClass  要查找的子视图类型
 *  @return 查找到的子视图数组
 */
- (NSArray <UIView *> *)czq_traversalAllSubViewsForClass:(Class)aClass {
    NSMutableArray *views = [[NSMutableArray alloc] init];
    for (UIView *v in self.subviews) {
        if ([v isKindOfClass:aClass]) {
            [views addObject:v];
        }
        [views addObjectsFromArray:[v czq_traversalAllSubViewsForClass:aClass]];
    }
    return views.count>0?views:nil;
}

@end
