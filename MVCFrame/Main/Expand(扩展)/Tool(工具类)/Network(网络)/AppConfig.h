//
//  AppConfig.h
//  GuangKePai
//
//  Created by GFeng on 16/5/31.
//  Copyright © 2016年 gfeng. All rights reserved.
//

#ifndef AppConfig_h
#define AppConfig_h


//APP域名
#ifdef  Debug
#define IPAddress @""   //内测
#else
#define IPAddress @""   //正式
#endif

//接口

#define LoginUrl                      @"/account/login"                   //登录
#define RegisterUrl                   @"/account/register"                //注册


#endif /* AppConfig_h */
