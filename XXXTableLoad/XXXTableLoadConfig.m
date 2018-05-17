//
//  XXXConfig.m
//  YTableEx
//
//  Created by 2YF on 2018/5/15.
//  Copyright © 2018年 2YF. All rights reserved.
//

#import "XXXTableLoadConfig.h"

@implementation XXXTableLoadConfig

+(void)load {
    XXXTableLoadConfig *xxc = [XXXTableLoadConfig manager];
    xxc.emptyBackgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
    xxc.emptyTips = @"这里什么也没有~";
    xxc.tryTips = @"网络开小差了~";
    xxc.emptyTipsColor = [UIColor blackColor];
    xxc.emptyTipsFont = [UIFont systemFontOfSize:12];
    xxc.emptyImage = [UIImage imageNamed:@"tipImg"];
    xxc.tryImage = [UIImage imageNamed:@"tryImg"];
    xxc.tryBtnTitle = @"重试";
    xxc.tryBtnFont = [UIFont systemFontOfSize:12];
    xxc.tryBtnBackgroundColor = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1];
    xxc.tryBtnTitleColor = [UIColor blackColor];
    xxc.startPage = 1;
    xxc.singleMaxDataCount = 20;
    xxc.emptyViewTag = 740978851;
    
    xxc.mjRefreshStateIdleImgArr = @[[UIImage imageNamed:@"tipImg"],[UIImage imageNamed:@"tryImg"]];
    xxc.mjRefreshStatePullingImgArr = @[[UIImage imageNamed:@"tipImg"],[UIImage imageNamed:@"tryImg"]];
    xxc.mjRefreshStateRefreshingImgArr = @[[UIImage imageNamed:@"tipImg"],[UIImage imageNamed:@"tryImg"]];
    xxc.mjRefreshStateWillRefreshImgArr = @[[UIImage imageNamed:@"tipImg"],[UIImage imageNamed:@"tryImg"]];
    
}


+ (XXXTableLoadConfig *)manager {
    static XXXTableLoadConfig *xxc;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        xxc = [[XXXTableLoadConfig alloc] init];
    });
    return xxc;
}


@end
