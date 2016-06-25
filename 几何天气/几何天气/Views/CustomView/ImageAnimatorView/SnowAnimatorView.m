//
//  SnowAnimatorView.m
//  Geometry Weather
//
//  Created by apple1 on 16/1/25.
//  Copyright © 2016年 apple1. All rights reserved.
//

#import "SnowAnimatorView.h"
@interface SnowAnimatorView ()

@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UIImageView *imageView1;

@property (nonatomic, strong)UIImageView *imageView2;
@property (nonatomic, strong)UIImageView *imageView3;
@property (nonatomic, strong)UIImageView *imageView4;
@property (nonatomic, strong)UIImageView *imageView5;
@property (nonatomic, strong)UIImageView *imageView6;

@property (nonatomic, strong)UIImageView *imageView7;
@property (nonatomic, strong)UIImageView *imageView8;
@property (nonatomic, strong)UIImageView *imageView9;
@property (nonatomic, strong)UIImageView *imageView10;
@property (nonatomic, strong)UIImageView *imageView11;

@property (nonatomic, strong)UIImageView *imageView12;
@property (nonatomic, strong)UIImageView *imageView13;
@property (nonatomic, strong)UIImageView *imageView14;
@property (nonatomic, strong)UIImageView *imageView15;
@property (nonatomic, strong)UIImageView *imageView16;
@property (nonatomic, strong)UIImageView *imageView17;

@property (nonatomic, strong)UIView *containerView;
@end
@implementation SnowAnimatorView

