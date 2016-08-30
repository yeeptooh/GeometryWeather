//
//  MainViewController.m
//  几何天气
//
//  Created by 张冬冬 on 16/5/21.
//  Copyright © 2016年 张冬冬. All rights reserved.
//

#import "MainViewController.h"
#import "MyDefine.h"
#import "AFNetworking.h"
#import "CityListScrollView.h"
#import "GlobalFunction.h"
#import "Weather.h"
#pragma mark - Navi上的按钮推出视图及转场动画
#import "CityViewController.h"
#import "ShareViewController.h"
#import "ZDDTransitionAnimation.h"
#import "ZDDShareTransitionAnimation.h"
#import "ZDDTapTransitionAnimation.h"

#pragma mark - 详情视图
#import "DetailViewController.h"


@interface MainViewController ()
<
CityScrollViewCellDelegate,
UIViewControllerTransitioningDelegate,
UIScrollViewDelegate
>
@property (nonatomic, assign) NSInteger location;

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;
@property (nonatomic, strong) UILabel *LoadingLabel;
@property (nonatomic, strong) UILabel *alertLabel;
@property (nonatomic, strong) UILabel *tapLabel;
@property (nonatomic, strong) UITapGestureRecognizer *tap;

@property (nonatomic, strong) UILabel *cityLabel;

@property (nonatomic, strong) CityListScrollView *scrollView;
@property (nonatomic, strong) Weather *weather;
@property (nonatomic, strong) NSMutableArray *List;
@property (nonatomic, strong) NSMutableArray *cellList;

@property (nonatomic, strong) UIVisualEffectView *visualEffectView;
@end

@implementation MainViewController

- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 80, Width, Height - 80)];
        _containerView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_containerView];
    }
    return _containerView;
}

- (UIActivityIndicatorView *)activityView {
    if (!_activityView) {
        _activityView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        _activityView.center = CGPointMake(Width/2, 185);
        _activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
        [self.containerView addSubview:_activityView];
    }
    return _activityView;
}

- (UILabel *)alertLabel {
    if (!_alertLabel) {
        
        CGFloat fontsize;
        if (iPhone4_4s || iPhone5_5s) {
            fontsize = 15;
        }else {
            fontsize = 20;
        }
        
        _alertLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 170, Width, 30)];
        _alertLabel.text = @"检查网络";
        _alertLabel.textAlignment = NSTextAlignmentCenter;
        _alertLabel.font = [UIFont fontWithName:TitleBoldFontName size:fontsize];
        _alertLabel.backgroundColor = [UIColor clearColor];
        _alertLabel.textColor = kTextlightGrayColor;
        _alertLabel.hidden = YES;
        
        [self.containerView addSubview:_alertLabel];
    }
    return _alertLabel;
}

- (UILabel *)tapLabel {
    if (!_tapLabel) {
        
        CGFloat fontsize;
        if (iPhone4_4s || iPhone5_5s) {
            fontsize = 15;
        }else {
            fontsize = 20;
        }
        
        _tapLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, Width, 20)];
        _tapLabel.text = @"请点击重新加载";
        _tapLabel.textAlignment = NSTextAlignmentCenter;
        _tapLabel.font = [UIFont fontWithName:TitleBoldFontName size:fontsize];
        _tapLabel.backgroundColor = [UIColor clearColor];
        _tapLabel.textColor = kTextlightGrayColor;
        _tapLabel.hidden = YES;
        
        [self.containerView addSubview:_tapLabel];
    }
    return _tapLabel;
}

- (NSMutableArray *)List {
    if (!_List) {
        _List = [NSMutableArray array];
    }
    return _List;
}

