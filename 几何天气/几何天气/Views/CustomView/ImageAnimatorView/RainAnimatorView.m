//
//  RainAnimatorView.m
//  Geometry Weather
//
//  Created by apple1 on 16/1/25.
//  Copyright © 2016年 apple1. All rights reserved.
//

#import "RainAnimatorView.h"

@interface RainAnimatorView ()

@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UIImageView *imageView1;
@property (nonatomic, strong)UIImageView *imageView2;
@property (nonatomic, strong)UIImageView *imageView3;
@property (nonatomic, strong)UIImageView *imageView4;
@property (nonatomic, strong)UIImageView *imageView5;

@property (nonatomic, strong)UIView *containerView;


@end
@implementation RainAnimatorView

- (instancetype)initWithPoint:(CGPoint)point{
    self = [super init];
    if (self) {
        
        self.imageView = [[UIImageView alloc]init];
        self.imageView.image = [UIImage imageNamed:@"brainhou"];
        self.imageView.frame = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
        
        
        self.imageView.layer.shadowOffset = CGSizeMake(10, 10);
        self.imageView.layer.shadowOpacity = 0.3;
        self.imageView.layer.shadowRadius  = 2.8;
        self.imageView.layer.shouldRasterize = YES;
        
        self.imageView1 = [[UIImageView alloc]init];
        self.imageView1.image = [UIImage imageNamed:@"brainqian"];
        self.imageView1.frame = CGRectMake(self.imageView.image.size.width*2/3, self.imageView.image.size.height - self.imageView1.image.size.height, self.imageView1.image.size.width, self.imageView1.image.size.height);

        
        self.imageView2 = [[UIImageView alloc]init];
        self.imageView2.image = [UIImage imageNamed:@"bdot"];
        self.imageView2.frame = CGRectMake((self.imageView.image.size.width*2/3 + self.imageView1.image.size.width)/2 - self.imageView2.image.size.width/2, self.imageView.image.size.height, self.imageView2.image.size.width, self.imageView2.image.size.height);
        
        self.imageView2.alpha = 0;
        
        
        self.imageView3 = [[UIImageView alloc]init];
        self.imageView3.image = [UIImage imageNamed:@"bdot"];
        self.imageView3.frame = CGRectMake((self.imageView.image.size.width*2/3 + self.imageView1.image.size.width)/2- self.imageView2.image.size.width/2 - self.imageView2.bounds.size.width*1.8, self.imageView.image.size.height + self.imageView2.image.size.height*3/4, self.imageView3.image.size.width, self.imageView3.image.size.height);
        self.imageView3.alpha = 0;
        
        self.imageView4 = [[UIImageView alloc]init];
        self.imageView4.image = [UIImage imageNamed:@"bdot"];
        self.imageView4.frame = CGRectMake((self.imageView.image.size.width*2/3 + self.imageView1.image.size.width)/2- self.imageView2.image.size.width/2 + self.imageView2.bounds.size.width*1.8, self.imageView.image.size.height + self.imageView2.image.size.height*3/4, self.imageView4.image.size.width, self.imageView4.image.size.height);
        self.imageView4.alpha = 0;
        
        self.imageView5 = [[UIImageView alloc]init];
        self.imageView5.image = [UIImage imageNamed:@"bdot"];
        self.imageView5.frame = CGRectMake((self.imageView.image.size.width*2/3 + self.imageView1.image.size.width)/2 - self.imageView2.image.size.width/2, self.imageView.image.size.height + self.imageView2.image.size.height + self.imageView2.image.size.height/2, self.imageView5.image.size.width, self.imageView5.image.size.height);
        
        self.imageView5.alpha = 0;
        
        self.containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.imageView.image.size.width*2/3 + self.imageView1.image.size.width, self.imageView.image.size.height + self.imageView2.image.size.height*5/2)];
        
        self.containerView.backgroundColor = [UIColor clearColor];
        self.containerView.center = point;
        [self addSubview:self.containerView];
        
        [self.containerView addSubview:self.imageView];
        [self.containerView addSubview:self.imageView1];
        [self.containerView addSubview:self.imageView2];
        [self.containerView addSubview:self.imageView3];
        [self.containerView addSubview:self.imageView4];
        [self.containerView addSubview:self.imageView5];
        [self showAnimation];
        
    }
    return self;
}

- (void)showAnimation{
    
    [UIView animateWithDuration:0.1 delay:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.imageView2.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.imageView3.alpha = 1;
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.imageView4.alpha = 1;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    self.imageView5.alpha = 1;
                } completion:^(BOOL finished) {
                    
                    [UIView animateWithDuration:0.1 delay:1.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                        self.imageView2.alpha = 0;
                    } completion:^(BOOL finished) {
                        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            self.imageView2.alpha = 0;
                        } completion:^(BOOL finished) {
                            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                                self.imageView3.alpha = 0;
                            } completion:^(BOOL finished) {
                                [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                                    self.imageView4.alpha = 0;
                                } completion:^(BOOL finished) {
                                    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                                        self.imageView5.alpha = 0;
                                    } completion:^(BOOL finished) {
                                        [self showAnimation];
                                    }];
                                    
                                }];
                                
                            }];
                            
                        }];
                        
                    }];
                    
                }];
                
            }];
            
        }];
        
    }];
    
}


@end
