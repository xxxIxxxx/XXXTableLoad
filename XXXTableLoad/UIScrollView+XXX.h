//
//  UIScrollView+XXX.h
//  YTableEx
//
//  Created by 2YF on 2017/8/2.
//  Copyright © 2017年 FBW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (XXX)

#pragma mark -
#pragma mark - 常用


/**
 配置下拉动画 及 下拉 上拉 事件
 @param pullDownClick 下拉事件
 @param pullUpClick 上拉事件
 */
- (void)xxx_tableLoadDataClick:(void(^)(void))pullDownClick andPullUP:(void(^)(void))pullUpClick;


/**
 列表加载到数据之后调用此方法 判断是否显示继续加载更多数据
 @param singleCount 单次获取到数据量
 @param page 当前页码
 @param image 图片
 @param tips 提示文字
 @param tryAgain 点击事件 如果为nil 则不显示按钮
 */
- (void)xxx_tableGetSingleCount:(NSInteger )singleCount page:(NSInteger )page image:(UIImage *)image tips:(NSString *)tips tryClick:(void(^)(void))tryAgain;


#pragma mark -
#pragma mark - 结束上拉动画下拉动画
/**
 结束上拉动画 下拉动画
 */
- (void)xxx_tableStopAllRefreshAnimation;


#pragma mark - PullDown
/**
 直接进入刷新状态
 */
- (void)xxx_tableBeginRefresh;


/**
 tableView 下拉刷新配置
 @param pdClick 下拉事件的传递
 */
- (void)xxx_tableSetPullDownAnimatioAndPdClick:(void (^)(void))pdClick;


/**
 结束下拉动画
 */
- (void)xxx_tableStopPullDownAnimation;


#pragma mark - PullUp
/**
 tableView 上拉刷新配置
 @param puClick 上拉事件的传递
 */
- (void)xxx_tableSetPullUpAnimationWithPuClick:(void(^)(void))puClick;


/**
 结束上拉动画
 */
- (void)xxx_tableStopPullUpAnimation;


/**
 移除上拉动画的配置（即在没有更多数据时移除）
 */
- (void)xxx_tableRemovePullUpAnimation;



@end