- (NSMutableArray *)cellList {
    if (!_cellList) {
        _cellList = [NSMutableArray array];
    }
    return _cellList;
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addTapGesture:) name:kTapNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeTapGesture:) name:kRemoveTapNotification object:nil];
    self.location = 0;
    [self setCustomNavigationView];
    [self networkingForWeather];
    
}
#pragma mark -配置
- (void)setCustomNavigationView {
    self.view.backgroundColor = kViewBgColor;
    //Copyright © 2016年 张冬冬. All rights reserved.
    
    CGFloat fontsize;
    if (iPhone4_4s || iPhone5_5s) {
        fontsize = 20;
    }else {
        fontsize = 25;
    }
    
    [self.activityView startAnimating];
    self.LoadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, Width, 30)];
    self.LoadingLabel.text = @"Loading ...";
    self.LoadingLabel.font = [UIFont fontWithName:TitleBoldFontName size:fontsize];
    self.LoadingLabel.backgroundColor = [UIColor clearColor];
    self.LoadingLabel.textAlignment = NSTextAlignmentCenter;
    self.LoadingLabel.textColor = kTextlightGrayColor;
    [self.containerView addSubview:self.LoadingLabel];
    
    self.headerView = [[UIView alloc]init];
    CGRect frame = self.view.frame;
    frame.size.height = 80;
    self.headerView.frame = frame;
    self.headerView.backgroundColor = kNavBgColor;
    [self.view addSubview:self.headerView];
    
    self.bundleLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 25, Width - 80, 60)];
    self.bundleLabel.textColor = kTextlightGrayColor;
    self.bundleLabel.text = @"Geometry Weather";
    self.bundleLabel.font = [UIFont fontWithName:TitleBoldFontName size:fontsize];
    self.bundleLabel.textAlignment = NSTextAlignmentCenter;
    self.bundleLabel.backgroundColor = [UIColor clearColor];
    
    [self.headerView addSubview:self.bundleLabel];
    
    
    self.locationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.locationButton.frame = CGRectMake(Width - 40, 40, 30, 25);
    [self.locationButton setImage:[UIImage imageNamed:@"locate-button"] forState:UIControlStateNormal];
    [self.locationButton setImage:[UIImage imageNamed:@"locate-button-selected"] forState:UIControlStateHighlighted];
    [self.locationButton addTarget:self action:@selector(locationButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView addSubview:self.locationButton];
    
    self.shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.shareButton.frame = CGRectMake(10, 40, 30, 25);
    [self.shareButton setImage:[UIImage imageNamed:@"share-button"] forState:UIControlStateNormal];
    [self.shareButton setImage:[UIImage imageNamed:@"share-button-selected"] forState:UIControlStateHighlighted];
    [self.shareButton addTarget:self action:@selector(shareButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView addSubview:self.shareButton];
    
    
}

- (void)networkingForWeather {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);
    
    AFHTTPSessionManager *manager1 = [AFHTTPSessionManager manager];
    [manager1 GET:[NSString stringWithFormat:@"https://api.heweather.com/x3/weather?city=%@&key=%@",@"beijing",apiIDKey] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.List addObject:[Weather weatherFromDailyDic:responseObject]];
        dispatch_group_leave(group);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_group_leave(group);
        NSLog(@"请求失败");
    }];
    
    dispatch_group_enter(group);
    
    AFHTTPSessionManager *manager2 = [AFHTTPSessionManager manager];
    [manager2 GET:[NSString stringWithFormat:@"https://api.heweather.com/x3/weather?city=%@&key=%@",@"shanghai",apiIDKey] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.List addObject:[Weather weatherFromDailyDic:responseObject]];
        dispatch_group_leave(group);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_group_leave(group);
        NSLog(@"请求失败");
    }];
    
    dispatch_group_enter(group);
    
    AFHTTPSessionManager *manager3 = [AFHTTPSessionManager manager];
    [manager3 GET:[NSString stringWithFormat:@"https://api.heweather.com/x3/weather?city=%@&key=%@",@"guangzhou",apiIDKey] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.List addObject:[Weather weatherFromDailyDic:responseObject]];
        dispatch_group_leave(group);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_group_leave(group);
        NSLog(@"请求失败");
    }];
    
    dispatch_group_enter(group);
    
    AFHTTPSessionManager *manager4 = [AFHTTPSessionManager manager];
    [manager4 GET:[NSString stringWithFormat:@"https://api.heweather.com/x3/weather?city=%@&key=%@",@"hongkong",apiIDKey] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.List addObject:[Weather weatherFromDailyDic:responseObject]];
        dispatch_group_leave(group);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_group_leave(group);
        NSLog(@"请求失败");
    }];
        
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"请求完成");
        [self.activityView stopAnimating];
        self.LoadingLabel.hidden = YES;
        if (self.List.count == 0) {
            self.alertLabel.hidden = NO;
            self.tapLabel.hidden = NO;
            [[NSNotificationCenter defaultCenter] postNotificationName:kTapNotification object:nil];
            
        }else {
            
            self.alertLabel.hidden = YES;
            self.tapLabel.hidden = YES;
            [[NSNotificationCenter defaultCenter] postNotificationName:kRemoveTapNotification object:nil];
        }
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        [self setScrollView];
        
    });

}


