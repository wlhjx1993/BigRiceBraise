//
//  Single.m
//  YouXi
//
//  Created by 王亮 on 11.
//  Copyright © 2016年 机锋科技. All rights reserved.
//

#import "SingletonPattern.h"

static SingletonPattern *class = nil;

@implementation SingletonPattern

+ (id)allocWithZone:(struct _NSZone *)zone
{
    if (!class) {
        class = [super allocWithZone:zone];//如果没有实例让父类去创建一个
        return class;
    }
    return nil;
}
- (id)copyWithZone:(struct _NSZone *)zone
{
    return self;
}


+ (instancetype) db {
    @synchronized(self) {
        if (class == nil) {
            class = [[self alloc] init];
        }
    }
    return class;
}

@end
