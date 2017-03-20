//
//  YYPerson.h
//  02-归档
//
//  Created by apple on 14-6-7.
//  Copyright (c) 2014年 itcase. All rights reserved.
//

#import <Foundation/Foundation.h>

// 如果想将一个自定义对象保存到文件中必须实现NSCoding协议
@interface User : NSObject<NSCoding>

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *Key;

@property (nonatomic, copy) NSString *code;

@property (nonatomic, copy) NSString *createDate;

@property (nonatomic, copy) NSString *updateDate;

@end