- (void)addTapGesture:(NSNotification *)notification {
    
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    self.tap.numberOfTapsRequired = 1;
    [self.containerView addGestureRecognizer:self.tap];
    
}

- (void)removeTapGesture:(NSNotification *)notification {
    [self.containerView removeGestureRecognizer:self.tap];
}

- (void)tapAction {
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [self.activityView startAnimating];
    self.alertLabel.hidden = YES;
    self.tapLabel.hidden = YES;
    self.LoadingLabel.hidden = NO;
    
    [self networkingForWeather];
    
}

- (void)setScrollView {

    _scrollView = [[CityListScrollView alloc] initWithFrame:CGRectMake(0, 20, Width, Height - 100)];
    _scrollView.alpha = 0;
    [self.containerView addSubview:_scrollView];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    for (NSInteger i = 0; i< self.List.count; i++) {
        
        CityScrollViewCell *contentCell = [[CityScrollViewCell alloc] initWithFrame:CGRectMake(self.view.bounds.size.width*i , 0, self.view.bounds.size.width, _scrollView.frame.size.height - 30) AndWeather:self.List[i]];
        contentCell.imageView.image = [UIImage imageWithContentsOfFile:((Weather *)self.List[i]).image];
        contentCell.index = i;
        contentCell.delegate = self;
        
        [_scrollView addSubview:contentCell];
        [self.cellList addObject:contentCell];
        
    }
    
    _scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * self.List.count, _scrollView.frame.size.height);
    [UIView animateWithDuration:0.3 animations:^{
        _scrollView.alpha = 1;
        
        CityScrollViewCell *cell = (CityScrollViewCell *)self.cellList[0];
        
        self.bundleLabel.text = cell.contentNameLabel.text;
    }];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    if (((NSInteger)scrollView.contentOffset.x)%(NSInteger)Width == 0) {
        
        self.location = ((NSInteger)scrollView.contentOffset.x)/320;
        
        CityScrollViewCell *cell = (CityScrollViewCell *)self.cellList[((NSInteger)scrollView.contentOffset.x)/(NSInteger)Width];
        
        self.bundleLabel.text = cell.contentNameLabel.text;
    }
}


- (void)shareButtonClicked:(UIButton *)sender {
    ShareViewController *shareVC = [[ShareViewController alloc] init];
    shareVC.transitioningDelegate = self;
    shareVC.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:shareVC animated:YES completion:nil];
}