- (instancetype)initWithPoint:(CGPoint)point{
    self = [super init];
    if (self) {
        
        self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bsnowhou"]];
        
        self.imageView.frame = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
        
        self.imageView.layer.shadowOffset = CGSizeMake(10, 10);
        self.imageView.layer.shadowOpacity = 0.3;
        self.imageView.layer.shadowRadius  = 2.8;
        self.imageView.layer.shouldRasterize = YES;
        
        self.imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bsnowqian"]];
        self.imageView1.frame = CGRectMake(self.imageView.image.size.width*2/3, self.imageView.image.size.height - self.imageView1.image.size.height, self.imageView1.image.size.width, self.imageView1.image.size.height);
        
        self.imageView1.layer.shadowOffset = CGSizeMake(10, 10);
        self.imageView1.layer.shadowOpacity = 0.3;
        self.imageView1.layer.shadowRadius  = 2.8;
        self.imageView1.layer.shouldRasterize = YES;
        
        
        
        self.imageView2 = [[UIImageView alloc]init];
        self.imageView2.image = [UIImage imageNamed:@"snowDot"];
        self.imageView2.frame = CGRectMake(self.imageView2.image.size.width/2, self.imageView.image.size.height+self.imageView2.image.size.height/2, self.imageView2.image.size.width, self.imageView2.image.size.height);
        
        self.imageView2.alpha = 0;
        
        self.imageView3 = [[UIImageView alloc]init];
        self.imageView3.image = [UIImage imageNamed:@"snowDot"];
        self.imageView3.frame = CGRectMake(self.imageView2.image.size.width*2+self.imageView2.image.size.width/2, self.imageView.image.size.height+self.imageView2.image.size.height/2, self.imageView2.image.size.width, self.imageView2.image.size.height);
        
        
        self.imageView3.alpha = 0;
        
        self.imageView4 = [[UIImageView alloc]init];
        self.imageView4.image = [UIImage imageNamed:@"snowDot"];
        self.imageView4.frame = CGRectMake(self.imageView2.image.size.width*4+self.imageView2.image.size.width/2, self.imageView.image.size.height+self.imageView2.image.size.height/2, self.imageView3.image.size.width, self.imageView3.image.size.height);
        
        self.imageView4.alpha = 0;
        
        
        self.imageView5 = [[UIImageView alloc]init];
        self.imageView5.image = [UIImage imageNamed:@"snowDot"];
        self.imageView5.frame = CGRectMake(self.imageView2.image.size.width*6+self.imageView2.image.size.width/2, self.imageView.image.size.height+self.imageView2.image.size.height/2, self.imageView4.image.size.width, self.imageView4.image.size.height);
        self.imageView5.alpha = 0;
        
        self.imageView6 = [[UIImageView alloc]init];
        self.imageView6.image = [UIImage imageNamed:@"snowDot"];
        self.imageView6.frame = CGRectMake(self.imageView2.image.size.width*8+self.imageView2.image.size.width/2, self.imageView.image.size.height+self.imageView2.image.size.height/2, self.imageView5.image.size.width, self.imageView5.image.size.height);
        
        self.imageView6.alpha = 0;
        
        //2排
        
        self.imageView7 = [[UIImageView alloc]init];
        self.imageView7.image = [UIImage imageNamed:@"snowDot"];
        self.imageView7.frame = CGRectMake(self.imageView.image.size.width*2/3+self.imageView1.image.size.width - self.imageView2.image.size.width-self.imageView2.image.size.width/2, self.imageView.image.size.height+self.imageView2.image.size.height*2, self.imageView6.image.size.width, self.imageView6.image.size.height);
        
        self.imageView7.alpha = 0;
        
        
        self.imageView8 = [[UIImageView alloc]init];
        self.imageView8.image = [UIImage imageNamed:@"snowDot"];
        self.imageView8.frame = CGRectMake(self.imageView.image.size.width*2/3+self.imageView1.image.size.width - self.imageView2.image.size.width*3-self.imageView2.image.size.width/2, self.imageView.image.size.height+self.imageView2.image.size.height*2, self.imageView7.image.size.width, self.imageView7.image.size.height);
        
        self.imageView8.alpha = 0;
        
        self.imageView9 = [[UIImageView alloc]init];
        self.imageView9.image = [UIImage imageNamed:@"snowDot"];
        self.imageView9.frame = CGRectMake(self.imageView.image.size.width*2/3+self.imageView1.image.size.width - self.imageView2.image.size.width*5-self.imageView2.image.size.width/2, self.imageView.image.size.height+self.imageView2.image.size.height*2, self.imageView9.image.size.width, self.imageView9.image.size.height);
        
        self.imageView9.alpha = 0;
        
        
        self.imageView10 = [[UIImageView alloc]init];
        self.imageView10.image = [UIImage imageNamed:@"snowDot"];
        self.imageView10.frame = CGRectMake(self.imageView.image.size.width*2/3+self.imageView1.image.size.width - self.imageView2.image.size.width*7-self.imageView2.image.size.width/2, self.imageView.image.size.height+self.imageView2.image.size.height*2, self.imageView9.image.size.width, self.imageView9.image.size.height);
        self.imageView10.alpha = 0;
        
        
        self.imageView11 = [[UIImageView alloc]init];
        self.imageView11.image = [UIImage imageNamed:@"snowDot"];
        self.imageView11.frame = CGRectMake(self.imageView.image.size.width*2/3+self.imageView1.image.size.width - self.imageView2.image.size.width*9-self.imageView2.image.size.width/2, self.imageView.image.size.height+self.imageView2.image.size.height*2, self.imageView10.image.size.width, self.imageView10.image.size.height);
        
        self.imageView11.alpha = 0;
        
        
        //3排
        
        self.imageView12 = [[UIImageView alloc]init];
        self.imageView12.image = [UIImage imageNamed:@"snowDot"];
        self.imageView12.frame = CGRectMake(self.imageView2.image.size.width/2, self.imageView.image.size.height+self.imageView2.image.size.height*7/2, self.imageView11.image.size.width, self.imageView11.image.size.height);
        
        self.imageView12.alpha = 0;
        
        
        self.imageView13 = [[UIImageView alloc]init];
        self.imageView13.image = [UIImage imageNamed:@"snowDot"];
        self.imageView13.frame = CGRectMake(self.imageView2.image.size.width*2+self.imageView2.image.size.width/2, self.imageView.image.size.height+self.imageView2.image.size.height*7/2, self.imageView12.image.size.width, self.imageView12.image.size.height);
        
        self.imageView13.alpha = 0;
        
        
        
        self.imageView14 = [[UIImageView alloc]init];
        self.imageView14.image = [UIImage imageNamed:@"snowDot"];
        self.imageView14.frame = CGRectMake(self.imageView2.image.size.width*4+self.imageView2.image.size.width/2, self.imageView.image.size.height+self.imageView2.image.size.height*7/2, self.imageView13.image.size.width, self.imageView13.image.size.height);
        
        self.imageView14.alpha = 0;
        
        
        self.imageView15 = [[UIImageView alloc]init];
        self.imageView15.image = [UIImage imageNamed:@"snowDot"];
        self.imageView15.frame = CGRectMake(self.imageView2.image.size.width*6+self.imageView2.image.size.width/2, self.imageView.image.size.height+self.imageView2.image.size.height*7/2, self.imageView15.image.size.width, self.imageView15.image.size.height);
        
        self.imageView15.alpha = 0;
        
        self.imageView16 = [[UIImageView alloc]init];
        self.imageView16.image = [UIImage imageNamed:@"snowDot"];
        self.imageView16.frame = CGRectMake(self.imageView2.image.size.width*8+self.imageView2.image.size.width/2, self.imageView.image.size.height+self.imageView2.image.size.height*7/2, self.imageView15.image.size.width, self.imageView15.image.size.height);
        
        self.imageView16.alpha = 0;
        
        self.containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.imageView.image.size.width*2/3+self.imageView1.image.size.width, self.imageView.image.size.height + self.imageView2.image.size.height*9/2)];
        self.containerView.center = CGPointMake(point.x - 5, point.y);
        [self addSubview:self.containerView];
        
        [self.containerView addSubview:self.imageView];
        [self.containerView addSubview:self.imageView1];
        [self.containerView addSubview:self.imageView2];
        [self.containerView addSubview:self.imageView3];
        [self.containerView addSubview:self.imageView4];
        [self.containerView addSubview:self.imageView5];
        [self.containerView addSubview:self.imageView6];
        
        [self.containerView addSubview:self.imageView7];
        [self.containerView addSubview:self.imageView8];
        [self.containerView addSubview:self.imageView9];
        [self.containerView addSubview:self.imageView10];
        [self.containerView addSubview:self.imageView11];
        
        [self.containerView addSubview:self.imageView12];
        [self.containerView addSubview:self.imageView13];
        [self.containerView addSubview:self.imageView14];
        [self.containerView addSubview:self.imageView15];
        [self.containerView addSubview:self.imageView16];

        [self showAnimatioin];
        
    }
    return self;
}


