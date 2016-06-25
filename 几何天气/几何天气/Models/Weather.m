//
//  Weather.m
//  几何天气
//
//  Created by apple on 16/2/1.
//  Copyright © 2016年 apple1. All rights reserved.
//

#import "Weather.h"

@implementation Weather
+ (instancetype)weatherFromDailyDic:(NSDictionary *)responseObj{
    return [[self alloc]initWithDailyDic:responseObj];
}


- (instancetype)initWithDailyDic:(NSDictionary *)responseObj{
    
    self = [super init];
    if (self) {
        
        
        self.city = responseObj[@"HeWeather data service 3.0"][0][@"basic"][@"city"];
        self.image = [[NSBundle mainBundle] pathForResource:self.city ofType:@"jpg"];
        
        self.txt  = responseObj[@"HeWeather data service 3.0"][0][@"now"][@"cond"][@"txt"];
        self.tmp  = [NSString stringWithFormat:@"%@℃", responseObj[@"HeWeather data service 3.0"][0][@"now"][@"tmp"]];
        self.spd = [NSString stringWithFormat:@"%.1fm/s", [responseObj[@"HeWeather data service 3.0"][0][@"now"][@"wind"][@"spd"] integerValue]/3.6];
        if ([[responseObj[@"HeWeather data service 3.0"][0] allKeys] containsObject:@"aqi"]) {
            self.pm25 = [NSString stringWithFormat:@"%@μg/m³", responseObj[@"HeWeather data service 3.0"][0][@"aqi"][@"city"][@"pm25"]];
        } else {

            self.pm25 = @"未知";
        }
        
        
        self.code = [responseObj[@"HeWeather data service 3.0"][0][@"now"][@"cond"][@"code"] integerValue];
        
        
        
        
        
        
//        self.maxList = @[
//                         responseObj[@"HeWeather data service 3.0"][0][@"daily_forecast"][0][@"tmp"][@"max"],
//                         responseObj[@"HeWeather data service 3.0"][0][@"daily_forecast"][1][@"tmp"][@"max"],
//                         responseObj[@"HeWeather data service 3.0"][0][@"daily_forecast"][2][@"tmp"][@"max"],
//                         responseObj[@"HeWeather data service 3.0"][0][@"daily_forecast"][3][@"tmp"][@"max"],
//                         responseObj[@"HeWeather data service 3.0"][0][@"daily_forecast"][4][@"tmp"][@"max"],
//                         responseObj[@"HeWeather data service 3.0"][0][@"daily_forecast"][5][@"tmp"][@"max"]
//                         ];
//
//        
//        self.minList = @[
//                         responseObj[@"HeWeather data service 3.0"][0][@"daily_forecast"][0][@"tmp"][@"min"],
//                         responseObj[@"HeWeather data service 3.0"][0][@"daily_forecast"][1][@"tmp"][@"min"],
//                         responseObj[@"HeWeather data service 3.0"][0][@"daily_forecast"][2][@"tmp"][@"min"],
//                         responseObj[@"HeWeather data service 3.0"][0][@"daily_forecast"][3][@"tmp"][@"min"],
//                         responseObj[@"HeWeather data service 3.0"][0][@"daily_forecast"][4][@"tmp"][@"min"],
//                         responseObj[@"HeWeather data service 3.0"][0][@"daily_forecast"][5][@"tmp"][@"min"]
//                         ];
//        
//        self.maxAndMinList = @[self.maxList, self.minList];
//        
//        
//        self.codeList = @[
//                          responseObj[@"HeWeather data service 3.0"][0][@"daily_forecast"][0][@"cond"][@"code_d"],
//                          responseObj[@"HeWeather data service 3.0"][0][@"daily_forecast"][1][@"cond"][@"code_d"],
//                          responseObj[@"HeWeather data service 3.0"][0][@"daily_forecast"][2][@"cond"][@"code_d"],
//                          responseObj[@"HeWeather data service 3.0"][0][@"daily_forecast"][3][@"cond"][@"code_d"],
//                          responseObj[@"HeWeather data service 3.0"][0][@"daily_forecast"][4][@"cond"][@"code_d"],
//                          responseObj[@"HeWeather data service 3.0"][0][@"daily_forecast"][5][@"cond"][@"code_d"]
//                          
//                          ];
//        
//        
//        self.drsg = @[
//                      
//                      responseObj[@"HeWeather data service 3.0"][0][@"suggestion"][@"drsg"][@"brf"],
//                      responseObj[@"HeWeather data service 3.0"][0][@"suggestion"][@"drsg"][@"txt"]
//                      
//                      ];
//        
//        self.sport = @[
//                       
//                       responseObj[@"HeWeather data service 3.0"][0][@"suggestion"][@"sport"][@"brf"],
//                       responseObj[@"HeWeather data service 3.0"][0][@"suggestion"][@"sport"][@"txt"]
//                       
//                       ];
//        
//        self.flu = @[
//                     
//                     responseObj[@"HeWeather data service 3.0"][0][@"suggestion"][@"flu"][@"brf"],
//                     responseObj[@"HeWeather data service 3.0"][0][@"suggestion"][@"flu"][@"txt"]
//                     
//                     ];
//        
//        self.trav = @[
//                      
//                      responseObj[@"HeWeather data service 3.0"][0][@"suggestion"][@"trav"][@"brf"],
//                      responseObj[@"HeWeather data service 3.0"][0][@"suggestion"][@"trav"][@"txt"]
//                      
//                      ];
   
    }

    return self;
    
}



@end
