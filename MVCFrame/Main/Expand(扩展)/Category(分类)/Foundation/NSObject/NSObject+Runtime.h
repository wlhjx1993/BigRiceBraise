//
//  NSObject+Runtime.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime)

/**
交换方法的实现。
 @param originalMethod Method to exchange.
 @param newMethod Method to exchange.
 */
+ (void)swizzleMethod:(SEL)originalMethod withMethod:(SEL)newMethod;

/**
追加到对象的一种新方法。
 @param newMethod Method to exchange.
 @param klass Host class.
 */
+ (void)appendMethod:(SEL)newMethod fromClass:(Class)klass;

/**
替换在对象中的方法。
 @param method Method to exchange.
 @param klass Host class.
 */
+ (void)replaceMethod:(SEL)method fromClass:(Class)klass;

/**
 Check whether the receiver implements or inherits a specified method up to and exluding a particular class in hierarchy.
 检查是否接收机实现或继承的指定的方法达和包括在层次结构中的特定类。

 
 @param selector A selector that identifies a method.
 @param stopClass A final super class to stop quering (excluding it).
 @return YES if one of super classes in hierarchy responds a specified selector.
 */
- (BOOL)respondsToSelector:(SEL)selector untilClass:(Class)stopClass;

/**
 Check whether a superclass implements or inherits a specified method.
 检查是否一个超类实现或继承的指定的方法。
 @param selector A selector that identifies a method.
 @return YES if one of super classes in hierarchy responds a specified selector.
 */
- (BOOL)superRespondsToSelector:(SEL)selector;

/**
 Check whether a superclass implements or inherits a specified method.
 检查是否一个超类实现或继承的指定的方法。
 @param selector A selector that identifies a method.
 @param stopClass A final super class to stop quering (excluding it).
 @return YES if one of super classes in hierarchy responds a specified selector.
 */
- (BOOL)superRespondsToSelector:(SEL)selector untilClass:(Class)stopClass;

/**
 Check whether the receiver's instances implement or inherit a specified method up to and exluding a particular class in hierarchy.
 检查是否接收方的情况下实现或继承的指定的方法达和包括在层次结构中的特定类。
 @param selector A selector that identifies a method.
 @param stopClass A final super class to stop quering (excluding it).
 @return YES if one of super classes in hierarchy responds a specified selector.
 */
+ (BOOL)instancesRespondToSelector:(SEL)selector untilClass:(Class)stopClass;
@end
