//
//  ZDDShareTransitionAnimation.m
//  几何天气
//
//  Created by 张冬冬 on 16/5/25.
//  Copyright © 2016年 张冬冬. All rights reserved.
//

#import "ZDDShareTransitionAnimation.h"
#import "MyDefine.h"
#import "GlobalFunction.h"
#import "YXEasing.h"
#import "pop/POP.h"

@interface ZDDShareTransitionAnimation ()
@property (nonatomic, assign) ZDDShareTransitionAnimationType type;
@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) CGRect frame;
@property (nonatomic, assign) CGPoint center;
@end

@implementation ZDDShareTransitionAnimation
+ (instancetype)transitionWithType:(ZDDShareTransitionAnimationType)type Duration:(NSTimeInterval)duration frame:(CGRect)frame  center:(CGPoint)center {
    
    ZDDShareTransitionAnimation *animation = [[ZDDShareTransitionAnimation alloc] init];
    animation.type = type;
    animation.duration = duration;
    animation.frame = frame;
    animation.center = center;
    
    return animation;
    
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    switch (self.type) {
        case ZDDShareTransitionAnimationTypePresent: {
            [self presentAnimation:transitionContext];
        }
            break;
        case ZDDShareTransitionAnimationTypeDismiss: {
            [self dismissAnimation:transitionContext];
        }
            break;
        default:
            break;
    }
    
}

- (void)presentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    fromView.userInteractionEnabled = NO;
    fromView.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
    
    UIView *dimmingView = [[UIView alloc]initWithFrame:fromView.bounds];
    dimmingView.layer.opacity = 0.0f;
    dimmingView.backgroundColor = color(20, 20, 20, 1);
    
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    
    toView.frame = self.frame;
    toView.center = self.center;
    
    [[transitionContext containerView] addSubview:dimmingView];
    [[transitionContext containerView] addSubview:toView];
    
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    positionAnimation.toValue = @(transitionContext.containerView.center.x);
    positionAnimation.springBounciness = 10;
    [positionAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.springBounciness = 20;
    scaleAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(1.4, 1.2)];
    
    POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnimation.toValue = @(0.6);
    
    [toView.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    [toView.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    [dimmingView.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation"];
    
}

- (void)dismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    toView.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
    toView.userInteractionEnabled = YES;
    
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    UIView *containerView = [transitionContext containerView];
    UIView *dimmingView = containerView.subviews[0];
    
    
    
    POPBasicAnimation *sizeAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewSize];
//    sizeAnimation.springBounciness = 10;
    sizeAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(0, 0)];
    [sizeAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    [fromView.layer pop_addAnimation:sizeAnimation forKey:@"sizeAnimation"];
    
    
    [UIView animateWithDuration:self.duration animations:^{
        dimmingView.layer.opacity = 0.f;
    }];
    
    


}

@end
