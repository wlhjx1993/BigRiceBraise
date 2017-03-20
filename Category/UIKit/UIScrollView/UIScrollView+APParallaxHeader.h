//
//  UIScrollView+APParallaxHeader.h
//
//  Created by Mathias Amnell on 2013-04-12.
//  Copyright (c) 2013 Apping AB. All rights reserved.
//  https://github.com/apping/APParallaxHeader
//   使得超级容易将视差效果添加到您的 UIScrollView/UITableView 的类别

#import <UIKit/UIKit.h>

@class APParallaxView;
@class APParallaxShadowView;

#pragma mark UIScrollView Category

@interface UIScrollView (APParallaxHeader)

- (void)addParallaxWithImage:(UIImage *)image andHeight:(CGFloat)height andShadow:(BOOL)shadow;
- (void)addParallaxWithImage:(UIImage *)image andHeight:(CGFloat)height;
- (void)addParallaxWithView:(UIView*)view andHeight:(CGFloat)height;

@property (nonatomic, strong, readonly) APParallaxView *parallaxView;
@property (nonatomic, assign) BOOL showsParallax;

@end

#pragma mark APParallaxView

@protocol APParallaxViewDelegate;

typedef NS_ENUM(NSUInteger, APParallaxTrackingState) {
    APParallaxTrackingActive = 0,
    APParallaxTrackingInactive
};

@interface APParallaxView : UIView

@property (weak) id<APParallaxViewDelegate> delegate;

@property (nonatomic, readonly) APParallaxTrackingState state;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *currentSubView;
@property (nonatomic, strong) APParallaxShadowView *shadowView;
@property (nonatomic, strong) UIView *customView;

- (id)initWithFrame:(CGRect)frame andShadow:(BOOL)shadow;

@end

@protocol APParallaxViewDelegate <NSObject>
@optional
- (void)parallaxView:(APParallaxView *)view willChangeFrame:(CGRect)frame;
- (void)parallaxView:(APParallaxView *)view didChangeFrame:(CGRect)frame;
@end

#pragma mark APParallaxShadowView

@interface APParallaxShadowView : UIView

@end
