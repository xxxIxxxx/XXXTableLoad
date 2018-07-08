//
//  UIView+XXX.h
//  YTableEx
//
//  Created by 2YF on 2018/5/16.
//  Copyright © 2018年 2YF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XXX)
#pragma mark - 无数据

/**
 无数据
 
 @param image 图片
 @param tip 提示文字
 @param tryAgainClick 点击返回事件
 */
- (void)xxx_viewEmptyImage:(UIImage *)image tip:(NSString *)tip tryClick:(void (^)(void))tryAgainClick;




/**
 table加载失败，只有当为起始页加载失败时 才有效果

 @param page 当前加载页码
 @param image image
 @param tip 提示
 @param tryAgainClick 点击返回事件
 */
- (void)xxx_loadErrorPage:(NSInteger)page image:(UIImage *)image tip:(NSString *)tip tryClick:(void (^)(void))tryAgainClick;


/**
 移除无数据视图
 */
- (void)xxx_viewRemoveNoDataView;


@end
