//
//  PresentAnimation.m
//  Geometry Weather
//
//  Created by apple1 on 16/1/25.
//  Copyright © 2016年 apple1. All rights reserved.
//

#import "PresentAnimation.h"
#import "UIView+SetRect.h"
#import "YXEasing.h"
#import "MyDefine.h"
@implementation PresentAnimation

//转场时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 1.f;
}

//转场动画
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    //初始位置
    toView.y = Height;
    //获取containerView
    UIView *containerView = [transitionContext containerView];
    //apple要求将所有转场视图加到containerView里再操作
    [containerView addSubview:toView];
    //获取转场时间
    CGFloat duration = [self transitionDuration:transitionContext];
    
    //起点+终点
    CGPoint startPoint = toView.center;
    CGPoint endPoint = containerView.center;
    
    //缓动函数+关键帧动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    animation.values = [YXEasing calculateFrameFromPoint:startPoint toPoint:endPoint func:ExponentialEaseOut frameCount:duration*60];
    animation.duration = duration;
    toView.center = containerView.center;
    
    [toView.layer addAnimation:animation forKey:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [transitionContext completeTransition:YES];
    });
 
}



@end
