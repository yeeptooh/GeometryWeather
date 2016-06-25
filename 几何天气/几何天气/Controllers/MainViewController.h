//
//  MainViewController.h
//  几何天气
//
//  Created by 张冬冬 on 16/5/21.
//  Copyright © 2016年 张冬冬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityScrollViewCell.h"

@interface MainViewController : UIViewController
@property (nonatomic, strong) CityScrollViewCell *cell;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UILabel *bundleLabel;
@property (nonatomic, strong) UIButton *locationButton;
@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, strong) NSString *cityName;
@end
