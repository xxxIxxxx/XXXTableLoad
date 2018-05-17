//
//  ViewController.h
//  YTableEx
//
//  Created by 2YF on 2018/5/15.
//  Copyright © 2018年 2YF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


/**
 @"0.表正常数据请求",
 @"1.表无数据",
 @"2.表的数据量有限，无法继续上拉加载更多",
 @"3.表请求失败，重试",
 @"4.控制器视图 无数据",
 @"5.控制器视图 重试",
 */
@property (nonatomic ,unsafe_unretained) NSInteger type;

@end

