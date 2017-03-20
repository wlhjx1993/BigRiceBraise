//
//  UIWebView+Blocks.h
//
//  Created by Shai Mishali on 1/1/13.
//  Copyright (c) 2013 Shai Mishali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

/**
 UIWebView+Blocks is a simple Block implementation for UIWebView created by Shai Mishali.
 This class currently doesn't support simultaneous UIWebViews in the the same view.
 */
@interface UIWebView (Block) <UIWebViewDelegate>

/**
 Set TRUE_END_REPORT to YES to get notified only when the page has *fully* loaded, and not when every single element loads. (still not fully tested). When this is set to NO, it will work exactly like the UIWebViewDelegate. (Default behavior)
 */
#define TRUE_END_REPORT NO

/**
 加载请求，web 页是成功加载或加载失败时得到通知
 
 @param 请求 NSURLRequest 加载
 @param loadedBlock 回调块加载完成时调用
 @param failureBlock 回调块加载时调用
 
 @return 生成 UIWebView
 */
+ (UIWebView *) loadRequest: (NSURLRequest *) request
                     loaded: (void (^)(UIWebView *webView)) loadedBlock
                     failed: (void (^)(UIWebView *webView, NSError *error)) failureBlock;

/**
 加载请求，web 页是加载成功，无法加载，或开始加载时得到通知。此外，还要设置应加载某一页。
 
 @param 请求 NSURLRequest 加载
 @param loadedBlock 回调块加载完成时调用
 @param failureBlock 回调块加载时调用
 @param loadStartedBlock 回调块加载开始时调用
 @param shouldLoadBlock 回调块确定应加载特定的网页。 @re
 turn The generated UIWebView
 */
+ (UIWebView *) loadRequest: (NSURLRequest *) request
                     loaded: (void (^)(UIWebView *webView)) loadedBlock
                     failed: (void (^)(UIWebView *webView, NSError *error)) failureBlock
                loadStarted: (void (^)(UIWebView *webView)) loadStartedBlock
                 shouldLoad: (BOOL (^)(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType)) shouldLoadBlock;

/**
 加载的 HTML 字符串和 web 页是成功加载或加载失败时得到通知。
 
 @param htmlString NSString 包含要加载的 HTML
 @param loadedBlock 回调块加载完成时调用
 @param failureBlock 回调块加载时调用
 
 @return 生成 UIWebView
 */
+(UIWebView *)loadHTMLString:(NSString *)htmlString
                      loaded:(void (^)(UIWebView *webView))loadedBlock
                      failed:(void (^)(UIWebView *webView, NSError *error))failureBlock;

/**
 加载的 HTML 字符串和 web 页是成功加载，加载失败或已开始加载时得到通知。
 此外设置应加载某一页。

 @param htmlString NSString 包含要加载的 HTML。
 @param loadedBlock 回调块加载完成时调用
 @param failureBlock 回调块加载时调用
 @param loadStartedBlock 回调块加载开始时调用
 @param shouldLoadBlock 回调块确定应加载特定的网页。
 @return The generated UIWebView
 */
+(UIWebView *)loadHTMLString:(NSString *)htmlString
                      loaded:(void (^)(UIWebView *))loadedBlock
                      failed:(void (^)(UIWebView *, NSError *))failureBlock
                 loadStarted:(void (^)(UIWebView *webView))loadStartedBlock
                  shouldLoad:(BOOL (^)(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType))shouldLoadBlock;
@end
