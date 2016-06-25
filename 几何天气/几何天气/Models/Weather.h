//
//  Weather.h
//  几何天气
//
//  Created by apple on 16/2/1.
//  Copyright © 2016年 apple1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject
//图片
@property (nonatomic, strong) NSString *image;
//城市
@property (nonatomic, strong) NSString *city;
//阴晴
@property (nonatomic, strong) NSString *txt;
//当前温度
@property (nonatomic, strong) NSString *tmp;

//pm2.5
@property (nonatomic, strong) NSString *pm25;
//风速
@property (nonatomic, strong) NSString *spd;

//天气代码
@property (nonatomic, assign) NSInteger code;


//最高温数组
@property (nonatomic, strong) NSArray *maxList;
//最低温数组
@property (nonatomic, strong) NSArray *minList;
//合数组
@property (nonatomic, strong) NSArray *maxAndMinList;
//每天天气图标数组
@property (nonatomic, strong) NSArray *codeList;


//suggestion


@property (nonatomic, strong) NSArray *drsg;

@property (nonatomic, strong) NSArray *sport;

@property (nonatomic, strong) NSArray *flu;

@property (nonatomic, strong) NSArray *trav;


+ (instancetype)weatherFromDailyDic:(NSDictionary *)responseObj;


@end










