//
//  guidang.h
//  guidang
//
//  Created by 王亮 on 16/6/13.
//  Copyright © 2016年 王亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Archive : NSString
+ (void)saveUserInformationID:(NSString *)ID createDate:(NSString *)createDate updateDate:(NSString*)updateDate  code:(NSString *)code Key:(NSString *)Key;
+ (User *)readUserInfomation ;
@end
