//
//  AppDelegate.m
//  MobileProject
//
//  Created by wujunyang on 16/1/5.
//  Copyright © 2016年 gfeng. All rights reserved.
//

#import "AppDelegate.h"



#if DEBUG
#import <FLEXManager.h>
#endif

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    //日志初始化
//    [MyFileLogger sharedManager];
#if DEBUG
//        [[FLEXManager sharedManager] showExplorer];
#endif
    
    //域名设置
    [HTTPRequestTool updateBaseUrl:IPAddress];
    
    //分享及第三方登录初始化
    [self initLoadUMSocial];
    
    //加载页面
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
//    [self setupLoginViewController];
    [self setupHomeViewController];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark 自定义跳转不同的页面
//登录页面
-(void)setupLoginViewController
{
    LogInViewController *logInVc = [[LogInViewController alloc]init];
    UINavigationController *navcLogin = [[UINavigationController alloc]initWithRootViewController:logInVc];
    [navcLogin setNavigationBarHidden:YES];
    self.window.rootViewController = navcLogin;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

//首页
-(void)setupHomeViewController
{
    RDVTabBarController *logInVc = [[RDVTabBarController alloc]init];
    
    
//    UINavigationController *navcLogin = [[UINavigationController alloc]initWithRootViewController:logInVc];
//    [navcLogin setNavigationBarHidden:YES];
    self.window.rootViewController = logInVc;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

#pragma mark 自定义关于消息推送的内容
-(void)initLoadGeTui:(NSDictionary *)launchOptions
{
    // 注册APNS
    [self registerUserNotification];
    // 处理远程通知启动APP
    [self receiveNotificationByLaunchingOptions:launchOptions];
}

// 处理推送消息
- (void)handlePushMessage:(NSDictionary *)dict notification:(UILocalNotification *)localNotification {
    NSLog(@"开始处理从通知栏点击进来的推送消息");
    
    if ([UIApplication sharedApplication].applicationIconBadgeNumber != 0) {
        if (localNotification) {
            [[UIApplication sharedApplication] cancelLocalNotification:localNotification];
        }
        [UIApplication sharedApplication].applicationIconBadgeNumber -= 1;
    }
    else {
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
        [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    }
}

#pragma mark - 用户通知(推送) _自定义方法

/** 注册用户通知 */
- (void)registerUserNotification {
    
    /*
     注册通知(推送)
     申请App需要接受来自服务商提供推送消息
     */
    
    // 判读系统版本是否是“iOS 8.0”以上
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ||
        [UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]) {
        
        // 定义用户通知类型(Remote.远程 - Badge.标记 Alert.提示 Sound.声音)
        UIUserNotificationType types = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        
        // 定义用户通知设置
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
        
        // 注册用户通知 - 根据用户通知设置
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    } else { // iOS8.0 以前远程推送设置方式
        // 定义远程通知类型(Remote.远程 - Badge.标记 Alert.提示 Sound.声音)
        UIRemoteNotificationType myTypes = UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound;
        
        // 注册远程通知 -根据远程通知类型
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:myTypes];
    }
}

/** 自定义：APP被“推送”启动时处理推送消息处理（APP 未启动--》启动）*/
- (void)receiveNotificationByLaunchingOptions:(NSDictionary *)launchOptions {
    if (!launchOptions)
        return;
    
    /*
     通过“远程推送”启动APP
     UIApplicationLaunchOptionsRemoteNotificationKey 远程推送Key
     */
    NSDictionary *userInfo = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    if (userInfo) {
        NSLog(@"\n>>>[Launching RemoteNotification]:%@", userInfo);
    }
}


#pragma mark - 用户通知(推送)回调 _IOS 8.0以上使用

/** 已登记用户通知 */
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    // 注册远程通知（推送）
    [application registerForRemoteNotifications];
}

#pragma mark - 远程通知(推送)回调

/** 远程通知注册成功委托 */
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSString *myToken = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    myToken = [myToken stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    
    NSLog(@"\n>>>[DeviceToken Success]:%@\n\n", myToken);
}

/** 远程通知注册失败委托 */
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
    
    
    NSLog(@"\n>>>[DeviceToken Error]:%@\n\n", error.description);
}

#pragma mark - APP运行中接收到通知(推送)处理

/** APP已经接收到“远程”通知(推送) - (App运行在后台) 当不走个推时，从苹果进来执行，获得userInfo里面的属性*/
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    //处理applicationIconBadgeNumber-1
    [self handlePushMessage:userInfo notification:nil];
    
    //除了个推还要处理走苹果的信息放在body里面
    if (userInfo) {
        NSString *payloadMsg = [userInfo objectForKey:@"payload"];
        NSString *message=[[[userInfo objectForKey:@"aps"]objectForKey:@"alert"]objectForKey:@"body"];
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"您有一条新消息" message:[NSString stringWithFormat:@"%@,%@",payloadMsg,message] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        NSLog(@"%@",userInfo);
    }
    NSLog(@"\n>>>[Receive RemoteNotification]:%@\n\n", userInfo);
}

/** APP已经接收到“远程”通知(推送) - 透传推送消息  当不走个推时，从苹果进来执行，获得userInfo里面的属性*/
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    
    //处理applicationIconBadgeNumber-1
    [self handlePushMessage:userInfo notification:nil];
    
    //除了个推还要处理走苹果的信息放在body里面
    if (userInfo) {
        NSString *payloadMsg = [userInfo objectForKey:@"payload"];
        NSString *message=[[[userInfo objectForKey:@"aps"]objectForKey:@"alert"]objectForKey:@"body"];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"您有一条新消息" message:[NSString stringWithFormat:@"%@,%@",payloadMsg,message] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        NSLog(@"%@",userInfo);
    }
    // 处理APN
    NSLog(@"\n>>>[Receive RemoteNotification - Background Fetch]:%@\n\n", userInfo);
    completionHandler(UIBackgroundFetchResultNewData);
}



/** SDK启动成功返回cid */
- (void)GeTuiSdkDidRegisterClient:(NSString *)clientId {
    // [4-EXT-1]: 个推SDK已注册，返回clientId
    NSLog(@"\n>>>[GeTuiSdk RegisterClient]:%@\n\n", clientId);
}

/** SDK遇到错误回调 */
- (void)GeTuiSdkDidOccurError:(NSError *)error {
    // [EXT]:个推错误报告，集成步骤发生的任何错误都在这里通知，如果集成后，无法正常收到消息，查看这里的通知。
    NSLog(@"\n>>>[GexinSdk error]:%@\n\n", [error localizedDescription]);
}




#pragma mark 初始化友盟分享
-(void)initLoadUMSocial
{
    
}

/**
 这里处理新浪微博SSO授权之后跳转回来，和微信分享完成之后跳转回来
 */
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return  YES;
}

/**
 这里处理新浪微博SSO授权进入新浪微博客户端后进入后台，再返回原来应用
 */
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

@end
