//
//  WindAnimatorView.m
//  Geometry Weather
//
//  Created by apple1 on 16/1/25.
//  Copyright © 2016年 apple1. All rights reserved.
//

#import "WindAnimatorView.h"
#import "MyDefine.h"

@interface WindAnimatorView ()

@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UIImageView *imageView1;
@property (nonatomic, strong)UIImageView *imageView2;
@property (nonatomic, strong)UIImageView *imageView3;
@property (nonatomic, strong)UIView *containerView;
@property (nonatomic, strong)UIView *containerView1;
@property (nonatomic, assign)CGPoint point;

@end

@implementation WindAnimatorView

- (instancetype)initWithPoint:(CGPoint)point{
    self = [super init];
    if (self) {
        
        self.point = point;
        //两朵云
        self.imageView = [[UIImageView alloc]init];
        self.imageView.image = [UIImage imageNamed:@"byunhou"];
        self.imageView.frame = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
        
        self.imageView.layer.shadowOffset = CGSizeMake(10, 10);
        self.imageView.layer.shadowOpacity = 0.3;
        self.imageView.layer.shadowRadius  = 2.8;
        self.imageView.layer.shouldRasterize = YES;
        
        
        self.imageView1 = [[UIImageView alloc]init];
        self.imageView1.image = [UIImage imageNamed:@"byunqian"];
        self.imageView1.frame = CGRectMake(self.imageView.image.size.width * 2 / 3,   self.imageView.image.size.height - self.imageView1.image.size.height, self.imageView1.image.size.width, self.imageView1.image.size.height);
        
        self.imageView1.layer.shadowOffset = CGSizeMake(10, 10);
        self.imageView1.layer.shadowOpacity = 0.3;
        self.imageView1.layer.shadowRadius  = 2.8;
        self.imageView1.layer.shouldRasterize = YES;
        
        
        self.containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.imageView.image.size.width * 2 / 3 + self.imageView1.image.size.width, self.imageView.image.size.height)];
        self.containerView.backgroundColor = [UIColor clearColor];
        self.containerView.center = CGPointMake(point.x - self.imageView.image.size.width/3, point.y - self.imageView.image.size.height/4);
        
        [self.containerView addSubview:self.imageView];
        [self.containerView addSubview:self.imageView1];
        
        [self addSubview:self.containerView];
        
        
        //两个风
        self.imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"windup"]];
        self.imageView2.frame = CGRectMake(0, 0, self.imageView2.image.size.width, self.imageView2.image.size.height);
        
        self.imageView2.alpha = 0;
        
        
        self.imageView3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"winddown"]];
        self.imageView3.alpha = 0;
        
        
        self.containerView1 = [[UIView alloc]init];
        self.containerView1.backgroundColor = [UIColor redColor];
        self.containerView1.center = point;
        self.imageView2.center = CGPointMake(self.containerView1.bounds.size.width/2, self.containerView1.bounds.size.height/2);
        self.imageView3.center = CGPointMake(self.containerView1.bounds.size.width/2 + self.imageView2.image.size.width/2, self.containerView1.bounds.size.height/2 + self.imageView2.image.size.height*11/8);
        [self.containerView1 addSubview:self.imageView2];
        [self.containerView1 addSubview:self.imageView3];
        
        
        [self addSubview: self.containerView1];
        [self showAnimation];
    }
    
    return self;
}

- (void)showAnimation{
    
    
    [UIView animateWithDuration:0.5 delay:1.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.imageView2.alpha = 1;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut  animations:^{
            
            
            
            self.containerView.center = CGPointMake(self.point.x, self.containerView.center.y);
            self.imageView3.alpha = 1;
            
            
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.imageView2.alpha = 0;
                self.imageView3.alpha = 0;
                
            } completion:^(BOOL finished) {
                
                [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    
                    self.containerView.center = CGPointMake(self.point.x - self.imageView.image.size.width/3, self.point.y - self.imageView.image.size.height/4);
                    
                } completion:^(BOOL finished) {
                    
                    [self showAnimation];
                    
                }];
            }];
        }];
    }];
}


@end
