//
//  UILabel+SuggestSize.h
//  WordPress
//
//  Created by Eric J on 6/18/13.
//  Copyright (c) 2013 WordPress. All rights reserved.
//  获取label 建议大小

#import <UIKit/UIKit.h>

@interface UILabel (SuggestSize)

- (CGSize)suggestedSizeForWidth:(CGFloat)width;
- (CGSize)suggestSizeForAttributedString:(NSAttributedString *)string width:(CGFloat)width;
- (CGSize)suggestSizeForString:(NSString *)string width:(CGFloat)width;

@end
