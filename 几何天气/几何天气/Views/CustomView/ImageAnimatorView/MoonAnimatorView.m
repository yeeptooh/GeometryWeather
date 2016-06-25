//
//  MoonAnimatorView.m
//  Geometry Weather
//
//  Created by apple1 on 16/1/25.
//  Copyright © 2016年 apple1. All rights reserved.
//

#import "MoonAnimatorView.h"

@interface MoonAnimatorView ()
@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UIImageView *imageView1;
@property (nonatomic, strong)UIImageView *imageView2;
@property (nonatomic, strong)UIView *containerView;


@end
@implementation MoonAnimatorView

- (instancetype)initWithPoint:(CGPoint)point{
    self = [super init];
    if (self) {
        
        
        self.imageView = [[UIImageView alloc]init];
        self.imageView.image = [UIImage imageNamed:@"moon"];
        self.imageView.frame = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
        
        self.imageView.layer.shadowOffset = CGSizeMake(10, 10);
        self.imageView.layer.shadowOpacity = 0.3;
        self.imageView.layer.shadowRadius  = 2.8;
        self.imageView.layer.shouldRasterize = YES;
        
        self.imageView1 = [[UIImageView alloc]init];
        self.imageView1.image = [UIImage imageNamed:@"bhou"];
        self.imageView1.frame = CGRectMake(0, self.imageView.image.size.height + self.imageView2.image.size.height / 2 - self.imageView1.image.size.height, self.imageView1.image.size.width, self.imageView1.image.size.height);
        
        self.imageView1.layer.shadowOffset = CGSizeMake(10, 10);
        self.imageView1.layer.shadowOpacity = 0.3;
        self.imageView1.layer.shadowRadius  = 2.8;
        self.imageView1.layer.shouldRasterize = YES;
        
        
        
        
        self.imageView2 = [[UIImageView alloc]init];
        self.imageView2.image = [UIImage imageNamed:@"bqian"];
        self.imageView2.frame = CGRectMake(self.imageView1.image.size.width*2/3, self.imageView.image.size.height - self.imageView2.image.size.height / 2, self.imageView2.image.size.width, self.imageView2.image.size.height);
        
        self.imageView2.layer.shadowOffset = CGSizeMake(10, 10);
        self.imageView2.layer.shadowOpacity = 0.3;
        self.imageView2.layer.shadowRadius  = 2.8;
        self.imageView2.layer.shouldRasterize = YES;
        
        self.containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.imageView1.image.size.width*2/3 + self.imageView2.image.size.width, self.imageView.image.size.height + self.imageView2.image.size.height / 2)];
        self.containerView.backgroundColor = [UIColor clearColor];
        self.containerView.center = point;
        self.imageView.center =CGPointMake(self.containerView.bounds.size.width / 2, self.imageView.image.size.height / 2);
        self.imageView2.center = CGPointMake(self.imageView.center.x + self.imageView2.image.size.width/3, self.imageView2.center.y);
        self.imageView1.center = CGPointMake(self.imageView.center.x - self.containerView.bounds.size.width / 6, self.containerView.bounds.size.height - self.imageView1.image.size.height + self.imageView1.image.size.height / 2);
        
        
        [self.containerView addSubview:self.imageView];
        [self.containerView addSubview:self.imageView1];
        [self.containerView addSubview:self.imageView2];
        [self addSubview:self.containerView];
        
        [self showAnimation];
       
    }
    return self;
}


- (void)showAnimation{
    
    [UIView animateWithDuration:1.5f delay:0 options:  UIViewAnimationOptionCurveEaseInOut animations:^{
        self.imageView2.center = CGPointMake(self.imageView.center.x + self.imageView2.image.size.width*2/3, self.imageView2.center.y);
        
        self.imageView1.center = CGPointMake(self.imageView.center.x - self.containerView.bounds.size.width / 4, self.containerView.bounds.size.height - self.imageView1.image.size.height + self.imageView1.image.size.height / 2);
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.5f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.imageView2.center = CGPointMake(self.imageView.center.x + self.imageView2.image.size.width/3, self.imageView2.center.y);
            self.imageView1.center = CGPointMake(self.imageView.center.x - self.containerView.bounds.size.width / 6, self.containerView.bounds.size.height - self.imageView1.image.size.height + self.imageView1.image.size.height / 2);
        
        } completion:^(BOOL finished) {
            [self showAnimation];
        }];
    }];
    
}


@end
