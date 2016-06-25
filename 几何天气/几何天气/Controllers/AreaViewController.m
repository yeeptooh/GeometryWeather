//
//  AreaViewController.m
//  几何天气
//
//  Created by 张冬冬 on 16/5/25.
//  Copyright © 2016年 张冬冬. All rights reserved.
//

#import "AreaViewController.h"
#import "MyDefine.h"
@interface AreaViewController ()
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) NSArray *areaList;
@end

@implementation AreaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, Height - 350, Width, 350)];
    self.containerView.backgroundColor = kViewBgColor;
    self.containerView.layer.shadowRadius = 2;
    self.containerView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.containerView.layer.shadowOpacity = 0.5;
    self.containerView.layer.shadowOffset = CGSizeMake(0, -3);
    
    [self.view addSubview:self.containerView];
    
    [self configBackView];
    
    
    
    
}

- (void)configBackView {
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 40)];
    backView.backgroundColor = [UIColor clearColor];
    
    
    UILabel *cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, Width - 100, 40)];
    cityLabel.font = [UIFont fontWithName:TitleFontName size:15];
    cityLabel.textColor = kTextlightGrayColor;
    cityLabel.text = @"市／县";
    cityLabel.textAlignment = NSTextAlignmentCenter;
    [backView addSubview:cityLabel];
    
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"back-button"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    backButton.frame = CGRectMake(0, 10, 40, 40);
    [backView addSubview:backButton];

    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 39.4, Width, 0.6)];
    lineView.backgroundColor = kTextlightGrayColor;
    lineView.alpha = 0.4;
    [backView addSubview:lineView];
    [self.containerView addSubview:backView];
}

- (void)backButtonClicked:(UIButton *)sender {
    
}

@end
