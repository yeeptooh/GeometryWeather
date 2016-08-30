//
//  DetailViewController.m
//  几何天气
//
//  Created by 张冬冬 on 16/5/26.
//  Copyright © 2016年 张冬冬. All rights reserved.
//
/*
 
      .--,       .--,
     ( (  \.---./  ) )
      '.__/o   o\__.'
         {=  ^  =}
          >  -  <
         /       \
        //       \\
       //|   .   |\\
       "'\       /'"_.-~^`'-.
          \  _  /--'         `
        ___)( )(___
       (((__) (__)))
 
 高山仰止,景行行止.虽不能至,心向往之。
 
 最怕你一生碌碌无为 还安慰自己平凡可贵
 
 */
#import "DetailViewController.h"
#import "SuggestViewController.h"
#import "MyDefine.h"

#import "AbstractView.h"
#import "ClearAnimatorView.h"
#import "CloudAnimatorView.h"
#import "HazeAnimatorView.h"
#import "MoonAnimatorView.h"
#import "RainAnimatorView.h"
#import "SnowAnimatorView.h"
#import "ThunderAnimatorView.h"
#import "WindAnimatorView.h"

@interface DetailViewController ()
<
UITableViewDelegate,
UIViewControllerTransitioningDelegate
>

@property (nonatomic, strong) SuggestViewController *suggestVC;
@property (nonatomic, strong) UIVisualEffectView *visualEffectView;
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) ClearAnimatorView *clearView;
@property (nonatomic, strong) CloudAnimatorView *cloudView;
@property (nonatomic, strong) HazeAnimatorView *hazeView;
@property (nonatomic, strong) MoonAnimatorView *moonView;
@property (nonatomic, strong) RainAnimatorView *rainView;
@property (nonatomic, strong) SnowAnimatorView *snowView;
@property (nonatomic, strong) ThunderAnimatorView *thunderView;
@property (nonatomic, strong) WindAnimatorView *windView;

@end

@implementation DetailViewController


- (ClearAnimatorView *)clearView {
    if (!_clearView) {
        _clearView = [[ClearAnimatorView alloc] initWithPoint:CGPointMake(Width/2, Height * 23/120)];
    }
    return _clearView;
}

- (CloudAnimatorView *)cloudView {
    if (!_cloudView) {
        _cloudView = [[CloudAnimatorView alloc] initWithPoint:CGPointMake(Width/2, Height * 23/120)];
    }
    return _cloudView;
}

- (HazeAnimatorView *)hazeView {
    if (!_hazeView) {
        _hazeView = [[HazeAnimatorView alloc] initWithPoint:CGPointMake(Width/2, Height * 23/120)];
    }
    return _hazeView;
}

- (MoonAnimatorView *)moonView {
    if (!_moonView) {
        _moonView = [[MoonAnimatorView alloc] initWithPoint:CGPointMake(Width/2, Height * 23/120)];
    }
    return _moonView;
}

- (RainAnimatorView *)rainView {
    if (!_rainView) {
        _rainView = [[RainAnimatorView alloc] initWithPoint:CGPointMake(Width/2, Height * 23/120)];
    }
    return _rainView;
}

- (SnowAnimatorView *)snowView {
    if (!_snowView) {
        _snowView = [[SnowAnimatorView alloc] initWithPoint:CGPointMake(Width/2, Height * 23/120)];
    }
    return _snowView;
}

- (ThunderAnimatorView *)thunderView {
    if (!_thunderView) {
        _thunderView = [[ThunderAnimatorView alloc] initWithPoint:CGPointMake(Width/2, Height * 23/120)];
    }
    return _thunderView;
}

- (WindAnimatorView *)windView {
    if (!_windView) {
        _windView = [[WindAnimatorView alloc] initWithPoint:CGPointMake(Width/2, Height * 23/120)];
    }
    return _windView;
}


- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _scrollView.contentSize = CGSizeMake(Width*2, Height);
        _scrollView.bounces = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        
        _scrollView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}



- (UIVisualEffectView *)visualEffectView {
    if (!_visualEffectView) {
        
        _visualEffectView  = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
        _visualEffectView.frame = CGRectMake(0, 0, Width*2, Height);
        [self.scrollView addSubview:_visualEffectView];
    }
    return _visualEffectView;
}

#pragma mark - 懒加载
- (WeatherBackgroundView *)weatherbgView {
    if (!_weatherbgView) {
        NSDate *date                     = [NSDate date];
        NSDateFormatter  *dateformatter  = [[NSDateFormatter alloc] init];
        [dateformatter setDateFormat:@"HH:mm"];
        NSString *locationString         = [dateformatter stringFromDate:date];
        NSString *hour                   = [locationString substringToIndex:locationString.length - 3];
        NSInteger locationHour           = [hour integerValue];
        AbstractView *abstractView;
        if (self.weather.code == 100 || self.weather.code == 900 || self.weather.code == 999) {
            if (locationHour >= 18 && locationHour <= 4) {
                abstractView = self.moonView;
            }else {
                abstractView = self.clearView;
            }
        }else if (self.weather.code == 101 || self.weather.code == 102 || self.weather.code == 103 || self.weather.code == 104) {
            abstractView = self.cloudView;
        }else if (self.weather.code == 200 || self.weather.code == 201 || self.weather.code == 202 || self.weather.code == 203 || self.weather.code == 204 || self.weather.code == 205 || self.weather.code == 206 || self.weather.code == 207 || self.weather.code == 208 || self.weather.code == 209 || self.weather.code == 210 || self.weather.code == 211 || self.weather.code == 212 || self.weather.code == 213 || self.weather.code == 901) {
            abstractView = self.windView;
        }else if (self.weather.code == 302 || self.weather.code == 303 || self.weather.code == 304) {
            abstractView = self.thunderView;
        }else if (self.weather.code == 300 || self.weather.code == 301 || self.weather.code == 305 || self.weather.code == 306 || self.weather.code == 307 || self.weather.code == 308 || self.weather.code == 309 || self.weather.code == 310 || self.weather.code == 311 || self.weather.code == 312 || self.weather.code == 313) {
            abstractView = self.rainView;
        }else if (self.weather.code == 400 || self.weather.code == 401 || self.weather.code == 402 || self.weather.code == 403 || self.weather.code == 404 || self.weather.code == 405 || self.weather.code == 406 || self.weather.code == 407) {
            abstractView = self.snowView;
        }else if (self.weather.code == 500 || self.weather.code == 501 || self.weather.code == 502 || self.weather.code == 503 || self.weather.code == 504 || self.weather.code == 505 || self.weather.code == 506 || self.weather.code == 507 || self.weather.code == 508) {
            abstractView = self.hazeView;
        }
        

        _weatherbgView = [[WeatherBackgroundView alloc] initWithFrame:self.view.bounds andAbstractView:abstractView];
        _weatherbgView.backgroundColor = [UIColor clearColor];
    }
    return _weatherbgView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    [self.visualEffectView.contentView addSubview:self.weatherbgView];
    
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeButton setImage:[UIImage imageNamed:@"ic_close_n"] forState:UIControlStateNormal];
    [closeButton setImage:[UIImage imageNamed:@"ic_close_p"] forState:UIControlStateNormal];
    closeButton.frame = CGRectMake(20, 0, 24, 24);
    [closeButton addTarget:self action:@selector(closeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIVisualEffectView *subEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIVibrancyEffect effectForBlurEffect:(UIBlurEffect *)self.visualEffectView.effect]];
    subEffectView.frame = CGRectMake(0, 50, Width, 74);
    [subEffectView.contentView addSubview:closeButton];
  
    [self.visualEffectView.contentView addSubview:subEffectView];
  
}


- (void)closeButtonClicked:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


@end
