//
//  UIView+CZQExtension.h
//  CZQExtension
//
//  Created by 崔正清 on 2019/3/8.
//  Copyright © 2019 cuizhengqing. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (CZQExtension)

@property (nonatomic, assign) CGFloat czq_x;
@property (nonatomic, assign) CGFloat czq_y;
@property (nonatomic, assign) CGFloat czq_centerX;
@property (nonatomic, assign) CGFloat czq_centerY;
@property (nonatomic, assign) CGFloat czq_width;
@property (nonatomic, assign) CGFloat czq_height;
@property (nonatomic, assign) CGSize  czq_size;
@property (nonatomic, assign) CGPoint czq_origin;
@property (nonatomic, assign, readonly) CGFloat czq_rightX;//控件右侧x值
@property (nonatomic, assign, readonly) CGFloat czq_bottomY;//控件底部y值

/**
 *  查找当前视图下指定类型的子视图
 *  @param  aClass  要查找的子视图类型
 *  @return 查找到的子视图数组
 */
- (NSArray <UIView *> *)czq_traversalAllSubViewsForClass:(Class)aClass;

@end