- (void)showAnimatioin{
    
    [UIView animateWithDuration:0.8 delay:1.5 options: UIViewAnimationOptionCurveLinear animations:^{
        self.imageView2.alpha = 1;
        self.imageView3.alpha = 1;
        self.imageView4.alpha = 1;
        self.imageView5.alpha = 1;
        self.imageView6.alpha = 1;
        
        
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.8 delay:0 options:UIViewAnimationOptionCurveLinear  animations:^{
            
            self.imageView2.alpha = 0;
            self.imageView3.alpha = 0;
            self.imageView4.alpha = 0;
            self.imageView5.alpha = 0;
            self.imageView6.alpha = 0;
            
            self.imageView7.alpha = 1;
            self.imageView8.alpha = 1;
            self.imageView9.alpha = 1;
            self.imageView10.alpha = 1;
            self.imageView11.alpha = 1;
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.8 delay:0 options: UIViewAnimationOptionCurveLinear animations:^{
                
                self.imageView7.alpha = 0;
                self.imageView8.alpha = 0;
                self.imageView9.alpha = 0;
                self.imageView10.alpha = 0;
                self.imageView11.alpha = 0;
                
                self.imageView12.alpha = 1;
                self.imageView13.alpha = 1;
                self.imageView14.alpha = 1;
                self.imageView15.alpha = 1;
                self.imageView16.alpha = 1;
                
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.8 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    self.imageView12.alpha = 0;
                    self.imageView13.alpha = 0;
                    self.imageView14.alpha = 0;
                    self.imageView15.alpha = 0;
                    self.imageView16.alpha = 0;
                } completion:^(BOOL finished) {
                    [self showAnimatioin];
                }];
                
            }];
            
        }];
        
    }];
    
}


@end
