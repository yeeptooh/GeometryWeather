//
//  ZDDShareTransitionAnimation.h
//  几何天气
//
//  Created by 张冬冬 on 16/5/25.
//  Copyright © 2016年 张冬冬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, ZDDShareTransitionAnimationType) {
    ZDDShareTransitionAnimationTypePresent = 1,
    ZDDShareTransitionAnimationTypeDismiss
};
@interface ZDDShareTransitionAnimation : NSObject
<
UIViewControllerAnimatedTransitioning
>

+ (instancetype)transitionWithType:(ZDDShareTransitionAnimationType)type Duration:(NSTimeInterval)duration frame:(CGRect)frame center:(CGPoint)center;
@end
