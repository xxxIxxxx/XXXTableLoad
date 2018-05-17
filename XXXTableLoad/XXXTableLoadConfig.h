//
//  XXXConfig.h
//  YTableEx
//
//  Created by 2YF on 2018/5/15.
//  Copyright © 2018年 2YF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define XXXConfigManager [XXXTableLoadConfig manager]
#define XXX_WIDTH [UIScreen mainScreen].bounds.size.width
#define XXX_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface XXXTableLoadConfig : NSObject

+ (XXXTableLoadConfig *)manager;

///无数据时table的背景色
@property (nonatomic ,strong) UIColor *emptyBackgroundColor;

///无数据时 提示文字
@property (nonatomic ,copy) NSString *emptyTips;

///重试时 提示文字
@property (nonatomic ,copy) NSString *tryTips;

///无数据时 提示文字的颜色
@property (nonatomic ,strong) UIColor *emptyTipsColor;

///无数据时 提示文字的font
@property (nonatomic ,strong) UIFont *emptyTipsFont;

///无数据时 提示的图片
@property (nonatomic ,strong) UIImage *emptyImage;

///重试时 提示的图片
@property (nonatomic ,strong) UIImage *tryImage;

///重试按钮 文字
@property (nonatomic ,copy) NSString *tryBtnTitle;

///重试按钮 font
@property (nonatomic ,strong) UIFont *tryBtnFont;

///重试按钮 背景色
@property (nonatomic ,strong) UIColor *tryBtnBackgroundColor;

///重试按钮 字体颜色
@property (nonatomic ,strong) UIColor *tryBtnTitleColor;

///数据开始页码1
@property (nonatomic ,unsafe_unretained) NSInteger startPage;

///单次最大数据量
@property (nonatomic ,unsafe_unretained) NSInteger singleMaxDataCount;

///空数据界面 展示图 tag 默认 740978851
@property (nonatomic ,unsafe_unretained) NSInteger emptyViewTag;



/// 普通闲置状态
@property (nonatomic ,strong) NSArray<UIImage *> *mjRefreshStateIdleImgArr;

///松开就可以进行刷新的状态
@property (nonatomic ,strong) NSArray<UIImage *> *mjRefreshStatePullingImgArr;

///正在刷新中的状态
@property (nonatomic ,strong) NSArray<UIImage *> *mjRefreshStateRefreshingImgArr;

///即将刷新的状态
@property (nonatomic ,strong) NSArray<UIImage *> *mjRefreshStateWillRefreshImgArr;


@end
