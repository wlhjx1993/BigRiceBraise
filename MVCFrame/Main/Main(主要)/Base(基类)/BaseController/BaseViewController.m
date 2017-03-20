//
//  BaseViewController.m
//  MobileProject
//
//  Created by wujunyang on 16/1/5.
//  Copyright © 2016年 gfeng. All rights reserved.
//
#import "BaseViewController.h"

@interface BaseViewController ()


@end

@implementation BaseViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(setTitle)]) {
        NSMutableAttributedString *titleAttri = [self setTitle];
        [self set_Title:titleAttri];
    }
    if ([self respondsToSelector:@selector(setTitleView)]) {
        UIView *view = [self setTitleView];
        [self set_TitleView:view];
    }
    if (![self leftButton]) {
        [self configLeftBaritemWithImage];
    }
    
    if (![self rightButton]) {
        [self configRightBaritemWithImage];
    }
    self.automaticallyAdjustsScrollViewInsets=NO;
}






























/************************************************************
 *     延迟加载
 ************************************************************/
#pragma mark --- NORMAl
-(void)set_Title:(NSMutableAttributedString *)title{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 44)];
    label.numberOfLines=0;//可能出现多行的标题
    [label setAttributedText:title];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleClick:)];
    [label addGestureRecognizer:tap];
    self.navigationItem.titleView = label;
    
}
-(void)set_TitleView:(UIView *)titleView{
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleClick:)];
    [titleView addGestureRecognizer:tap];
    self.navigationItem.titleView = titleView;
    
}
-(void)titleClick:(UIGestureRecognizer*)Tap{
    
    UIView *view = Tap.view;
    if ([self respondsToSelector:@selector(title_click_event:)]) {
        [self title_click_event:view];
    }
}
#pragma mark -- left_item
-(void)configLeftBaritemWithImage{
    if ([self respondsToSelector:@selector(set_leftBarButtonItemWithImage)]) {
        UIImage *image = [self set_leftBarButtonItemWithImage];
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStyleBordered target:self  action:@selector(left_click:)];
        
        self.navigationItem.backBarButtonItem = item;
    }
}
-(void)configRightBaritemWithImage{
    if ([self respondsToSelector:@selector(set_rightBarButtonItemWithImage)]) {
        UIImage *image = [self set_rightBarButtonItemWithImage];
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self  action:@selector(right_click:)];
        self.navigationItem.rightBarButtonItem = item;
    }
}
#pragma mark -- left_button
-(BOOL)leftButton{
    BOOL isleft =  [self respondsToSelector:@selector(set_leftButton)];
    if (isleft) {
        UIButton *leftbutton = [self set_leftButton];
        [leftbutton addTarget:self action:@selector(left_click:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:leftbutton];
        self.navigationItem.leftBarButtonItem = item;
    }
    return isleft;
}
#pragma mark -- right_button
-(BOOL)rightButton{
    BOOL isright = [self respondsToSelector:@selector(set_rightButton)];
    if (isright) {
        UIButton *right_button = [self set_rightButton];
        [right_button addTarget:self action:@selector(right_click:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:right_button];
        self.navigationItem.rightBarButtonItem = item;
    }
    return isright;
}
-(void)left_click:(id)sender{
    if ([self respondsToSelector:@selector(left_button_event:)]) {
        [self left_button_event:sender];
    }
}
-(void)right_click:(id)sender{
    if ([self respondsToSelector:@selector(right_button_event:)]) {
        [self right_button_event:sender];
    }
}
-(void)setContentAlpha:(UIColor* )alpha{
    for (UIView *subview in self.navigationController.navigationBar.subviews) {
        if ([subview.class isSubclassOfClass:NSClassFromString(@"_UIBarBackground")]) {
            for (UIView *su in subview.subviews) {
                if ([su.class isSubclassOfClass:NSClassFromString(@"UIImageView")]) {
                    su.backgroundColor = alpha;
                }
            }
        }
    }
}

@end
