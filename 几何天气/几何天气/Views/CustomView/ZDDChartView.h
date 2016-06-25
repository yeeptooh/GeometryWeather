//
//  ZDDChartView.h
//  Geometry Weather
//
//  Created by ZDD on 16/1/24.
//  Copyright © 2016年 apple1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDDChartView : UIView

@property (nonatomic, strong)NSArray *maxAndMinTemperatureList;

- (void)showInView:(UIView *)view;
- (void)showInTheView:(UIView *)view;
@end
