//
//  UIScrollView+XXX.m
//  YTableEx
//
//  Created by 2YF on 2017/8/2.
//  Copyright © 2017年 FBW. All rights reserved.
//


#import "UIScrollView+XXX.h"
#import <MJRefresh/MJRefresh.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <SDAutoLayout/SDAutoLayout.h>
#import "XXXTableLoadConfig.h"
#import "UIView+XXX.h"

@implementation UIScrollView (EX)




#pragma mark -
#pragma mark -



- (void)xxx_tableLoadDataClick:(void(^)(BOOL isPullDown))refreshClick {
    [self xxx_tableSetPullDownAnimatioAndPdClick:^{
        if (refreshClick) {
            refreshClick(YES);
        }
    }];
    [self xxx_tableSetPullUpAnimationWithPuClick:^{
        if (refreshClick) {
            refreshClick(NO);
        }
    }];
    self.mj_footer.hidden = YES;
}

- (void)xxx_tableLoadDataClick:(void(^)(void))pullDownClick pullUP:(void(^)(void))pullUpClick {
    [self xxx_tableSetPullDownAnimatioAndPdClick:^{
        if (pullDownClick) {
            pullDownClick();
        }
    }];

    [self xxx_tableSetPullUpAnimationWithPuClick:^{
        if (pullUpClick) {
            pullUpClick();
        }
    }];
    self.mj_footer.hidden = YES;
}

- (void)xxx_tableGetSingleCount:(NSInteger )singleCount page:(NSInteger )page image:(UIImage *)image tips:(NSString *)tips tryClick:(void(^)(void))tryAgain {
    ///    page = XXXConfigManager.startPage  singleCount = 0 无数据
    if (page == XXXConfigManager.startPage && (singleCount == 0 || !singleCount)) {
        self.mj_footer.hidden = YES;
        if (tryAgain) {
            [self xxx_viewEmptyImage:image tip:tips tryClick:^{
                if (tryAgain) {
                    tryAgain();
                }
            }];
        }else{
            [self xxx_viewEmptyImage:image tip:tips tryClick:nil];
        }
    } else {
        [self xxx_viewRemoveNoDataView];
    }

    [self xxx_tableStopAllRefreshAnimation];

    /// 后台每页最多返回 多少条数据
    NSInteger pageNumber = XXXConfigManager.singleMaxDataCount;
    if (singleCount%pageNumber == 0 && singleCount != 0) {
        self.mj_footer.hidden = NO;
    } else {
        self.mj_footer.hidden = YES;
    }
    if ([self isKindOfClass:[UIScrollView class]]) {
        [(UITableView *)self reloadData];
        [(UICollectionView *)self reloadData];
    }
}

#pragma mark -
#pragma mark - 结束上拉动画下拉动画
- (void)xxx_tableStopAllRefreshAnimation {
    [self.mj_header endRefreshing];
    [self.mj_footer endRefreshing];
}

#pragma mark - PullDown
- (void)xxx_tableBeginRefresh {
    [self.mj_header beginRefreshing];
}

- (void)xxx_tableSetPullDownAnimatioAndPdClick:(void (^)(void))pdClick {
    
    MJRefreshHeader *header;
    if (XXXConfigManager.mjRefreshStateIdleImgArr) {
        MJRefreshGifHeader *gifHeader = [MJRefreshGifHeader headerWithRefreshingBlock:^{
            if (pdClick) {
                pdClick();
            }
        }];
        [gifHeader setImages:XXXConfigManager.mjRefreshStateIdleImgArr forState:MJRefreshStateIdle];
        [gifHeader setImages:XXXConfigManager.mjRefreshStatePullingImgArr forState:MJRefreshStatePulling];
        [gifHeader setImages:XXXConfigManager.mjRefreshStateRefreshingImgArr forState:MJRefreshStateRefreshing];
        [gifHeader setImages:XXXConfigManager.mjRefreshStateWillRefreshImgArr forState:MJRefreshStateWillRefresh];
        
        gifHeader.lastUpdatedTimeLabel.hidden = YES;
        gifHeader.stateLabel.hidden = YES;
        header = gifHeader;
    }else {
        MJRefreshNormalHeader *norHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            if (pdClick) {
                pdClick();
            }
        }];
        header = norHeader;
    }

    self.mj_header = header;
}

- (void)xxx_tableStopPullDownAnimation {
    [self.mj_header endRefreshing];
}


#pragma mark - PullUp
- (void)xxx_tableSetPullUpAnimationWithPuClick:(void(^)(void))puClick {
    self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        if (puClick) {
            puClick();
        }
    }];
}

- (void)xxx_tableStopPullUpAnimation {
    [self.mj_footer endRefreshing];
}

- (void)xxx_tableRemovePullUpAnimation {
    self.mj_footer.hidden = YES;
}


@end
