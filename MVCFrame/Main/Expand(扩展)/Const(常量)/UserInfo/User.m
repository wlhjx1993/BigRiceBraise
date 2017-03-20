//
//  YYPerson.m
//  02-归档
//
//  Created by apple on 14-6-7.
//  Copyright (c) 2014年 itcase. All rights reserved.
//

#import "User.h"

@implementation User

// 当将一个自定义对象保存到文件的时候就会调用该方法
// 在该方法中说明如何存储自定义对象的属性
// 也就说在该方法中说清楚存储自定义对象的哪些属性
-(void)encodeWithCoder:(NSCoder *)aCoder
{
//    NSLog(@"调用了encodeWithCoder:方法");
    [aCoder encodeObject:self.ID forKey:@"ID"];
    [aCoder encodeObject:self.Key forKey:@"Key"];
    [aCoder encodeObject:self.code forKey:@"code"];
    [aCoder encodeObject:self.createDate forKey:@"createDate"];
    [aCoder encodeObject:self.updateDate forKey:@"updateDate"];

}

// 当从文件中读取一个对象的时候就会调用该方法
// 在该方法中说明如何读取保存在文件中的对象
// 也就是说在该方法中说清楚怎么读取文件中的对象
-(id)initWithCoder:(NSCoder *)aDecoder
{
//    NSLog(@"调用了initWithCoder:方法");
    //注意：在构造方法中需要先初始化父类的方法
    if (self=[super init]) {
        self.ID=[aDecoder decodeObjectForKey:@"ID"];
        self.Key=[aDecoder decodeObjectForKey:@"Key"];
        self.code=[aDecoder decodeObjectForKey:@"code"];
        self.createDate=[aDecoder decodeObjectForKey:@"createDate"];
        self.updateDate=[aDecoder decodeObjectForKey:@"updateDate"];
    }
    return self;
}
@end
