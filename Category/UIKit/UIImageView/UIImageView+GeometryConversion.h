//
//  UIImageView+GeometryConversion.h
//
//  Created by Dominique d'Argent on 18.04.12.
//  Copyright (c) 2012. All rights reserved.
//
//  Thomas Sarlandie - 2012:
//  - Added convertPointFromView:viewPoint
//  - Added convertRectFromView:viewPoint
//
//  Contribution released in the public domain.

// https://github.com/nubbel/UIImageView-GeometryConversion
//  UIImageView上的一个类别，它提供了将点和矩形从图像转换为视图坐标的方法，反之亦然。




#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface UIImageView (GeometryConversion)

- (CGPoint)convertPointFromImage:(CGPoint)imagePoint;
- (CGRect)convertRectFromImage:(CGRect)imageRect;

- (CGPoint)convertPointFromView:(CGPoint)viewPoint;
- (CGRect)convertRectFromView:(CGRect)viewRect;

@end
