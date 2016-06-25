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

#import "PresentAnimation.h"
#import "DismissAnimation.h"

#import "AbstractView.h"
#import "ClearAnimatorView.h"

@interface DetailViewController ()
<
UITableViewDelegate,
UIViewControllerTransitioningDelegate
>
@property (nonatomic, strong) UITableView           *tableView;
@property (nonatomic, strong) SuggestViewController *suggestVC;
@property (nonatomic, strong) UIVisualEffectView *visualEffectView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation DetailViewController

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _scrollView.contentSize = CGSizeMake(Width*2, Height);
        _scrollView.bounces = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        _scrollView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.separatorStyle   = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor  = [UIColor clearColor];
        _tableView.delegate = self;
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
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
        AbstractView *abstractView = [[ClearAnimatorView alloc] initWithPoint:CGPointMake(Width/2, 200)];
        _weatherbgView = [[WeatherBackgroundView alloc] initWithFrame:self.view.bounds andAbstractView:abstractView];
        _weatherbgView.backgroundColor = [UIColor clearColor];
    }
    return _weatherbgView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    [self.visualEffectView.contentView addSubview:self.weatherbgView];
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, Height*8/9, Width, 1)];
    [self.view addSubview:self.pageControl];
    self.pageControl.numberOfPages = 2;
    self.pageControl.currentPage = 0;
    self.pageControl.selected = NO;
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor   ];
    self.pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeButton setImage:[UIImage imageNamed:@"icon_close_nor"] forState:UIControlStateNormal];
    closeButton.frame = CGRectMake(20, 20, 24, 24);
    [closeButton addTarget:self action:@selector(closeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.visualEffectView.contentView addSubview:closeButton];
    
 
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.pageControl setCurrentPage:roundf(scrollView.contentOffset.x/self.view.bounds.size.width)];
}

- (void)closeButtonClicked:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - UIScrollViewDelegate 确定上拉进入新界面及下拉刷新位置
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    if (scrollView.contentOffset.y >= 40.f) {
        
        scrollView.contentInset = UIEdgeInsetsMake(- scrollView.contentOffset.y, 0, 0, 0);
        [self pullUpToNewController];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        });
    }
    
    if (scrollView.contentOffset.y <= -60.f) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 上拉进入新控制器
- (void)pullUpToNewController{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        self.suggestVC = [[SuggestViewController alloc]init];
        self.suggestVC.transitioningDelegate = self;
        self.suggestVC.modalTransitionStyle = UIModalPresentationCustom;
        
        [self presentViewController:self.suggestVC animated:YES completion:nil];
        
    });
}

#pragma mark - 转场动画

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [[PresentAnimation alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[DismissAnimation alloc] init];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


@end
