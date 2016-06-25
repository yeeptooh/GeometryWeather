//
//  CloudAnimatorView.m
//  Geometry Weather
//
//  Created by apple1 on 16/1/25.
//  Copyright © 2016年 apple1. All rights reserved.
//

#import "CloudAnimatorView.h"

@interface CloudAnimatorView ()

@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UIImageView *imageView1;
@property (nonatomic, strong)UIImageView *imageView2;
@property (nonatomic, strong)UIImageView *imageView3;
@property (nonatomic, strong)UIView *containerView;

@end

@implementation CloudAnimatorView
- (instancetype)initWithPoint:(CGPoint)point{
    self = [super init];
    if (self) {
        
        self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bcloudhou"]];
        self.imageView.frame = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
        
        self.imageView.layer.shadowOffset = CGSizeMake(10, 10);
        self.imageView.layer.shadowOpacity = 0.3;
        self.imageView.layer.shadowRadius  = 2.8;
        self.imageView.layer.shouldRasterize = YES;
        
        
        self.imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bcloudqian"]];
        self.imageView1.frame = CGRectMake(self.imageView.image.size.width*2/3, self.imageView.image.size.height - self.imageView1.image.size.height, self.imageView1.image.size.width, self.imageView1.image.size.height);
        
        self.imageView1.layer.shadowOffset = CGSizeMake(10, 10);
        self.imageView1.layer.shadowOpacity = 0.3;
        self.imageView1.layer.shadowRadius  = 2.8;
        self.imageView1.layer.shouldRasterize = YES;
        
        self.containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.imageView.image.size.width*2/3+self.imageView1.image.size.width, self.imageView.image.size.height)];
        self.containerView.center = point;
        
        self.imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bsunhou"]];
        
        self.imageView2.center = CGPointMake(self.imageView1.center.x, self.imageView.center.y);
        
        
        self.imageView3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bsunqian"]];

        self.imageView3.center = self.imageView2.center;
        
        [self.containerView addSubview:self.imageView2];
        [self.containerView addSubview:self.imageView3];
        [self.containerView addSubview:self.imageView];
        [self.containerView addSubview:self.imageView1];
        [self addSubview:self.containerView];
        
        [self showAnimatioin];

        
    }
    return self;
}

- (void)showAnimatioin{
    
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"position"];
        animation1.duration = .2;
        animation1.toValue = [NSValue valueWithCGPoint:CGPointMake(self.imageView.center.x, self.imageView1.center.y  - 5)];
        animation1.removedOnCompletion = NO;
        animation1.fillMode = kCAFillModeForwards;
        
        [self.imageView2.layer addAnimation:animation1 forKey:nil];
        [self.imageView3.layer addAnimation:animation1 forKey:nil];
        
        
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            self.imageView2.layer.position = CGPointMake(self.imageView.center.x, self.imageView1.center.y);
            self.imageView3.layer.position = CGPointMake(self.imageView.center.x, self.imageView1.center.y);
            
            
            CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"position"];
            
            animation2.duration = 0.2;
            animation2.toValue = [NSValue valueWithCGPoint:CGPointMake(self.imageView.center.x - self.imageView.bounds.size.width/4, self.imageView1.center.y)];
            animation2.removedOnCompletion = NO;
            animation2.fillMode = kCAFillModeForwards;
            [self.imageView2.layer addAnimation:animation2 forKey:nil];
            [self.imageView3.layer addAnimation:animation2 forKey:nil];
            
            
            
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                self.imageView2.layer.position = CGPointMake(self.imageView.center.x - self.imageView.bounds.size.width/4, self.imageView1.center.y);
                self.imageView3.layer.position = CGPointMake(self.imageView.center.x - self.imageView.bounds.size.width/4, self.imageView1.center.y);
                CGMutablePathRef path = CGPathCreateMutable();
                CGPathMoveToPoint(path, NULL, self.imageView3.center.x, self.imageView3.center.y);
                CGFloat x = self.imageView1.center.x - (self.imageView.center.x - self.imageView.bounds.size.width/4);
                
                CGFloat y = self.imageView1.center.y - self.imageView.center.y;
                
                CGFloat x1 = sqrt(2)*x/2;
                CGFloat y1 = sqrt(2)*y/2;
                
                CGFloat x2 = self.imageView1.center.x - x1 - 15;
                CGFloat y2 = self.imageView.center.y - 5 - y1 - 35;
                
                CGPathAddQuadCurveToPoint(path, NULL, x2, y2, self.imageView1.center.x, self.imageView.center.y);
                
                
                
                CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
                animation.path = path;
                CGPathRelease(path);
                
                animation.duration = 0.4;
                animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
                animation.removedOnCompletion = NO;
                animation.fillMode = kCAFillModeForwards;
                
                [self.imageView3.layer addAnimation:animation forKey:nil];
                [self.imageView2.layer addAnimation:animation forKey:nil];
                
                self.imageView2.layer.position = CGPointMake(self.imageView1.center.x, self.imageView.center.y);
                self.imageView3.layer.position = CGPointMake(self.imageView1.center.x, self.imageView.center.y);
                
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    [self showAnimatioin];
                    
                });
            });
        });
    });
    
}



@end
