//
//  ViewController.m
//  YTableEx
//
//  Created by 2YF on 2018/5/15.
//  Copyright © 2018年 2YF. All rights reserved.
//

#import "ViewController.h"
#import "XXXTableHeader.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic ,unsafe_unretained) NSInteger page;

@property (nonatomic ,strong) NSMutableArray<NSString *> *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
   /* @"0.表正常数据请求",
    @"1.表无数据",
    @"2.表的数据量有限，无法继续上拉加载更多",
    @"3.表请求失败，重试",
    @"4.控制器视图 无数据",
    @"5.控制器视图 重试",*/
    
    
    /****      默认设置   可通过  XXXConfigManager   更改    ***/
    
//    XXXConfigManager.emptyTips = @"默认文字";
//    or
//    [XXXConfig manager].emptyTips = @"默认文字";
    
    //******************************
    
    /// 是否 为无数据  和   继续显示加载更多 通过这连个属性控制
    
    [XXXTableLoadConfig manager].startPage = 1;               ///数据的起始页码
    [XXXTableLoadConfig manager].singleMaxDataCount = 20;     ///后台单次返回的最大数据量
    
    
    //******************************
    
    __weak typeof(self) weakSelf = self;
    
    if (self.type == 4) {
        [self.view xxx_viewEmptyImage:nil andTip:self.title andTryClick:nil];
    }else if (self.type == 5) {
        [self.view xxx_viewEmptyImage:nil andTip:self.title andTryClick:^{
            [weakSelf.view xxx_viewRemoveNoDataView];
        }];
    }else {
        
        [self initTableView];
        self.dataArr = [NSMutableArray array];
        
        ///为tabelView 配置 下拉 上拉
        [weakSelf.tableView xxx_tableLoadDataClick:^{
            weakSelf.page = 1;
            [weakSelf addData];
        } andPullUP:^{
            weakSelf.page ++;
            [weakSelf addData];
        }];
        /// 使tableView 直接进入刷新状态
        [self.tableView xxx_tableBeginRefresh];
    }
}



- (void)addData {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if (self.page == 1) {
            [self.dataArr removeAllObjects];
        }
        
        ///模拟单次返回的数据
        NSMutableArray *singleDataArr = [NSMutableArray array];
        for (NSInteger i = self.page * 20 - 20; i < self.page * 20; i ++) {
            [singleDataArr addObject:[NSString stringWithFormat:@"%ld row",i]];
        }
        
        [self.dataArr addObjectsFromArray:singleDataArr];
        
        if (self.type == 1 ) {
            [singleDataArr removeAllObjects];
        }else if (self.type == 2) {
            [singleDataArr removeLastObject];
        }
        
        [self.tableView xxx_tableGetSingleCount:singleDataArr.count page:self.page image:nil tips:nil tryClick:nil];
        
        if (self.type == 3) {
            /// 当网络出现问题 请求未能到达服务端时 补全block即可 展示重试按钮
            __weak typeof(self) weakSelf = self;
            [self.tableView xxx_viewEmptyImage:nil andTip:nil andTryClick:^{
                /// 模拟恢复正常
                weakSelf.type = 0;
                [weakSelf addData];
            }];
            
        }
        
        
    });
}







- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController pushViewController:[ViewController new] animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"111"];
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}


- (void)initTableView {
    
    self.tableView = [UITableView new];
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }
    [self.view addSubview:self.tableView];
    
    float top = self.navigationController.navigationBar.frame.size.height +
    [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    self.tableView.frame = CGRectMake(0, top, self.view.bounds.size.width, self.view.bounds.size.height-top);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
