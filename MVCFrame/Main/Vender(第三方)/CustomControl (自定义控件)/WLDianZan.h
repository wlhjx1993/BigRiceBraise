//
//  WLDianZan.h
//  ding
//
//  Created by 王亮 on 15/6/21.
//  Copyright © 2016年 王亮. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIControlFlagMode) {
    FlagModelNO,
    FlagModelYES,
    FlagModelDefalt
};

@interface WLDianZan : UIButton
@property (nonatomic, strong) UIImage*noStateImg;
@property (nonatomic, strong) UIImage*yesStateImg;
@property (nonatomic, strong) UIImage*defaultStateImg;
@property (nonatomic, assign) UIControlFlagMode flag;
- (void)setFlag:(UIControlFlagMode)flag withAnimation:(BOOL)animation;
@end
