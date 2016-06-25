//
//  ZDDTransitionAnimation.m
//  几何天气
//
//  Created by 张冬冬 on 16/5/23.
//  Copyright © 2016年 张冬冬. All rights reserved.
//

#import "ZDDTransitionAnimation.h"
#import "MyDefine.h"
#import "GlobalFunction.h"
#import "YXEasing.h"
#import "pop/POP.h"
@interface ZDDTransitionAnimation ()
@property (nonatomic, assign) ZDDTransitionAnimationType type;
@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat containerHeight;
@property (nonatomic, assign) CGPoint scale;
@end
@implementation ZDDTransitionAnimation
+ (instancetype)transitionWithType:(ZDDTransitionAnimationType)type Duration:(NSTimeInterval)duration PresentHeight:(CGFloat)height containerHeight:(CGFloat)containerHeight Scale:(CGPoint)scale{
    
    ZDDTransitionAnimation *animation = [[ZDDTransitionAnimation alloc] init];
    animation.type = type;
    animation.duration = duration;
    animation.height = height;
    animation.containerHeight = containerHeight;
    animation.scale = scale;
    return animation;
    
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    switch (self.type) {
        case ZDDTransitionAnimationTypePresent: {
            [self presentAnimation:transitionContext];
        }
            break;
        case ZDDTransitionAnimationTypeDismiss: {
            [self dismissAnimation:transitionContext];
        }
            break;
        default:
            break;
    }
    
}

- (void)presentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *tempView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
    tempView.frame = fromVC.view.frame;
    
    UIView *containerView = [transitionContext containerView];
    toVC.view.frame = CGRectMake(0, Height, Width, self.height);
    
    UIView *statusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 20)];
    statusView.backgroundColor = kNavBgColor;
    
    [containerView addSubview:tempView];
    [containerView addSubview:statusView];
    [containerView addSubview:toVC.view];
    
    fromVC.view.hidden = YES;

    [UIView animateKeyframesWithDuration:self.duration delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        
        
        [UIView addKeyframeWithRelativeStartTime:0.2f relativeDuration:self.duration * 0.7f animations:^{
            
            statusView.backgroundColor = [UIColor blackColor];
            tempView.transform = CGAffineTransformTranslate(tempView.transform, 0, -self.containerHeight * 0.6);
            tempView.transform = CGAffineTransformScale(tempView.transform, self.scale.x, self.scale.y);
            tempView.alpha = 0.6;
 
        }];
        
        
        [UIView addKeyframeWithRelativeStartTime:0.1f relativeDuration:self.duration * 0.8f animations:^{

            toVC.view.transform = CGAffineTransformTranslate(toVC.view.transform, 0, -self.height);
            
        }];
       
        
    } completion:^(BOOL finished) {

        [transitionContext completeTransition:finished];//![transitionContext transitionWasCancelled]];
    }];
    
    
}

- (void)dismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC =  [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    UIView *tempView = containerView.subviews[0];
    UIView *statusView = containerView.subviews[1];
    //关键帧过渡动画
    [UIView animateKeyframesWithDuration:self.duration delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0.f relativeDuration:self.duration * 0.7f animations:^{
            statusView.backgroundColor = kNavBgColor;
            tempView.layer.transform = CATransform3DIdentity;
            tempView.alpha = 1.0;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.05f relativeDuration:self.duration * 0.65f animations:^{

            fromVC.view.transform = CGAffineTransformTranslate(fromVC.view.transform, 0, self.height);
            
        }];
       
    } completion:^(BOOL finished) {
        toVC.view.hidden = NO;
        [tempView removeFromSuperview];
        
        [transitionContext completeTransition:finished];//![transitionContext transitionWasCancelled]];
    }];

}


@end
