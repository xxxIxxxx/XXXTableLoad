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
- (void)xxx_viewEmptyImage:(UIImage *)image andTip:(NSString *)tip andTryClick:(void (^)(void))tryAgainClick;



/**
 移除无数据视图
 */
- (void)xxx_viewRemoveNoDataView;


@end
