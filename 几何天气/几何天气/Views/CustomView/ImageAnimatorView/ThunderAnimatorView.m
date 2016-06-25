//
//  ThunderAnimatorView.m
//  Geometry Weather
//
//  Created by apple1 on 16/1/25.
//  Copyright © 2016年 apple1. All rights reserved.
//

#import "ThunderAnimatorView.h"
#import "POP.h"
@interface ThunderAnimatorView ()

@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UIImageView *imageView1;
@property (nonatomic, strong)UIImageView *imageView2;
@property (nonatomic, strong)UIView *containerView;
@property (nonatomic, strong)UIView *containerView1;
@property (nonatomic, strong)UIView *containerView2;
@end

@implementation ThunderAnimatorView

- (instancetype)initWithPoint:(CGPoint)point{
    self = [super init];
    if (self) {
        
        self.imageView = [[UIImageView alloc]init];
        self.imageView.image = [UIImage imageNamed:@"bthunderhou"];
        self.imageView.frame = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
        self.imageView.layer.shadowOffset = CGSizeMake(10, 10);
        self.imageView.layer.shadowOpacity = 0.3;
        self.imageView.layer.shadowRadius  = 2.8;
        self.imageView.layer.shouldRasterize = YES;
        
        self.imageView1 = [[UIImageView alloc]init];
        self.imageView1.image = [UIImage imageNamed:@"bthunderqian"];
        self.imageView1.frame = CGRectMake(self.imageView.image.size.width*2/3, self.imageView.image.size.height - self.imageView1.image.size.height, self.imageView1.image.size.width, self.imageView1.image.size.height);
        
        self.imageView1.layer.shadowOffset = CGSizeMake(10, 10);
        self.imageView1.layer.shadowOpacity = 0.3;
        self.imageView1.layer.shadowRadius  = 2.8;
        self.imageView1.layer.shouldRasterize = YES;
        
        self.imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"thunder"]];
        self.imageView2.center = CGPointMake((self.imageView.image.size.width*2/3 + self.imageView1.image.size.width) / 2, self.imageView2.image.size.height*2/3);
        
        self.imageView2.layer.shadowOffset = CGSizeMake(10, 10);
        self.imageView2.layer.shadowOpacity = 0.3;
        self.imageView2.layer.shadowRadius  = 2.8;
        self.imageView2.layer.shouldRasterize = YES;
        
        
        self.containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.imageView.image.size.width*2/3 + self.imageView1.image.size.width, self.imageView.image.size.height + self.imageView2.image.size.height * 7 / 6)];
        self.containerView.backgroundColor = [UIColor clearColor];
        self.containerView.center = CGPointMake(point.x, point.y + self.imageView.image.size.height/8);
        
        
       
        
        self.containerView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.imageView.image.size.width*2/3 + self.imageView1.image.size.width, self.imageView.image.size.height)];
        self.containerView1.backgroundColor = [UIColor clearColor];
        
        self.containerView2 = [[UIView alloc]initWithFrame:CGRectMake(0, self.imageView.image.size.height, self.imageView.image.size.width*2/3 + self.imageView1.image.size.width, self.imageView2.image.size.height * 7 / 6)];
        self.containerView2.backgroundColor = [UIColor clearColor];
        
        
        [self.containerView addSubview:self.containerView1];
        [self.containerView addSubview:self.containerView2];
        
        [self.containerView1 addSubview:self.imageView];
        [self.containerView1 addSubview:self.imageView1];
        [self.containerView2 addSubview:self.imageView2];
        
        [self addSubview:self.containerView];
        [self delay];
        
    }
    return self;
}

- (void)shakeAnimation{
    
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    positionAnimation.velocity = @800;
    positionAnimation.springBounciness = 20;
    [positionAnimation setCompletionBlock:^(POPAnimation *animation, BOOL is) {
        [self scaleAnimation1];
    }];
    
    [self.containerView1.layer pop_addAnimation:positionAnimation forKey:nil];
    
    
}

- (void)scaleAnimation1{
    self.imageView2.alpha = 1;
    
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.0, 1.0)];
    scaleAnimation.velocity = [NSValue valueWithCGSize:CGSizeMake(20.f, 20.f)];
    scaleAnimation.springBounciness = 20;
    [self.imageView2.layer pop_addAnimation:scaleAnimation forKey:nil];
    
    [scaleAnimation setCompletionBlock:^(POPAnimation *animation, BOOL is) {
        [self scaleAnimation2];
    }];
    
}


- (void)scaleAnimation2{
    
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.0, 1.0)];
    scaleAnimation.velocity = [NSValue valueWithCGSize:CGSizeMake(35.f, 35.f)];
    scaleAnimation.springBounciness = 20;
    [self.imageView2.layer pop_addAnimation:scaleAnimation forKey:nil];
    
    [scaleAnimation setCompletionBlock:^(POPAnimation *animation, BOOL is) {
        
        [self alphaAnimation];
    }];
    
}

- (void)alphaAnimation{
    POPBasicAnimation *alphaAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    alphaAnimation.toValue = @(0);
    alphaAnimation.duration = 1.f;
    [self.imageView2 pop_addAnimation:alphaAnimation forKey:nil];
    
    [alphaAnimation setCompletionBlock:^(POPAnimation *animation, BOOL is) {
        if (is) {
            
            [self delay];
            
        }
    }];
    
}

- (void)delay{
    [self performSelector:@selector(shakeAnimation) withObject:nil afterDelay:1.f];
}


@end
