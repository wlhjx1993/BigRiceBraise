//
//  UITextField+History.h
//  Demo
//
//  Created by DamonDing on 15/5/26.
//  Copyright (c) 2015年 morenotepad. All rights reserved.
//
//  https://github.com/Jameson-zxm/UITextField-History
//  UITextfiled 输入历史记录

#import <UIKit/UIKit.h>

@interface UITextField (History)

/**
 *  identity of this textfield
 */
@property (retain, nonatomic) NSString* identify;

/**
 *  load textfiled input history
 *
 *  @param identify identity of this textfield
 *
 *  @return the history of it's input
 */
- (NSArray*) loadHistroy;

/**
 *  save current input text
 */
- (void) synchronize;

- (void) showHistory;
- (void) hideHistroy;

- (void) clearHistory;

@end
