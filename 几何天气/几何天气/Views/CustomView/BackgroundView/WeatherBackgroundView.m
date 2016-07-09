//
//  WeatherBackgroundView.m
//  几何天气
//
//  Created by 张冬冬 on 16/5/26.
//  Copyright © 2016年 张冬冬. All rights reserved.
//

#import "WeatherBackgroundView.h"
#import "MyDefine.h"
@implementation WeatherBackgroundView

- (UILabel *)positionLabel{
    if (!_positionLabel) {
        _positionLabel = [[UILabel alloc]init];
        
        CGFloat positionSize;
        
        if (iPhone4_4s) {
            positionSize = 16;
        }else if (iPhone6_plus){
            positionSize = 25;
        }else if (iPhone6){
            positionSize = 20;
        }else{
            positionSize = 18;
        }
        
        _positionLabel.font = [UIFont fontWithName:TitleFontName size:positionSize];
        _positionLabel.text = @"";
        _positionLabel.textAlignment = NSTextAlignmentCenter;
        _positionLabel.layer.shadowRadius = 2.5;
        _positionLabel.textColor = [UIColor whiteColor];
        _positionLabel.layer.shadowOffset = CGSizeMake(10, 10);
        _positionLabel.layer.shadowOpacity = 0.6;
        _positionLabel.layer.shouldRasterize = YES;
    }
    return _positionLabel;
}


- (UILabel *)temperatureLabel{
    if (!_temperatureLabel) {
        _temperatureLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, Width, Height/4)];
        self.temperatureLabel.center = CGPointMake(self.center.x, Height*5/12);
        
        
        CGFloat fontHeight;
        
        if (iPhone4_4s) {
            fontHeight = 70;
        }else if (iPhone6_plus){
            fontHeight = 100;
        }else if (iPhone6){
            fontHeight = 90;
        }else{
            fontHeight = 80;
        }
        
        
        self.temperatureLabel.font = [UIFont fontWithName:TempFontName size:fontHeight];
        self.temperatureLabel.text = @"28";
        self.temperatureLabel.textAlignment = NSTextAlignmentCenter;
        self.temperatureLabel.layer.shadowRadius = 2.5;
        self.temperatureLabel.textColor = [UIColor whiteColor];
        self.temperatureLabel.layer.shadowOffset = CGSizeMake(10, 10);
        self.temperatureLabel.layer.shadowOpacity = 0.6;
        self.temperatureLabel.layer.shouldRasterize = YES;
    }
    return _temperatureLabel;
}


- (UILabel *)velocityLabel{
    if (!_velocityLabel) {
        _velocityLabel = [[UILabel alloc]init];
        CGFloat velocityFontSize;
        if (iPhone4_4s) {
            velocityFontSize = 14;
        }else if (iPhone6_plus){
            velocityFontSize = 20;
        }else if (iPhone6){
            velocityFontSize = 18;
        }else{
            velocityFontSize = 16;
        }
        self.velocityLabel.font = font(velocityFontSize);
        self.velocityLabel.text = @"";
        self.velocityLabel.textAlignment = NSTextAlignmentCenter;
        
        self.velocityLabel.textColor = [UIColor whiteColor];
    }
    return _velocityLabel;
}

- (UILabel *)PMLabel{
    
    if (!_PMLabel) {
        _PMLabel = [[UILabel alloc]init];
        
        CGFloat velocityFontSize;
        if (iPhone4_4s) {
            velocityFontSize = 14;
        }else if (iPhone6_plus){
            velocityFontSize = 20;
        }else if (iPhone6){
            velocityFontSize = 18;
        }else{
            velocityFontSize = 16;
        }
        
        _PMLabel.font = font(velocityFontSize);
        _PMLabel.text = @"";
        _PMLabel.textAlignment = NSTextAlignmentCenter;
        _PMLabel.textColor = [UIColor whiteColor];
        
    }
    
    return _PMLabel;
}

- (instancetype)initWithFrame:(CGRect)frame andAbstractView:(AbstractView *)abstractView {
    self = [super initWithFrame:frame];
    
    if (self) {
//        AbstractView *abstractView = [[AbstractView alloc]initWithPoint:Center];
        [self addSubview:abstractView];
        
        UIView *positionView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.temperatureLabel.frame), Width, Height/12)];
        self.positionLabel.frame = positionView.bounds;
        [positionView addSubview:self.positionLabel];
        [self addSubview:positionView];
        
        [self addSubview:self.temperatureLabel];
        
        UIView *velocityAndPMView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.positionLabel.frame), Width, Height/12)];
        
        
        UILabel *velocityLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, Width/4, velocityAndPMView.bounds.size.height/2)];
        CGFloat velocityFontSize;
        
        if (iPhone4_4s) {
            velocityFontSize = 14;
        }else if (iPhone6_plus){
            velocityFontSize = 20;
        }else if (iPhone6){
            velocityFontSize = 18;
        }else{
            velocityFontSize = 16;
        }
        velocityLabel1.font = font(velocityFontSize);
        velocityLabel1.text = @"风速";
        velocityLabel1.textAlignment = NSTextAlignmentCenter;
        
        velocityLabel1.textColor = [UIColor whiteColor];
        
        
        [velocityAndPMView addSubview:velocityLabel1];
        self.velocityLabel.frame = CGRectMake(0, velocityAndPMView.bounds.size.height/2, Width/4, velocityAndPMView.bounds.size.height/2);
        
        [velocityAndPMView addSubview:self.velocityLabel];
        
        
        UILabel *PMLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(Width*3/4, 0, Width/4, velocityAndPMView.bounds.size.height/2)];
        
        PMLabel1.font = font(velocityFontSize);
        PMLabel1.text = @"PM2.5";
        PMLabel1.textAlignment = NSTextAlignmentCenter;
        
        PMLabel1.textColor = [UIColor whiteColor];
        
        
        [velocityAndPMView addSubview:PMLabel1];
        
        self.PMLabel.frame = CGRectMake(Width*3/4, velocityAndPMView.bounds.size.height/2, Width/4, velocityAndPMView.bounds.size.height/2);
        
        [velocityAndPMView addSubview:self.PMLabel];
        
        
        [self addSubview:velocityAndPMView];
    }
    
    return self;
}

@end
