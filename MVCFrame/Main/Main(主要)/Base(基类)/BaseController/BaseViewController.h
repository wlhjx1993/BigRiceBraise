//
//  BaseViewController.h
//  MobileProject 基控制器
//
//  Created by wujunyang on 16/1/5.
//  Copyright © 2016年 gfeng. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol  BBBaseViewControllerDataSource<NSObject>
//@optional
-(NSMutableAttributedString*)setTitle;
-(UIView*)setTitleView;
-(UIButton*)set_leftButton;
-(UIButton*)set_rightButton;
-(UIImage*)set_leftBarButtonItemWithImage;
-(UIImage*)set_rightBarButtonItemWithImage;
@end


@protocol BBBaseViewControllerDelegate <NSObject>


-(void)left_button_event:(UIButton*)sender;
-(void)right_button_event:(UIButton*)sender;
-(void)title_click_event:(UIView*)sender;
@end

@interface BaseViewController : UIViewController<BBBaseViewControllerDataSource , BBBaseViewControllerDelegate>

-(void)setContentAlpha:(UIColor* )alpha;
-(void)set_Title:(NSMutableAttributedString *)title;


@end
