//
//  VerticallyCenteredTextView.m
//  YouXi
//
//  Created by 王亮 on 16/6/7.
//  Copyright © 2016年 机锋科技. All rights reserved.
//

#import "VerticallyCenteredTextView.h"

@implementation VerticallyCenteredTextView
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.textAlignment = NSTextAlignmentLeft;
        [self addObserver:self forKeyPath:@"contentSize" options:  (NSKeyValueObservingOptionNew) context:NULL];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        self.textAlignment = NSTextAlignmentLeft;
        [self addObserver:self forKeyPath:@"contentSize" options:  (NSKeyValueObservingOptionNew) context:NULL];
    }
    return self;
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(id)context
{
    if ([keyPath isEqualToString:@"contentSize"])
    {
        UITextView *tv = object;
        CGFloat deadSpace = ([tv bounds].size.height - [tv contentSize].height);
        CGFloat inset = MAX(0, deadSpace/2.0);
        tv.contentInset = UIEdgeInsetsMake(inset, tv.contentInset.left, inset, tv.contentInset.right);
    }
}
- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"contentSize"];
}

@end
