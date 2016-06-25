//
//  WeatherBackgroundView.h
//  几何天气
//
//  Created by 张冬冬 on 16/5/26.
//  Copyright © 2016年 张冬冬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractView.h"
@interface WeatherBackgroundView : UIView
@property (nonatomic, strong)UILabel *positionLabel;
@property (nonatomic, strong)UILabel *temperatureLabel;
@property (nonatomic, strong)UILabel *velocityLabel;
@property (nonatomic, strong)UILabel *PMLabel;

- (instancetype)initWithFrame:(CGRect)frame andAbstractView:(AbstractView *)abstractView;
@end
