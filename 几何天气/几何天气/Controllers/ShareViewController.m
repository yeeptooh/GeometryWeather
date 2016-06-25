//
//  ShareViewController.m
//  几何天气
//
//  Created by 张冬冬 on 16/5/25.
//  Copyright © 2016年 张冬冬. All rights reserved.
//

#import "ShareViewController.h"
#import "MyDefine.h"

#import "WeiboSDK.h"
#import "WXApi.h"
#import <TencentOpenAPI/QQApiInterface.h>
@interface ShareViewController ()
@property (nonatomic, strong) UIView *containerView;
@end

@implementation ShareViewController

- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc] initWithFrame:self.view.bounds];
//        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        
//        gradientLayer.colors           = @[(__bridge id)[color(46, 70, 80, 1)CGColor],(__bridge id)[color(41, 63, 71, 1)CGColor],(__bridge id)[color(34, 50, 57, 1)CGColor],(__bridge id)[color(29, 41, 48, 1)CGColor],(__bridge id)[color(21, 30, 35, 1)CGColor]];
//        
//        gradientLayer.startPoint       = CGPointMake(0, 0);
//        gradientLayer.endPoint         = CGPointMake(1, 0);
//        gradientLayer.frame            = _containerView.bounds;
//        [_containerView.layer addSublayer:gradientLayer];
        _containerView.backgroundColor = color(34, 50, 57, 1);
        [self.view addSubview:_containerView];
    }
    return _containerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.cornerRadius = 5;
    self.view.layer.masksToBounds = YES;
    self.view.backgroundColor = [UIColor clearColor];

    [self setBackgroundView];
}

- (void)setBackgroundView {
    
    CGFloat fontsize;
    if (iPhone4_4s || iPhone5_5s) {
        fontsize = 11;
    }else {
        fontsize = 13;
    }
    
    
    NSArray *list = @[
                      @"微信好友",
                      @"微信朋友圈",
                      @"QQ",
                      @"新浪微博",
                      @"信息",
                      @"电子邮件"
                      ];
    
    for (NSInteger i = 0; i < 4 ; i++) {
        UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [shareButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"ZHActionShareNormal%@",@(i+1)]] forState:UIControlStateNormal];
        [shareButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"ZHActionShareHighlight%@",@(i+1)]] forState:UIControlStateHighlighted];
        [shareButton addTarget:self action:@selector(shareButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        shareButton.tag = 100 + i;
        shareButton.frame = CGRectMake(((Width - 40)/4)*i, 10, (Width - 40)/4, 40);
        
        [self.containerView addSubview:shareButton];
    }
    
    for (NSInteger i = 0; i < 4 ; i ++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(((Width - 40)/4) * i, 55, (Width - 40)/4, 20)];
        label.text = list[i];
        label.font = font(fontsize);
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = kTextlightGrayColor;
        [self.containerView addSubview:label];
    }
    
    
    for (NSInteger i = 0; i < 2; i ++) {
        UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [shareButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"ZHActionShareNormal%@",@(i+5)]] forState:UIControlStateNormal];
        [shareButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"ZHActionShareHighlight%@",@(i+5)]] forState:UIControlStateHighlighted];
        [shareButton addTarget:self action:@selector(shareButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        shareButton.tag = 200 + i;
        shareButton.frame = CGRectMake(((Width - 40)/4)*i, 85, (Width - 40)/4, 40);
        
        [self.containerView addSubview:shareButton];
    }
    
    
    
    for (NSInteger i = 0; i < 2; i ++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(((Width - 40)/4) * i, 130, (Width - 40)/4, 20)];
        label.text = list[i+4];
        label.font = font(fontsize);
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = kTextlightGrayColor;
        [self.containerView addSubview:label];
    }

    UILabel *line = [[UILabel alloc] init];
    line.opaque = YES;
    line.backgroundColor = kTextlightGrayColor;
    line.layer.borderColor = [UIColor lightGrayColor].CGColor;
    line.layer.borderWidth = 0.5;
    line.frame = CGRectMake((Width - 40)*0.15, 160,(Width - 40)*0.7, 1);
    [self.containerView addSubview:line];
    
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton addTarget:self action:@selector(cancelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    cancelButton.frame = CGRectMake(0, 160, (Width - 40), 45);
    [self.containerView addSubview:cancelButton];
    
    
    UILabel *cancelLabel = [[UILabel alloc] initWithFrame:cancelButton.frame];
    cancelLabel.textColor = kTextlightGrayColor;
    cancelLabel.text = @"取消";
    cancelLabel.backgroundColor = [UIColor clearColor];
    cancelLabel.textAlignment = NSTextAlignmentCenter;
    cancelLabel.font = [UIFont fontWithName:TitleFontName size:16];
    
    [self.containerView addSubview:cancelLabel];
    
    
}

