//
//  DismissAnimation.m
//  Geometry Weather
//
//  Created by apple1 on 16/1/25.
//  Copyright © 2016年 apple1. All rights reserved.
//

#import "DismissAnimation.h"
#import "UIView+SetRect.h"
#import "YXEasing.h"
#import "MyDefine.h"
@implementation DismissAnimation
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:fromView];
    
    CGFloat duration = [self transitionDuration:transitionContext];
    
    CGPoint startPoint = containerView.center;
    CGPoint endPoint = CGPointMake(containerView.middleX, containerView.middleY + Height);
    CAKeyframeAnimation *animaiton = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animaiton.duration = duration;
    animaiton.values = [YXEasing calculateFrameFromPoint:startPoint toPoint:endPoint func:CubicEaseIn frameCount:60*duration];
    
    fromView.center = endPoint;
    [fromView.layer addAnimation:animaiton forKey:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [transitionContext completeTransition:YES];
    });

}





@end
