//
//  DetailViewController.h
//  几何天气
//
//  Created by 张冬冬 on 16/5/26.
//  Copyright © 2016年 张冬冬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherBackgroundView.h"
#import "ZDDDetailView.h"
#import "ZDDChartView.h"
@interface DetailViewController : UIViewController
@property (nonatomic, strong) WeatherBackgroundView *weatherbgView;
@property (nonatomic, strong) ZDDDetailView         *detailView;
@property (nonatomic, strong) ZDDChartView          *chartView;
@property (nonatomic, strong) NSString *cityName;
@end
