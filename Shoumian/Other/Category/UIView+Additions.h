//
//  UIView+Additions.h
//  ZMC
//
//  Created by MindminiMac on 16/6/24.
//  Copyright © 2016年 MindminiMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView (Additions)
@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;


+(id)getView;

- (UIViewController *)superviewcontroller;

#pragma mark - Border radius
/**
 *  @brief 设置圆角
 */
- (void)rounded:(CGFloat)cornerRadius;

/**
 *  @brief 设置圆角和边框
 */
- (void)rounded:(CGFloat)cornerRadius width:(CGFloat)borderWidth color:(UIColor *)borderColor;

/**
 *  @brief 设置边框
 */
- (void)border:(CGFloat)borderWidth color:(UIColor *)borderColor;


/** 更新约束 */
-(void)updateViewContraint:(NSLayoutAttribute)attribute value:(CGFloat)value;

@end