- (void)shareButtonClicked:(UIButton *)sender {
    if (sender.tag == 100) {
        
        if (![WXApi isWXAppInstalled]) {
            
            UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:nil message:@"请先安装微信客户端再进行分享" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
            [alertview show];
            return;
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
        //微信好友
        SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
        req.text = @"完美交互天气app - Geometry Weather";
        // 发送消息的类型，包括文本消息和多媒体消息两种，两者只能选择其一，不能同时发送文本和多媒体消息
        req.bText = YES;
        req.scene = WXSceneSession;
        [WXApi sendReq:req];
    }else if (sender.tag == 101) {
        if (![WXApi isWXAppInstalled]) {
            
            UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:nil message:@"请先安装微信客户端再进行分享" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
            [alertview show];
            return;
        }
        [self dismissViewControllerAnimated:YES completion:nil];
        //朋友圈
        SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
        req.text = @"完美交互天气app - Geometry Weather";
        // 发送消息的类型，包括文本消息和多媒体消息两种，两者只能选择其一，不能同时发送文本和多媒体消息
        req.bText = YES;
        req.scene = WXSceneTimeline;
        [WXApi sendReq:req];
    }else if (sender.tag == 102) {
        if (![QQApiInterface isQQInstalled]) {
            
            UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:nil message:@"请先安装QQ客户端再进行分享" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
            [alertview show];
            return;
            
        }
        //QQ
        [self dismissViewControllerAnimated:YES completion:nil];
        QQApiTextObject *textObj = [QQApiTextObject objectWithText:@"完美交互天气app - Geometry Weather"];
        SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:textObj];
        //将内容分享到qq
        [QQApiInterface sendReq:req];
        
    }else if (sender.tag == 103) {
        if (![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weibo://"]]) {
            
            UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:nil message:@"请先安装微博客户端再进行分享" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
            [alertview show];
            return;
            
        }
        //微博
        [self dismissViewControllerAnimated:YES completion:nil];
        
        /**
         第三方应用向微博客户端请求认证的消息结构
         
         第三方应用向微博客户端申请认证时，需要调用 [WeiboSDK sendRequest:]函数， 向微博客户端发送一个 WBAuthorizeRequest 的消息结构。
         
         微博客户端处理完后会向第三方应用发送一个结构为 WBAuthorizeResponse 的处理结果。
         */
        WBAuthorizeRequest *authRequest = [WBAuthorizeRequest request];
        // 微博开放平台第三方应用授权回调页地址，默认为`http://`
        authRequest.redirectURI = WBRedirectURL;
        // 微博开放平台第三方应用scope，多个scope用逗号分隔
        authRequest.scope = @"all";
        // 第三方应用发送消息至微博客户端程序的消息结构体，其中message类型我会在下面放出
        WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:[self messageToShare] authInfo:authRequest access_token:nil];
        // 自定义信息字典，用于数据传输过程中存储相关的上下文环境数据
        
        // 第三方应用给微博客户端程序发送 request 时，可以在 userInfo 中存储请求相关的信息。
        request.userInfo = @{@"ShareMessageFrom": @"SendMessageToWeiboViewController",
                             @"Other_Info_1": [NSNumber numberWithInt:123],
                             @"Other_Info_2": @[@"obj1", @"obj2"],
                             @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
        // 发送请求给微博客户端程序，并切换到微博
        
        // 请求发送给微博客户端程序之后，微博客户端程序会进行相关的处理，处理完成之后一定会调用 [WeiboSDKDelegate didReceiveWeiboResponse:] 方法将处理结果返回给第三方应用
        [WeiboSDK sendRequest:request];
        
        
    }else if (sender.tag == 200) {
        //信息
        
    }else {
        //邮件
    }

}

- (WBMessageObject *)messageToShare {
    WBMessageObject *message = [WBMessageObject message];
    message.text = NSLocalizedString(@"完美交互天气app - Geometry Weather", nil);
    return message;
}

- (void)cancelButtonClicked:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
