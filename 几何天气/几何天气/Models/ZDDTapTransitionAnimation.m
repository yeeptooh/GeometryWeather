
//
//  ZDDTapTransitionAnimation.m
//  几何天气
//
//  Created by 张冬冬 on 16/5/27.
//  Copyright © 2016年 张冬冬. All rights reserved.
//

#import "ZDDTapTransitionAnimation.h"
#import "MyDefine.h"


@interface ZDDTapTransitionAnimation ()
@property (nonatomic, assign) ZDDTapTransitionAnimationType type;
@property (nonatomic, assign) NSTimeInterval duration;

@end

@implementation ZDDTapTransitionAnimation
+ (instancetype)tapTransitionAnimationWithType:(ZDDTapTransitionAnimationType)type duration:(NSTimeInterval)duration {
    
    ZDDTapTransitionAnimation *animation = [[ZDDTapTransitionAnimation alloc] init];
    animation.type = type;
    animation.duration = duration;
    
    return animation;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (self.type) {
        case ZDDTapTransitionAnimationTypePresent: {
            [self present:transitionContext];
        }
            break;
        case ZDDTapTransitionAnimationTypeDismiss: {
            [self dismiss:transitionContext];
        }
            break;
        default:
            break;
    }
}

- (void)present:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    UIView *tempView = [fromVC.view snapshotViewAfterScreenUpdates:YES];
    [containerView addSubview:fromVC.view];
    [containerView addSubview:tempView];
    [containerView addSubview:toVC.view];
    fromVC.view.hidden = YES;
    toVC.view.alpha = 0;
    
    fromVC.view.frame = CGRectMake(0, 0, Width, Height);
    toVC.view.frame = CGRectMake(0, 0, Width, Height);
    
    [UIView animateWithDuration:self.duration animations:^{
        toVC.view.alpha = 1;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
  
}

- (void)dismiss:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    UIView *fromView = containerView.subviews.lastObject;
    UIView *tempView = containerView.subviews[1];
    UIView *toView   = containerView.subviews[0];
    [UIView animateWithDuration:self.duration animations:^{
        
        fromView.alpha = 0;
        
    } completion:^(BOOL finished) {
        toView.hidden = NO;
        [[[UIApplication sharedApplication]keyWindow]addSubview:toView];
        [tempView removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
    
    
}

@end
