//
//  ZDDTransitionAnimation.h
//  几何天气
//
//  Created by 张冬冬 on 16/5/23.
//  Copyright © 2016年 张冬冬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, ZDDTransitionAnimationType) {
    ZDDTransitionAnimationTypePresent = 1,
    ZDDTransitionAnimationTypeDismiss
};
@interface ZDDTransitionAnimation : NSObject
<
UIViewControllerAnimatedTransitioning
>

+ (instancetype)transitionWithType:(ZDDTransitionAnimationType)type Duration:(NSTimeInterval)duration PresentHeight:(CGFloat)height containerHeight:(CGFloat)containerHeight Scale:(CGPoint)scale;

@end