- (void)locationButtonClicked:(UIButton *)sender {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:[NSString stringWithFormat:@"https://api.heweather.com/x3/weather?city=%@&key=%@",@"haerbin",apiIDKey] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        Weather *weather = [Weather weatherFromDailyDic:responseObject];
        [self.List insertObject:weather atIndex:self.location];
        
        
        CityScrollViewCell *contentCell = [[CityScrollViewCell alloc] initWithFrame:CGRectMake(self.view.bounds.size.width*self.location, 0, self.view.bounds.size.width, self.scrollView.frame.size.height - 30) AndWeather:weather];
        contentCell.transform = CGAffineTransformScale(contentCell.transform, 0.1, 0.1);
        contentCell.alpha = 0;
        contentCell.imageView.image = [UIImage imageWithContentsOfFile:weather.image];
        contentCell.index = self.location;
        contentCell.delegate = self;
        
        
        
        CityScrollViewCell *subView = self.scrollView.subviews[self.location];
        
        UIView *snapView = [subView snapshotViewAfterScreenUpdates:YES];
        [self.scrollView insertSubview:contentCell belowSubview:subView];
        [self.scrollView insertSubview:snapView aboveSubview:contentCell];
        snapView.alpha = 0;
        subView.alpha = 0;
        
        
        [self.cellList insertObject:contentCell atIndex:self.location];
        
        [UIView animateWithDuration:0.5 delay:0.25 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            contentCell.alpha = 1;
            contentCell.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            subView.alpha = 1;
        }];
        
        [UIView animateWithDuration:0.75 animations:^{

            } completion:^(BOOL finished) {
                self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * self.List.count, self.scrollView.frame.size.height);
                for (NSInteger i = 0; i< self.List.count; i++) {
                    
                    CityScrollViewCell *contentCell = self.cellList[i];
                    contentCell.frame = CGRectMake(self.view.bounds.size.width*i , 0, self.view.bounds.size.width, _scrollView.frame.size.height - 30);
                    
                    [self.scrollView addSubview:contentCell];
                   
                }
            }];
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求失败");
    }];
    
    
    
    
    
    return ;
    
    CityViewController *cityVC = [[CityViewController alloc] init];
    cityVC.transitioningDelegate = self;
    cityVC.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:cityVC animated:YES completion:nil];
}

- (void)didClickScrollViewCellWithIndex:(NSInteger)index {
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    detailVC.weather = self.List[index];
    detailVC.transitioningDelegate = self;
    detailVC.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:detailVC animated:YES completion:nil];
    
}


#pragma mark - CityScrollViewCellDelegate

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    if ([presented isMemberOfClass:[CityViewController class]]) {
        return [ZDDTransitionAnimation transitionWithType:ZDDTransitionAnimationTypePresent Duration:0.75 PresentHeight:Height containerHeight:350 Scale:CGPointMake(0.7, 0.7)];
    } else if ([presented isMemberOfClass:[ShareViewController class]]) {
        return [ZDDShareTransitionAnimation transitionWithType:ZDDShareTransitionAnimationTypePresent Duration:0.55 frame:CGRectMake(0, 0, Width - 40, 205) center:CGPointMake(- self.view.center.x, self.view.center.y)];
    } else if ([presented isMemberOfClass:[DetailViewController class]]) {
        return [ZDDTapTransitionAnimation tapTransitionAnimationWithType:ZDDTapTransitionAnimationTypePresent duration:0.75];
    }
    
    return nil;
    
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    if ([dismissed isMemberOfClass:[CityViewController class]]) {
        return [ZDDTransitionAnimation transitionWithType:ZDDTransitionAnimationTypeDismiss Duration:0.75 PresentHeight:Height containerHeight:350 Scale:CGPointMake(0.7, 0.7)];
    } else if ([dismissed isMemberOfClass:[ShareViewController class]]) {
        return [ZDDShareTransitionAnimation transitionWithType:ZDDShareTransitionAnimationTypeDismiss Duration:0.65 frame:CGRectMake(0, 0, Width - 40, 205) center:CGPointMake(self.view.center.x *3/2, self.view.center.y)];
    } else if ([dismissed isMemberOfClass:[DetailViewController class]]) {
        return [ZDDTapTransitionAnimation tapTransitionAnimationWithType:ZDDTapTransitionAnimationTypeDismiss duration:0.75];
    }

    
    return nil;
}


@end
