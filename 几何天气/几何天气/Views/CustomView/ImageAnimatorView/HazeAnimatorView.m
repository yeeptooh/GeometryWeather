//
//  HazeAnimatorView.m
//  Geometry Weather
//
//  Created by apple1 on 16/1/25.
//  Copyright © 2016年 apple1. All rights reserved.
//

#import "HazeAnimatorView.h"
@interface HazeAnimatorView ()
@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UIImageView *imageView1;
@property (nonatomic, strong)UIImageView *imageView2;
@property (nonatomic, strong)UIImageView *imageView3;
@property (nonatomic, strong)UIImageView *imageView4;
@end
@implementation HazeAnimatorView

- (instancetype)initWithPoint:(CGPoint)point{
    self = [super init];
    if (self) {

        self.imageView = [[UIImageView alloc]init];
        self.imageView.image = [UIImage imageNamed:@"bhazehou"];
        self.imageView.frame = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);

        self.imageView.layer.shadowOffset = CGSizeMake(10, 10);
        self.imageView.layer.shadowOpacity = 0.3;
        self.imageView.layer.shadowRadius  = 2.8;
        self.imageView.layer.shouldRasterize = YES;

        self.imageView1 = [[UIImageView alloc]init];
        self.imageView1.image = [UIImage imageNamed:@"bhazeqian"];
        self.imageView1.frame = CGRectMake(self.imageView.image.size.width*2/3, self.imageView.image.size.height - self.imageView1.image.size.height , self.imageView1.image.size.width, self.imageView1.image.size.height);

        self.imageView1.layer.shadowOffset = CGSizeMake(10, 10);
        self.imageView1.layer.shadowOpacity = 0.3;
        self.imageView1.layer.shadowRadius  = 2.8;
        self.imageView1.layer.shouldRasterize = YES;

        self.imageView2 = [[UIImageView alloc]init];
        self.imageView2.image = [UIImage imageNamed:@"bmai"];
        self.imageView2.frame = CGRectMake(- self.imageView2.image.size.width, self.imageView.image.size.height, self.imageView2.image.size.width, self.imageView2.image.size.height);

        self.imageView3 = [[UIImageView alloc]init];
        self.imageView3.image = [UIImage imageNamed:@"bmai"];
        self.imageView3.frame = CGRectMake(self.imageView2.image.size.width, self.imageView.image.size.height + self.imageView2.image.size.height*2, self.imageView2.image.size.width, self.imageView2.image.size.height);

        self.imageView4 = [[UIImageView alloc]init];
        self.imageView4.image = [UIImage imageNamed:@"bmai"];
        self.imageView4.frame = CGRectMake(- self.imageView2.image.size.width, self.imageView.image.size.height + self.imageView2.image.size.height*4, self.imageView4.image.size.width, self.imageView4.image.size.height);


        UIView *containerView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.imageView2.image.size.width, self.imageView.image.size.height + self.imageView2.image.size.height * 5)];
        containerView1.center = point;
        containerView1.layer.masksToBounds = YES;
        UIView *containerView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.imageView.image.size.width*2/3 + self.imageView1.image.size.width, self.imageView.image.size.height)];
        containerView2.center = CGPointMake(containerView1.bounds.size.width/2, self.imageView.image.size.height/2);
        [containerView1 addSubview:containerView2];

        
        [containerView2 addSubview:self.imageView];
        [containerView2 addSubview:self.imageView1];
        [containerView1 addSubview:self.imageView2];
        [containerView1 addSubview:self.imageView3];
        [containerView1 addSubview:self.imageView4];
        [self addSubview:containerView1];
        [self showAnimatioin];

    }
    return self;
}


- (void)showAnimatioin{
    
    [UIView animateWithDuration:0.3f delay:2.f options: UIViewAnimationOptionCurveEaseInOut  animations:^{
        
        self.imageView2.frame = CGRectMake(0, self.imageView.image.size.height, self.imageView2.image.size.width, self.imageView2.image.size.height);
        self.imageView3.frame = CGRectMake(0, self.imageView.image.size.height + self.imageView2.image.size.height*2, self.imageView2.image.size.width, self.imageView2.image.size.height);
        self.imageView4.frame = CGRectMake(0, self.imageView.image.size.height + self.imageView2.image.size.height*4, self.imageView4.image.size.width, self.imageView4.image.size.height);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.2f delay:2.f options:UIViewAnimationOptionCurveEaseInOut  animations:^{
            self.imageView2.frame = CGRectMake(- self.imageView2.image.size.width, self.imageView.image.size.height, self.imageView2.image.size.width, self.imageView2.image.size.height);
            self.imageView3.frame = CGRectMake(self.imageView2.image.size.width, self.imageView.image.size.height + self.imageView2.image.size.height*2, self.imageView2.image.size.width, self.imageView2.image.size.height);
            self.imageView4.frame = CGRectMake(- self.imageView2.image.size.width, self.imageView.image.size.height + self.imageView2.image.size.height*4, self.imageView2.image.size.width, self.imageView2.image.size.height);
            
        } completion:^(BOOL finished) {
            
            [self showAnimatioin];
            
            
        }];
        
    }];
    
}


@end
