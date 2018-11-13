//
//  NSObject+CNJacobRuntime.h
//  Common4Jacob
//
//  Created by jacob on 2018/11/13.
//  Copyright © 2018 CNJacob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CNJacobRuntime)

/**
 获取属性列表
 */
+ (void)getPropertyList;

/**
 方法列表
 */
+ (void)getMethodList;

/**
 成员列表
 */
+ (void)getIvarList;

/**
 协议列表
 */
+ (void)getProtocolList;

/**
 方法交换

 @param originalSelector 原始方法
 @param newSelector 替换后的新方法
 */
- (void)exchangeMethod:(SEL)originalSelector newMethod:(SEL)newSelector;

@end
