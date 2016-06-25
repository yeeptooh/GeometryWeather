//
//  CityScrollViewCell.m
//  几何天气
//
//  Created by 张冬冬 on 16/5/21.
//  Copyright © 2016年 张冬冬. All rights reserved.
//

#import "CityScrollViewCell.h"
#import "MyDefine.h"
@interface CityScrollViewCell ()

@end

@implementation CityScrollViewCell

- (instancetype)initWithFrame:(CGRect)frame AndWeather:(Weather *)weather {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kViewBgColor;
        
        [self initializeViewWithWeather:weather];

    }
    return self;
}

- (void)initializeViewWithWeather:(Weather *)weather {
    
    CGRect frame = self.frame;
    frame.origin.x = 30;
    frame.size.width -= 60;
    
    UIView *contentView = [[UIView alloc] initWithFrame:frame];
    contentView.backgroundColor = kControlBgColor;
    contentView.layer.cornerRadius = 8;
    contentView.layer.allowsEdgeAntialiasing = YES;
    contentView.clipsToBounds = YES;
    contentView.opaque = YES;//默认YES，表明不用合成下面的颜色（节省大量GPU资源），但是当alpha不为1，结果未定义
    [self addSubview:contentView];
    
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.opaque = YES;
    self.imageView.frame = CGRectMake(0, 0, self.frame.size.width - 30*2, self.frame.size.height *0.4);
    [contentView addSubview:self.imageView];
    
    self.contentNameLabel = [[UILabel alloc] init];
    self.contentNameLabel.backgroundColor = kControlBgColor;
    self.contentNameLabel.textColor = kTextlightBlueColor;
    self.contentNameLabel.font = [UIFont fontWithName:TitleFontName size:45.0];
    self.contentNameLabel.textAlignment = NSTextAlignmentCenter;
    self.contentNameLabel.frame = CGRectMake(0, CGRectGetMaxY(self.imageView.frame), self.frame.size.width - 30*2, self.frame.size.height *0.2);
    self.contentNameLabel.text = weather.city;
    [contentView addSubview:self.contentNameLabel];
    
    self.contentTemperatureLabel = [[UILabel alloc] init];
    self.contentTemperatureLabel.backgroundColor = kControlBgColor;
    self.contentTemperatureLabel.textColor = kTextlightBlueColor;
    self.contentTemperatureLabel.font = font(25);
    self.contentTemperatureLabel.textAlignment = NSTextAlignmentCenter;
    self.contentTemperatureLabel.frame = CGRectMake(0, CGRectGetMaxY(self.contentNameLabel.frame), (self.frame.size.width - 30*2)/2, self.frame.size.height *0.15);
    self.contentTemperatureLabel.text = weather.txt;
    [contentView addSubview:self.contentTemperatureLabel];
    
    
    self.contentWeatherLabel = [[UILabel alloc] init];
    self.contentWeatherLabel.backgroundColor = kControlBgColor;
    self.contentWeatherLabel.textColor = kTextlightBlueColor;
    self.contentWeatherLabel.font = font(25);
    self.contentWeatherLabel.textAlignment = NSTextAlignmentCenter;
    self.contentWeatherLabel.frame = CGRectMake((self.frame.size.width - 30*2)/2, CGRectGetMaxY(self.contentNameLabel.frame), (self.frame.size.width - 30*2)/2, self.frame.size.height *0.15);
    self.contentWeatherLabel.text = weather.tmp;
    [contentView addSubview:self.contentWeatherLabel];
    
    
    
    
    self.line = [[UILabel alloc] init];
    self.line.opaque = YES;
    self.line.backgroundColor = kControlBgColor;
    self.line.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.line.layer.borderWidth = 0.5;
    self.line.frame = CGRectMake(contentView.frame.size.width * 0.3/2.0, CGRectGetMaxY(self.contentWeatherLabel.frame) , contentView.frame.size.width * 0.7, 1);
    [contentView addSubview:self.line];
    
    
    self.contentVelocityLabel = [[UILabel alloc] init];
    self.contentVelocityLabel.backgroundColor = kControlBgColor;
    self.contentVelocityLabel.textColor = kTextlightBlueColor;
    self.contentVelocityLabel.font = font(15);
    self.contentVelocityLabel.textAlignment = NSTextAlignmentCenter;
    self.contentVelocityLabel.frame = CGRectMake(0, CGRectGetMaxY(self.line.frame), (self.frame.size.width - 30*2)/2, self.frame.size.height *0.2);
    self.contentVelocityLabel.text = [NSString stringWithFormat:@"风速:  %@",weather.spd];
    [contentView addSubview:self.contentVelocityLabel];
    
    
    self.contentPM25Label = [[UILabel alloc] init];
    self.contentPM25Label.backgroundColor = kControlBgColor;
    self.contentPM25Label.textColor = kTextlightBlueColor;
    self.contentPM25Label.font = font(15);
    self.contentPM25Label.textAlignment = NSTextAlignmentCenter;
    self.contentPM25Label.frame = CGRectMake((self.frame.size.width - 30*2)/2, CGRectGetMaxY(self.line.frame), (self.frame.size.width - 30*2)/2, self.frame.size.height *0.2);
    self.contentPM25Label.text = [NSString stringWithFormat:@"PM2.5:  %@",weather.pm25];
    [contentView addSubview:self.contentPM25Label];
    
 
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRecognizer:)];
    tap.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tap];
    

}

- (void)tapRecognizer:(UITapGestureRecognizer *)tap {
    [self.delegate didClickScrollViewCellWithIndex:self.index];
}


@end
