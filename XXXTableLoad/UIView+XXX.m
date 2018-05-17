//
//  UIView+XXX.m
//  YTableEx
//
//  Created by 2YF on 2018/5/16.
//  Copyright © 2018年 2YF. All rights reserved.
//

#import "UIView+XXX.h"
#import "XXXTableLoadConfig.h"
#import <SDAutoLayout/SDAutoLayout.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation UIView (XXX)
#pragma mark - noDta
- (void)xxx_viewEmptyImage:(UIImage *)image andTip:(NSString *)tip andTryClick:(void (^)(void))tryAgainClick {
    

    [self xxx_viewRemoveNoDataView];
    
    if (![self viewWithTag:XXXConfigManager.emptyViewTag]) {
        ///底部灰色视图
        UIView *emptyView = [UIView new];
        emptyView.tag = XXXConfigManager.emptyViewTag;
        
        float tableWidth = self.frame.size.width;
        float tableHeight = self.frame.size.height;
        
        emptyView.frame = CGRectMake(0, 0, tableWidth, tableHeight);
        emptyView.backgroundColor = XXXConfigManager.emptyBackgroundColor;
        
        
        
        UILabel *tipLabel = [UILabel new];
        [emptyView addSubview:tipLabel];
        tipLabel.textAlignment = NSTextAlignmentCenter;
        
        UIImageView *emptyImageView = [UIImageView new];
        [emptyView addSubview:emptyImageView];
        
        ///frame
        tipLabel.sd_layout.centerXEqualToView(emptyView).widthIs(XXX_WIDTH)
        .heightIs(XXXConfigManager.emptyTipsFont.lineHeight).centerYEqualToView(emptyView);
        
        emptyImageView.sd_layout.centerXEqualToView(emptyView).widthIs(50)
        .bottomSpaceToView(tipLabel, 20).heightIs(50);
        
        [self addSubview:emptyView];
        
        
        
        if (tryAgainClick) {
            UIButton *tryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [emptyView addSubview:tryBtn];
            tryBtn.titleLabel.font = XXXConfigManager.tryBtnFont;
            tryBtn.backgroundColor = XXXConfigManager.tryBtnBackgroundColor;
            [tryBtn setTitle:XXXConfigManager.tryBtnTitle forState:UIControlStateNormal];
            [tryBtn setTitleColor:XXXConfigManager.tryBtnTitleColor forState:UIControlStateNormal];
            [[tryBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
                tryAgainClick();
            }];
            tryBtn.sd_layout.centerXEqualToView(emptyView).topSpaceToView(tipLabel, 25).heightIs(35);
            [tryBtn setupAutoSizeWithHorizontalPadding:20.0 buttonHeight:35];
            
            tip = tip?tip:XXXConfigManager.tryTips;
            image = image?image:XXXConfigManager.tryImage;
        }else {
            tip = tip?tip:XXXConfigManager.emptyTips;
            image = image?image:XXXConfigManager.emptyImage;
        }
        
        tipLabel.text = tip;
        emptyImageView.image = image;
        tipLabel.textColor = XXXConfigManager.emptyTipsColor;
        tipLabel.font = XXXConfigManager.emptyTipsFont;
        
        if ([self isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scrollSelf = (UIScrollView *)self;
            scrollSelf.scrollEnabled = NO;
        }
    }
}



- (void)xxx_viewRemoveNoDataView {
    if ([self viewWithTag:XXXConfigManager.emptyViewTag]) {
        if ([self isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scrollSelf = (UIScrollView *)self;
            scrollSelf.scrollEnabled = YES;
        }
        UIView *emptyView = [self viewWithTag:XXXConfigManager.emptyViewTag];
        [emptyView removeFromSuperview];
    }
}

@end
