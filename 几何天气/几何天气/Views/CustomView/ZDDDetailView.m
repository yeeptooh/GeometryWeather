//
//  ZDDDetailView.m
//  天气weather
//
//  Created by apple1 on 16/1/21.
//  Copyright © 2016年 apple1. All rights reserved.
//

#import "ZDDDetailView.h"
#import "MyDefine.h"

@interface ZDDDetailView ()

@property (nonatomic, strong)UILabel *label1;
@property (nonatomic, strong)UILabel *label2;
@property (nonatomic, strong)UILabel *label3;
@property (nonatomic, strong)UILabel *label4;
@property (nonatomic, strong)UILabel *label5;
@property (nonatomic, strong)UILabel *label6;

@end

@implementation ZDDDetailView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *breakerView = [[UIView alloc]initWithFrame:CGRectMake(0, 1, self.bounds.size.width, 1)];
        breakerView.layer.shadowRadius = 1;
        breakerView.layer.shadowOpacity = 0.6;
        breakerView.layer.shadowOffset = CGSizeMake(0, 2);
        breakerView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2];
        breakerView.layer.shadowPath = [[UIBezierPath bezierPathWithRect:breakerView.bounds]CGPath];
        
        [self addSubview:breakerView];
        
        
        self.view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width/6, self.bounds.size.height/3)];
        
        self.view2 = [[UIView alloc]initWithFrame:CGRectMake(self.bounds.size.width/6, 0, self.bounds.size.width/6, self.bounds.size.height/3)];
        
        self.view3 = [[UIView alloc]initWithFrame:CGRectMake(2*self.bounds.size.width/6, 0, self.bounds.size.width/6, self.bounds.size.height/3)];
        
        self.view4 = [[UIView alloc]initWithFrame:CGRectMake(3*self.bounds.size.width/6, 0, self.bounds.size.width/6, self.bounds.size.height/3)];
        
        self.view5 = [[UIView alloc]initWithFrame:CGRectMake(4*self.bounds.size.width/6, 0, self.bounds.size.width/6, self.bounds.size.height/3)];
        
        self.view6 = [[UIView alloc]initWithFrame:CGRectMake(5*self.bounds.size.width/6, 0, self.bounds.size.width/6, self.bounds.size.height/3)];
        
        self.view1.backgroundColor = self.view2.backgroundColor = self.view3.backgroundColor = self.view4.backgroundColor = self.view5.backgroundColor = self.view6.backgroundColor = [UIColor clearColor];
        
        
        
            
        self.imageView1 =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"s6"]];

        self.imageView1.frame = CGRectMake(0, 0, 40, 26.5);
        self.imageView1.center = CGPointMake(self.view1.center.x, self.view1.bounds.size.height/2);
        self.imageView1.layer.shadowRadius = 2.5;
        self.imageView1.layer.shadowOpacity = 0.5;
        self.imageView1.layer.shadowOffset = CGSizeMake(3, 6);
        self.imageView1.layer.shouldRasterize = YES;
        [self.view1 addSubview:self.imageView1];
            
      
        
        self.imageView2 =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"s6"]];
        self.imageView2.frame = CGRectMake(0, 0, 40, 26.5);
        self.imageView2.center = CGPointMake(self.view1.center.x, self.view1.bounds.size.height/2);
        self.imageView2.layer.shadowRadius = 2.5;
        self.imageView2.layer.shadowOpacity = 0.5;
        self.imageView2.layer.shadowOffset = CGSizeMake(3, 6);
        self.imageView2.layer.shouldRasterize = YES;
        
        [self.view2 addSubview:self.imageView2];
        
        self.imageView3 =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"s6"]];
        
        self.imageView3.frame = CGRectMake(0, 0, 40, 26.5);
        self.imageView3.center = CGPointMake(self.view1.center.x, self.view1.bounds.size.height/2);
        self.imageView3.layer.shadowRadius = 2.5;
        self.imageView3.layer.shadowOpacity = 0.5;
        self.imageView3.layer.shadowOffset = CGSizeMake(3, 6);
        self.imageView3.layer.shouldRasterize = YES;
        
        [self.view3 addSubview:self.imageView3];
        self.imageView4 =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"s6"]];
        self.imageView4.frame = CGRectMake(0, 0, 40, 26.5);
        self.imageView4.center = CGPointMake(self.view1.center.x, self.view1.bounds.size.height/2);
        self.imageView4.layer.shadowRadius = 2.5;
        self.imageView4.layer.shadowOpacity = 0.5;
        self.imageView4.layer.shadowOffset = CGSizeMake(3, 6);
        self.imageView4.layer.shouldRasterize = YES;
        
        [self.view4 addSubview:self.imageView4];
        
        self.imageView5 =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"s6"]];
        self.imageView5.frame = CGRectMake(0, 0, 40, 26.5);
        self.imageView5.center = CGPointMake(self.view1.center.x, self.view1.bounds.size.height/2);
        self.imageView5.layer.shadowRadius = 2.5;
        self.imageView5.layer.shadowOpacity = 0.5;
        self.imageView5.layer.shadowOffset = CGSizeMake(3, 6);
        self.imageView5.layer.shouldRasterize = YES;
        
        [self.view5 addSubview:self.imageView5];
        self.imageView6 =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"s6"]];
        self.imageView6.frame = CGRectMake(0, 0, 40, 26.5);
        
        self.imageView6.center = CGPointMake(self.view1.center.x, self.view1.bounds.size.height/2);
        self.imageView6.layer.shadowRadius = 2.5;
        self.imageView6.layer.shadowOpacity = 0.5;
        self.imageView6.layer.shadowOffset = CGSizeMake(3, 6);
        self.imageView6.layer.shouldRasterize = YES;
        
        [self.view6 addSubview:self.imageView6];
        
        
        [self addSubview:self.view1];
        [self addSubview:self.view2];
        [self addSubview:self.view3];
        [self addSubview:self.view4];
        [self addSubview:self.view5];
        [self addSubview:self.view6];
        
        
        
        
        
        
        
        UIView *breakerView1 = [[UIView alloc]initWithFrame:CGRectMake(self.bounds.size.width/6 - 2, self.view1.bounds.size.height/4, 2, self.view1.bounds.size.height/2)];
        breakerView1.layer.shadowRadius = 1;
        breakerView1.layer.shadowOpacity = 0.6;
        breakerView1.layer.shadowOffset = CGSizeMake(3, 7);
        breakerView1.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2];
        breakerView1.layer.shadowPath = [[UIBezierPath bezierPathWithRect:breakerView1.bounds]CGPath];
        [self.view1 addSubview:breakerView1];
        
        UIView *breakerView2 = [[UIView alloc]initWithFrame:CGRectMake(self.bounds.size.width/6 - 2, self.view1.bounds.size.height/4, 2, self.view1.bounds.size.height/2)];
        breakerView2.layer.shadowRadius = 1;
        breakerView2.layer.shadowOpacity = 0.6;
        breakerView2.layer.shadowOffset = CGSizeMake(3, 7);
        breakerView2.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2];
        breakerView2.layer.shadowPath = [[UIBezierPath bezierPathWithRect:breakerView2.bounds]CGPath];
        [self.view2 addSubview:breakerView2];
        
        UIView *breakerView3 = [[UIView alloc]initWithFrame:CGRectMake(self.bounds.size.width/6 - 2, self.view1.bounds.size.height/4, 2, self.view1.bounds.size.height/2)];
        breakerView3.layer.shadowRadius = 1;
        breakerView3.layer.shadowOpacity = 0.6;
        breakerView3.layer.shadowOffset = CGSizeMake(3, 7);
        breakerView3.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2];
        breakerView3.layer.shadowPath = [[UIBezierPath bezierPathWithRect:breakerView3.bounds]CGPath];
        [self.view3 addSubview:breakerView3];
        
        
        UIView *breakerView4 = [[UIView alloc]initWithFrame:CGRectMake(self.bounds.size.width/6 - 2, self.view1.bounds.size.height/4, 2, self.view1.bounds.size.height/2)];
        breakerView4.layer.shadowRadius = 1;
        breakerView4.layer.shadowOpacity = 0.6;
        breakerView4.layer.shadowOffset = CGSizeMake(3, 7);
        breakerView4.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2];
        breakerView4.layer.shadowPath = [[UIBezierPath bezierPathWithRect:breakerView4.bounds]CGPath];
        [self.view4 addSubview:breakerView4];
        
        UIView *breakerView5 = [[UIView alloc]initWithFrame:CGRectMake(self.bounds.size.width/6 - 2, self.view1.bounds.size.height/4, 2, self.view1.bounds.size.height/2)];
        breakerView5.layer.shadowRadius = 1;
        breakerView5.layer.shadowOpacity = 0.6;
        breakerView5.layer.shadowOffset = CGSizeMake(3, 7);
        breakerView5.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2];
        breakerView5.layer.shadowPath = [[UIBezierPath bezierPathWithRect:breakerView5.bounds]CGPath];
        [self.view5 addSubview:breakerView5];
        
        
        
        
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height/3, self.bounds.size.width, self.bounds.size.height/2)];
        view.backgroundColor = [UIColor clearColor];
        [self addSubview:view];
        
        
        UIView *breakerView6 = [[UIView alloc]initWithFrame:CGRectMake(0, view.bounds.size.height - 1, view.bounds.size.width, 1)];
        breakerView6.layer.shadowRadius = 1;
        breakerView6.layer.shadowOpacity = 0.6;
        breakerView6.layer.shadowOffset = CGSizeMake(0, -1);
        breakerView6.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2];
        breakerView6.layer.shadowPath = [[UIBezierPath bezierPathWithRect:breakerView6.bounds]CGPath];
        
        [view addSubview:breakerView6];
        

        
        CGFloat fontSize;
        if (iPhone4_4s) {
            fontSize = 13;
        }else if (iPhone6_plus){
            fontSize = 20;
        }else{
            fontSize = 15;
        }
        self.label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, self.bounds.size.height*5/6, self.bounds.size.width/6, self.bounds.size.height/6)];
        [self addSubview:self.label1];
        
        self.label1.text = @"今天";
        self.label1.textAlignment = NSTextAlignmentCenter;
        self.label1.textColor = [UIColor whiteColor];
        self.label1.font = [UIFont fontWithName:TitleFontName size:fontSize];
        
        
        
        self.label2 = [[UILabel alloc]initWithFrame:CGRectMake( self.bounds.size.width/6, self.bounds.size.height*5/6, self.bounds.size.width/6, self.bounds.size.height/6)];
        [self addSubview:self.label2];
        
        self.label2.textAlignment = NSTextAlignmentCenter;
        self.label2.textColor = [UIColor whiteColor];
        self.label2.font = [UIFont fontWithName:TitleFontName size:fontSize];
        
        
        
        self.label3 = [[UILabel alloc]initWithFrame:CGRectMake(2* self.bounds.size.width/6, self.bounds.size.height*5/6, self.bounds.size.width/6, self.bounds.size.height/6)];
        [self addSubview:self.label3];
        
        self.label3.textAlignment = NSTextAlignmentCenter;
        self.label3.textColor = [UIColor whiteColor];
        self.label3.font = [UIFont fontWithName:TitleFontName size:fontSize];
        
        
        self.label4 = [[UILabel alloc]initWithFrame:CGRectMake(3* self.bounds.size.width/6, self.bounds.size.height*5/6, self.bounds.size.width/6, self.bounds.size.height/6)];
        [self addSubview:self.label4];
        
        self.label4.textAlignment = NSTextAlignmentCenter;
        self.label4.textColor = [UIColor whiteColor];
        self.label4.font = [UIFont fontWithName:TitleFontName size:fontSize];
        
        
        self.label5 = [[UILabel alloc]initWithFrame:CGRectMake(4* self.bounds.size.width/6, self.bounds.size.height*5/6, self.bounds.size.width/6, self.bounds.size.height/6)];
        [self addSubview:self.label5];
        
        self.label5.textAlignment = NSTextAlignmentCenter;
        self.label5.textColor = [UIColor whiteColor];
        self.label5.font = [UIFont fontWithName:TitleFontName size:fontSize];
        
        
        self.label6 = [[UILabel alloc]initWithFrame:CGRectMake(5* self.bounds.size.width/6, self.bounds.size.height*5/6, self.bounds.size.width/6, self.bounds.size.height/6)];
        [self addSubview:self.label6];
        
        self.label6.textAlignment = NSTextAlignmentCenter;
        self.label6.textColor = [UIColor whiteColor];
        self.label6.font = [UIFont fontWithName:TitleFontName size:fontSize];
        
        NSDateComponents *components = [[NSCalendar autoupdatingCurrentCalendar] components:NSCalendarUnitWeekday fromDate:[NSDate date]];
        NSInteger weekday = components.weekday;
        
        if (weekday == 1){
            self.label2.text = @"周一";
            self.label3.text = @"周二";
            self.label4.text = @"周三";
            self.label5.text = @"周四";
            self.label6.text = @"周五";
            
        }else if (weekday == 2){
            
            self.label2.text = @"周二";
            self.label3.text = @"周三";
            self.label4.text = @"周四";
            self.label5.text = @"周五";
            self.label6.text = @"周六";
            
        }else if (weekday == 3){
            self.label2.text = @"周三";
            self.label3.text = @"周四";
            self.label4.text = @"周五";
            self.label5.text = @"周六";
            self.label6.text = @"周日";
            
        }else if (weekday == 4){
            self.label2.text = @"周四";
            self.label3.text = @"周五";
            self.label4.text = @"周六";
            self.label5.text = @"周日";
            self.label6.text = @"周一";
            
        }else if (weekday == 5){
            self.label2.text = @"周五";
            self.label3.text = @"周六";
            self.label4.text = @"周日";
            self.label5.text = @"周一";
            self.label6.text = @"周二";
            
        }else if (weekday == 6){
            self.label2.text = @"周六";
            self.label3.text = @"周日";
            self.label4.text = @"周一";
            self.label5.text = @"周二";
            self.label6.text = @"周三";
            
        }else if (weekday == 7) {
            self.label2.text = @"周日";
            self.label3.text = @"周一";
            self.label4.text = @"周二";
            self.label5.text = @"周三";
            self.label6.text = @"周四";
        }

 
    }
    return self;
}







@end
