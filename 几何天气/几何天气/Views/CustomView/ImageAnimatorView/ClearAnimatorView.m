//
//  ClearAnimatorView.m
//  Geometry Weather
//
//  Created by apple1 on 16/1/25.
//  Copyright © 2016年 apple1. All rights reserved.
//

#import "ClearAnimatorView.h"
#import "POP.h"
#import "YXEasing.h"

@interface ClearAnimatorView ()
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIImageView *imageView2;

@end
@implementation ClearAnimatorView

- (instancetype)initWithPoint:(CGPoint)point{
    self = [super init];
    if (self) {

        self.imageView = [[UIImageView alloc]init];
        self.imageView.image = [UIImage imageNamed:@"bshimmer"];
        self.imageView.frame = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
        self.imageView.center =point;
        
        self.imageView.layer.shadowOffset = CGSizeMake(7, 7);
        self.imageView.layer.shadowOpacity = 0.2;
        self.imageView.layer.shadowRadius  = 2.0;
        self.imageView.layer.shouldRasterize = YES;
        
        
        
        self.imageView1 = [[UIImageView alloc]init];
        self.imageView1.image = [UIImage imageNamed:@"bback"];
        self.imageView1.frame = CGRectMake(0, 0, self.imageView1.image.size.width, self.imageView1.image.size.height);
        self.imageView1.center =point;
        self.imageView1.layer.shadowOffset = CGSizeMake(7, 7);
        self.imageView1.layer.shadowOpacity = 0.2;
        self.imageView1.layer.shadowRadius  = 2.8;
        self.imageView1.layer.shouldRasterize = YES;
        
        
        self.imageView2 = [[UIImageView alloc]init];
        self.imageView2.image = [UIImage imageNamed:@"bfore"];
        self.imageView2.frame = CGRectMake(0, 0, self.imageView2.image.size.width, self.imageView2.image.size.height);
        self.imageView2.center =point;
        

        [self addSubview:self.imageView];
        [self addSubview:self.imageView1];
        [self addSubview:self.imageView2];
        
        [self showAnimatioin];
    }
    return self;
}


- (void)showAnimatioin {
    
    
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.8f delay:0.4 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.imageView.alpha = 1;
        
        weakSelf.imageView2.transform = CGAffineTransformRotate(weakSelf.imageView2.transform, M_PI);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.8f delay:0.4 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            weakSelf.imageView.alpha = 0.2;
            
            weakSelf.imageView2.transform = CGAffineTransformRotate(weakSelf.imageView2.transform, -M_PI*3);
        } completion:^(BOOL finished) {
            [weakSelf showAnimatioin];
            
        }];
    }];
  
}

@end
