//
//  UIWindow+Hierarchy.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/1/16.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (Hierarchy)
/*!
 @method topMostController
 
 @return 返回层次结构中当前顶部最 ViewController。
 */
- (UIViewController*) topMostController;

/*!
 @method currentViewController
 
 @return 在 topMostController 堆栈中返回 topViewController。
 */
- (UIViewController*)currentViewController;
@end
