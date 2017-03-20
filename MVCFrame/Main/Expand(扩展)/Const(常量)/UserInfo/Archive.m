//
//  guidang.m
//  guidang
//
//  Created by 王亮 on 16/6/13.
//  Copyright © 2016年 王亮. All rights reserved.
//

#import "Archive.h"


@implementation Archive

+ (void)saveUserInformationID:(NSString *)ID createDate:(NSString *)createDate updateDate:(NSString*)updateDate  code:(NSString *)code Key:(NSString *)Key{
    //1.创建对象
    User *p=[[User alloc]init];
    p.ID=ID;
    p.createDate=createDate;
    p.updateDate=updateDate;
    p.code=code;
    p.Key=Key;

    //2.获取文件路径
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *path=[docPath stringByAppendingPathComponent:@"cexi"];

    //3.将自定义的对象保存到文件中
    [NSKeyedArchiver archiveRootObject:p toFile:path];
}

+ (User *)readUserInfomation {
    //1.获取文件路径
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *path=[docPath stringByAppendingPathComponent:@"cexi"];
    //2.从文件中读取对象
    User *p=[NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return p;
}

@end
