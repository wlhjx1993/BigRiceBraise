//
//  Single.h
//  YouXi
//
//  Created by 王亮 on 11.
//  Copyright © 2016年 机锋科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingletonPattern : NSObject
/**
 *  储存地图标记商户信息
 */
@property (strong,nonatomic) NSString *db;



+ (instancetype) db ;
@end
