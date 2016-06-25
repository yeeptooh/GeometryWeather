//
//  ZDDChartView.m
//  Geometry Weather
//
//  Created by ZDD on 16/1/24.
//  Copyright © 2016年 apple1. All rights reserved.
//

#import "ZDDChartView.h"
#import "MyDefine.h"

@interface ZDDChartView ()

@property (nonatomic, assign) NSInteger maxTemperature;
@property (nonatomic, assign) NSInteger minTemperature;

@end


@implementation ZDDChartView



- (void)setMaxAndMinTemperatureList:(NSArray *)maxAndMinTemperatureList{
    
    _maxAndMinTemperatureList = maxAndMinTemperatureList;
    //取得最大最小值，为之后计算比例做准备
    NSInteger maxValue = -100;
    NSInteger minValue = 100;
    
    for (NSArray *array in _maxAndMinTemperatureList) {
        for (NSString *numberString in array) {
            NSInteger number = [numberString integerValue];
            if (number > maxValue) {
                maxValue = number;
            }
            if (number < minValue) {
                minValue = number;
            }
        }
    }
    _maxTemperature = maxValue;
    _minTemperature = minValue;
}


-(void)strokeChart{
    //self.maxAndMinTemperatureList数组里有两个数组，分别是最高温和最低温数组
    for (NSInteger i = 0; i < 2; i++) {
        NSArray *temperature = self.maxAndMinTemperatureList[i];
        
        CAShapeLayer *chartLineLayer = [CAShapeLayer layer];
        chartLineLayer.lineWidth   = 2.0;
        [self.layer addSublayer:chartLineLayer];
        
        UIBezierPath *progressLinePath = [UIBezierPath bezierPath];
        
        NSInteger index = 0;
        //此应用预测六天天气
        for (NSInteger i = 0; i < Days; i++) {
            //数组中的每个值
            NSInteger value = [temperature[index] integerValue];
            //每个点得位置
            CGFloat xPosition = ((Width/Days)/2.0) + index * Width/Days;
            //比例
            float grade = ((float)value - self.minTemperature) / ((float)self.maxTemperature - self.minTemperature);
            
            CGFloat pointHeight = self.bounds.size.height/6 + (1 - grade) * self.bounds.size.height/2;
            CGPoint point = CGPointMake(xPosition, pointHeight);
            
            [self addPoint:point index:index value:value];
            
            if (i == 0) {
                [progressLinePath moveToPoint:point];
            }else{
                [progressLinePath addLineToPoint:point];
                [progressLinePath moveToPoint:point];
            }
            index += 1;
        }
        
        chartLineLayer.path = progressLinePath.CGPath;
        
        if (i == 0) {
            chartLineLayer.strokeColor = color(255, 228, 147, 1).CGColor;
        }else{
            chartLineLayer.strokeColor = color(73, 197, 247, 1).CGColor;
        }
        
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        pathAnimation.duration = temperature.count*0.4;
        pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
        pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
        [chartLineLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    }
}

-(void)showChart{
    //self.maxAndMinTemperatureList数组里有两个数组，分别是最高温和最低温数组
    for (NSInteger i = 0; i < 2; i++) {
        NSArray *temperature = self.maxAndMinTemperatureList[i];
        
        CAShapeLayer *chartLineLayer = [CAShapeLayer layer];
        chartLineLayer.lineWidth   = 2.0;
        [self.layer addSublayer:chartLineLayer];
        
        UIBezierPath *progressLinePath = [UIBezierPath bezierPath];
        
        NSInteger index = 0;
        //此应用预测六天天气
        for (NSInteger i = 0; i < Days; i++) {
            //数组中的每个值
            NSInteger value = [temperature[index] integerValue];
            //每个点得位置
            CGFloat xPosition = ((Width/Days)/2.0) + index * Width/Days;
            //比例
            float grade = ((float)value - self.minTemperature) / ((float)self.maxTemperature - self.minTemperature);
            
            CGFloat pointHeight = self.bounds.size.height/6 + (1 - grade) * self.bounds.size.height/2;
            CGPoint point = CGPointMake(xPosition, pointHeight);
            
            [self addPoint:point index:index value:value];
            
            if (i == 0) {
                [progressLinePath moveToPoint:point];
            }else{
                [progressLinePath addLineToPoint:point];
                [progressLinePath moveToPoint:point];
            }
            index += 1;
        }
        
        chartLineLayer.path = progressLinePath.CGPath;
        
        if (i == 0) {
            chartLineLayer.strokeColor = color(255, 228, 147, 1).CGColor;
        }else{
            chartLineLayer.strokeColor = color(73, 197, 247, 1).CGColor;
        }
    }
}


static int i = 0;
- (void)addPoint:(CGPoint)point index:(NSInteger)index value:(CGFloat)value{
    i++;
    
    if (i == 13) {
        i = 1;
    }
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(5, 5, 7, 7)];
    view.center = point;
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 3.5;
    view.layer.borderWidth = 1.8;
    
    if (i <= Days) {
        view.layer.borderColor = color(255, 228, 147, 1).CGColor;
        
    }else{
        view.layer.borderColor = color(73, 197, 247, 1).CGColor;
        
    }
    
    view.backgroundColor = color(20, 20, 20, 1);
    
    CGFloat fontSize;
    if (iPhone4_4s) {
        fontSize = 10;
    }else if (iPhone6_plus){
        fontSize = 18;
    }else{
        fontSize = 14;
    }
    
    if (i <= Days) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, Width/Days, 25)];
        label.center = CGPointMake(point.x, point.y - 15);
        label.font = [UIFont systemFontOfSize:10];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = color(255, 228, 147, 1);
        label.text = [NSString stringWithFormat:@"%d",(int)value];
        label.font = font(fontSize);
        [self addSubview:label];
    }else{
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, Width/Days, 25)];
        label.center = CGPointMake(point.x, point.y + 15);
        label.font = [UIFont systemFontOfSize:10];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = color(73, 197, 247, 1);
        label.text = [NSString stringWithFormat:@"%d",(int)value];
        label.font = font(fontSize);
        [self addSubview:label];
        
    }
    
    [self addSubview:view];
    
}




- (void)showInView:(UIView *)view{
    [self strokeChart];
    [view addSubview:self];
}

- (void)showInTheView:(UIView *)view{
    [self showChart];
    [view addSubview:self];
}



@end
