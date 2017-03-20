//
//  UISplitViewController+QuickAccess.h
//
//  Created by Timothy Sanders on 6/28/12.
//  Copyright (c) 2012 HiddenJester Software.
//	This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
//	See http://creativecommons.org/licenses/by-nc-sa/4.0/
//  https://github.com/HiddenJester/UISplitViewController-QuickAccess

@import UIKit;

/*
 I often want the "left content view controller" or the "right content view controller".
 我常常想要"左内容视图控制器"正确的内容视图控制器"。
 
 Many times the UIViewControllers in viewControllers are actually UINavigationControllers and then
 很多时候在 viewControllers UIViewControllers 是实际上 UINavigationControllers，然后
 
 I want to get the topViewController from that. So these methods pull the left or right VC and then
 我想要从中得到 topViewController。所以这些方法拉左或右的 VC，然后
 
 check if they are UINavigationControllers. If they are then they go ahead and return the controller's
 topViewController property.
 检查他们是否是 UINavigationControllers。如果他们再继续执行并返回控制器
 topViewController 属性。
 */

@interface UISplitViewController (QuickAccess)

@property (weak, readonly, nonatomic) UIViewController * leftController;
@property (weak, readonly, nonatomic) UIViewController * rightController;

@end
