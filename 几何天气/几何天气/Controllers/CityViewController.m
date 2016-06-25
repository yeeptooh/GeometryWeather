//
//  CityViewController.m
//  几何天气
//
//  Created by 张冬冬 on 16/5/24.
//  Copyright © 2016年 张冬冬. All rights reserved.
//

#import "CityViewController.h"
#import "MyDefine.h"
#import "GlobalFunction.h"
@interface CityViewController ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIView *areaView;
@property (nonatomic, strong) NSArray *cityList;
@property (nonatomic, strong) NSTimer *timer;
@end
static NSInteger subscript = 0;
@implementation CityViewController

- (NSArray *)cityList {
    if (!_cityList) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cityData.plist" ofType:nil];
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
        _cityList = [NSArray arrayWithArray:[dic allKeys]];
    }
    return _cityList;
}

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.areaView = [[UIView alloc] initWithFrame:CGRectMake(0, Height - 350, Width, 350)];
    self.areaView.backgroundColor = kViewBgColor;
    self.areaView.layer.shadowRadius = 2;
    self.areaView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.areaView.layer.shadowOpacity = 0.5;
    self.areaView.layer.shadowOffset = CGSizeMake(0, -3);
    
    CATransform3D identity = CATransform3DIdentity;
    CATransform3D move = CATransform3DTranslate(identity, 0, 0, Width/2);//CATransform3DMakeTranslation(0, 0, Width/2);
    CATransform3D back = CATransform3DTranslate(identity, 0, 0, - Width/2);//CATransform3DMakeTranslation(0, 0, -Width/2);
    CATransform3D rotate = CATransform3DRotate(identity, M_PI_2, 0, 1, 0);//CATransform3DMakeRotation(M_PI_2, 0, 1, 0);
    CATransform3D concat = CATransform3DConcat(CATransform3DConcat(move, rotate), back);
    
    self.areaView.layer.transform = CATransform3DPerspect(concat, CGPointZero, 500);

    [self.view addSubview:self.areaView];
    
    self.view.backgroundColor = [UIColor clearColor];
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, Height - 350, Width, 350)];
    self.containerView.backgroundColor = kViewBgColor;
    self.containerView.layer.shadowRadius = 2;
    self.containerView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.containerView.layer.shadowOpacity = 0.5;
    self.containerView.layer.shadowOffset = CGSizeMake(0, -3);
    
    [self.view addSubview:self.containerView];
 
    [self gestureRecognizerConfig];
    [self configBackView];
    [self configScrollViewWithTable];
    
}

- (void)configBackView {
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 40)];
    backView.backgroundColor = [UIColor clearColor];
    
    
    UILabel *cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, Width - 100, 40)];
    cityLabel.font = [UIFont fontWithName:TitleFontName size:15];
    cityLabel.textColor = kTextlightGrayColor;
    cityLabel.text = @"省/自治区";
    cityLabel.textAlignment = NSTextAlignmentCenter;
    [backView addSubview:cityLabel];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 39.4, Width, 0.6)];
    lineView.backgroundColor = kTextlightGrayColor;
    lineView.alpha = 0.4;
    [backView addSubview:lineView];
    [self.containerView addSubview:backView];
}


- (void)configScrollViewWithTable {
    
    
    CGFloat height;
    if (iPhone5_5s || iPhone4_4s) {
        height = 75;
    }else if (iPhone6) {
        height = 85;
    }else if (iPhone6_plus) {
        height = 90;
    }else {
        height = 80;
    }
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, Width, self.containerView.bounds.size.height - 40)];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.contentSize = CGSizeMake(Width, 12 * height);
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(0 + Width/3, 0, 0.6, 12 * height)];
    lineView1.backgroundColor = kTextlightGrayColor;
    lineView1.alpha = 0.3;
    [scrollView addSubview:lineView1];
    
    
    UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(0 + Width*2.0/3, 0, 0.6, 12 * height)];
    lineView2.backgroundColor = kTextlightGrayColor;
    lineView2.alpha = 0.3;
    [scrollView addSubview:lineView2];
    
    for (NSInteger j = 0; j < 12; j ++) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, height * (j+1), Width, 0.6)];
        lineView.backgroundColor = kTextlightGrayColor;
        lineView.alpha = 0.3;
        [scrollView addSubview:lineView];
        
    }
    
    
    
    for (NSInteger i = 0; i < 12; i ++) {
        for (NSInteger j = 0; j < 3; j ++) {
            CGFloat fontsize;
            if (iPhone4_4s || iPhone5_5s) {
                fontsize = 18;
            }else {
                fontsize = 22;
            }

            UIButton *cityButton = [UIButton buttonWithType:UIButtonTypeCustom];
            
            cityButton.frame = CGRectMake(0 + j*Width/3, 0 + i*height, Width/3, height);
            
            [cityButton addTarget:self action:@selector(cityButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            cityButton.backgroundColor = [UIColor clearColor];
            
            UILabel *buttonLabel = [[UILabel alloc] initWithFrame:cityButton.frame];
            if (subscript == 34 || subscript == 35) {
                buttonLabel.text = @"";
                cityButton.enabled = NO;
            }else {
                buttonLabel.text = self.cityList[subscript];
            }
            
            subscript ++;
            if (subscript == 36) {
                subscript = 0;
            }
            buttonLabel.textAlignment = NSTextAlignmentCenter;
            buttonLabel.textColor = kTextlightGrayColor;
            buttonLabel.font = [UIFont fontWithName:TitleFontName size:fontsize];
            [scrollView addSubview:buttonLabel];
            [scrollView addSubview:cityButton];

        }
    }

    [self.containerView addSubview:scrollView];
}

- (void)cityButtonClicked:(UIButton *)sender {
    
    [UIView animateWithDuration:1 animations:^{
        CATransform3D identity = CATransform3DIdentity;
        CATransform3D move1 = CATransform3DTranslate(identity, 0, 0, Width/2);//CATransform3DMakeTranslation(0, 0, Width/2);
        CATransform3D back1 = CATransform3DTranslate(identity, 0, 0, - Width/2);//CATransform3DMakeTranslation(0, 0, - Width/2);
        CATransform3D move2 = CATransform3DTranslate(self.areaView.layer.transform, 0, 0, Width/2);//CATransform3DMakeTranslation(0, 0, Width/2);
        CATransform3D back2 = CATransform3DTranslate(self.areaView.layer.transform, 0, 0, - Width/2);//CATransform3DMakeTranslation(0, 0, - Width/2);
        
        CATransform3D rotate0 = CATransform3DRotate(identity, - M_PI_2, 0, 1, 0);//CATransform3DMakeRotation(-M_PI_2, 0, 1, 0);
        CATransform3D rotate1 = CATransform3DRotate(self.areaView.layer.transform, - M_PI_2, 0, 1, 0);//CATransform3DMakeRotation(0, 0, 1, 0);
        
        
        CATransform3D mat0 = CATransform3DConcat(CATransform3DConcat(move1, rotate0), back1);
        CATransform3D mat1 = CATransform3DConcat(CATransform3DConcat(back2, rotate1), move2);
        
        
        self.containerView.layer.transform = CATransform3DPerspect(mat0, CGPointZero, 500);
        self.areaView.layer.transform = CATransform3DPerspect(mat1, CGPointZero, 500);
    }];

    
}



- (void)gestureRecognizerConfig {
    
    UIView *tapView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, Height - 350)];
    tapView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:tapView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [tapView addGestureRecognizer:tap];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [tapView addGestureRecognizer:swipe];
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
}

- (void)handleGesture:(UITapGestureRecognizer *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
