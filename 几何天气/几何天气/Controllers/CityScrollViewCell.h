//
//  CityScrollViewCell.h
//  几何天气
//
//  Created by 张冬冬 on 16/5/21.
//  Copyright © 2016年 张冬冬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weather.h"
@class CityScrollViewCell;

@protocol CityScrollViewCellDelegate <NSObject>

- (void)didClickScrollViewCellWithIndex:(NSInteger)index;

@end

@interface CityScrollViewCell : UIView
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *contentNameLabel;
@property (nonatomic, strong) UILabel *contentTemperatureLabel;
@property (nonatomic, strong) UILabel *contentWeatherLabel;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UILabel *contentVelocityLabel;
@property (nonatomic, strong) UILabel *contentPM25Label;

@property (nonatomic, weak) id<CityScrollViewCellDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame AndWeather:(Weather *)weather;

@end
