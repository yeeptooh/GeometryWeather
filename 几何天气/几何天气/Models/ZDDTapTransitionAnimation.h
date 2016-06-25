//
//  ZDDTapTransitionAnimation.h
//  几何天气
//
//  Created by 张冬冬 on 16/5/27.
//  Copyright © 2016年 张冬冬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, ZDDTapTransitionAnimationType) {
    ZDDTapTransitionAnimationTypePresent = 1,
    ZDDTapTransitionAnimationTypeDismiss
};
@interface ZDDTapTransitionAnimation : NSObject
<
UIViewControllerAnimatedTransitioning
>
+ (instancetype)tapTransitionAnimationWithType:(ZDDTapTransitionAnimationType)type duration:(NSTimeInterval)duration;


@end
