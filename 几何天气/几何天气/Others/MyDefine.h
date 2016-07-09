//
//  MyDefine.h
//  天气
//
//  Created by apple1 on 16/1/13.
//  Copyright © 2016年 apple1. All rights reserved.
//

#ifndef MyDefine_h
#define MyDefine_h


#define apiIDKey @"54c97dfb9aaa45429ef748c4b2dbf6d2"




//机器唯一标识
#define  UUID                              [[UIDevice currentDevice].identifierForVendor UUIDString]

//系统版本
#define iOSVerson                         [[UIDevice currentDevice] systemVersion].floatValue


// 宽度
#define  Width                             [UIScreen mainScreen].bounds.size.width

// 高度
#define  Height                            [UIScreen mainScreen].bounds.size.height

// 状态栏高度
#define  StatusBarHeight                   20.f

// 导航栏高度
#define  NavigationBarHeight               44.f

// 标签栏高度
#define  TabbarHeight                      49.f

// 状态栏高度 + 导航栏高度
#define  StatusBarAndNavigationBarHeight   (20.f + 44.f)

#define  iPhone4_4s   (Width == 320.f && Height == 480.f ? YES : NO)
#define  iPhone5_5s   (Width == 320.f && Height == 568.f ? YES : NO)
#define  iPhone6      (Width == 375.f && Height == 667.f ? YES : NO)
#define  iPhone6_plus (Width == 414.f && Height == 736.f ? YES : NO)


#define color(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define beautifulGreen color(65, 163, 190, 1)
#define beautifulColor color(7, 33, 57, 1)
#define beautifulGray color(233, 229, 226, 1)

#define font(str) [UIFont systemFontOfSize:(str)]

#define MyAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

/*****************                     ********************/
#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define DEGREES_TO_RADIANS(x) ((x) / 180.0 * M_PI)

#define IOSVersion ([[[UIDevice currentDevice] systemVersion] floatValue])
//视图frame改变通知
#define kChangedFrame @"kChangedViewFrame"

//控件背景颜色 button label cell 等
#define kControlBgColor kUIColorFromRGB(0xedeef0)
//按钮文字颜色 有所区分
#define kButtonTextTintColor kUIColorFromRGB(0x3f484a)
//文字颜色
#define kTextlightBlueColor kUIColorFromRGB(0x272d2d)
//navigation 背景颜色
#define kNavBgColor kUIColorFromRGB(0x1f2324)
//视图背景颜色 UIView
#define kViewBgColor kUIColorFromRGB(0x292d2e)
//tabItem 背景正常颜色
#define kTabItemBgNormal kUIColorFromRGB(0x1e2225)
//tabItem 背景选中颜色
#define kTabItemBgSelected kUIColorFromRGB(0x1a9fd0)
//tabItem 字体颜色
#define kTabItemTextNormal kUIColorFromRGB(0xa3bac5)
//contenView 背景颜色
#define kContentViewBgColor kUIColorFromRGB(0x272c2f)

#define kSegmentBorderColor kUIColorFromRGB(0x202528)
//小视图cell的背景颜色
#define kSmallViewBgColor kUIColorFromRGB(0x252b2b)
//
#define kTableViewCellBgColor kUIColorFromRGB(0xf7f7f7)
//子视图上的字体颜色 灰色
#define kTextlightGrayColor kUIColorFromRGB(0xb1bcc0)

#define kCustomDeepGreenColor kUIColorFromRGB(0x254D4E)

#define TitleBoldFontName @"TrumpGothicEast-Bold"
#define TempFontName @"ITCAvantGardeStd-XLtObl"
#define TitleFontName @"FilmotypeGiant"

#define BodyFontName @"HelveticaNeue-Bold"

#define chineseName @"FZSongKeBenXiuKaiS-R-GB"


#define kTapNotification @"tapNotification"
#define kRemoveTapNotification @"removeTapNotification"


#define WBAppKey @"1394729116"
#define WBRedirectURL @"https://api.weibo.com/oauth2/default.html"

#define WXAppKey @"wxaae5aeee2cf4c38f"
#define QQKey @"1105380664"


#define Center CGPointMake(self.center.x, Height * 23/120)

#define Days 6

#define VIEW1HEIGHT self.view1.bounds.size.height
#define VIEW2HEIGHT self.view2.bounds.size.height
#define VIEW3HEIGHT self.view3.bounds.size.height
#define VIEW4HEIGHT self.view4.bounds.size.height

#define VIEW1WIDTH self.view1.bounds.size.width
#define VIEW2WIDTH self.view2.bounds.size.width
#define VIEW3WIDTH self.view3.bounds.size.width
#define VIEW4WIDTH self.view4.bounds.size.width


#define BasicPoint CGPointMake(Width/3, Height/4)
#define UpPoint CGPointMake(Width/3, -Height/2)
#define DownPoint CGPointMake(Width/3, Height/2)

#define FromPoint CGPointMake(Width/4, Height/2)
#define ToPoint CGPointMake(Width/4, Height/6)



#define WindView [[WindAnimatorView alloc] initWithPoint:CGPointMake(self.containerView1.bounds.size.width/2, self.containerView1.bounds.size.height/2)]

#define RainView [[RainAnimatorView alloc] initWithPoint:CGPointMake(self.containerView1.bounds.size.width/2, self.containerView1.bounds.size.height/2)]

#define CloudView [[CloudAnimatorView alloc] initWithPoint:CGPointMake(self.containerView1.bounds.size.width/2, self.containerView1.bounds.size.height/2)]

#define ThunderView [[ThunderAnimatorView alloc] initWithPoint:CGPointMake(self.containerView1.bounds.size.width/2, self.containerView1.bounds.size.height/2)]

#define SnowView [[SnowAnimatorView alloc] initWithPoint:CGPointMake(self.containerView1.bounds.size.width/2, self.containerView1.bounds.size.height/2)]

#define MoonView [[MoonAnimatorView alloc] initWithPoint:CGPointMake(self.containerView1.bounds.size.width/2, self.containerView1.bounds.size.height/2)]

#define ClearView [[ClearAnimatorView alloc] initWithPoint:CGPointMake(self.containerView1.bounds.size.width/2, self.containerView1.bounds.size.height/2)]

#define HazeView [[HazeAnimatorView alloc] initWithPoint:CGPointMake(self.containerView1.bounds.size.width/2, self.containerView1.bounds.size.height/2)]

#endif /* MyDefine_h */
