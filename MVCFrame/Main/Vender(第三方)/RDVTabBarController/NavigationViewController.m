//
//  NavigationViewController.m
//  YouXi
//
//  Created by 王亮 on 16/4/1.
//  Copyright © 2016年 机锋科技. All rights reserved.
//

#import "NavigationViewController.h"

@interface NavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
//    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    
//    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];

    
//    UIImage *image = [UIImage imageNamed:@"action-black-button"];
//
//    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsCompact];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return self.childViewControllers.count>1;
}
@end
