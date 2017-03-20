//
//  LogInViewController.m
//  MobileProject
//
//  Created by wujunyang on 16/1/5.
//  Copyright © 2016年 gfeng. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
  
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 100, 200, 200)];
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}
-(void)click{
        
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
