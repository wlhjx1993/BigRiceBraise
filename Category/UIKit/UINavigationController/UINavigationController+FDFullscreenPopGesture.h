
// 导航栏 push 设置 很强

#import <UIKit/UIKit.h>

@interface UINavigationController (FDFullscreenPopGesture)
// 实际处理交互式流行笔势识别器。
@property (nonatomic, strong, readonly) UIPanGestureRecognizer *fd_fullscreenPopGestureRecognizer;
// 一个视图控制器本身就是能够控制导航栏的外观，
@property (nonatomic, assign) BOOL fd_viewControllerBasedNavigationBarAppearanceEnabled;

@end
@interface UIViewController (FDFullscreenPopGesture)
// 是否禁用滑动返回手势
@property (nonatomic, assign) BOOL fd_interactivePopDisabled;
// 是否隐藏导航栏
@property (nonatomic, assign) BOOL fd_prefersNavigationBarHidden;
// 设置滑动返回手势的最短距离
@property (nonatomic, assign) CGFloat fd_interactivePopMaxAllowedInitialDistanceToLeftEdge;

@end
