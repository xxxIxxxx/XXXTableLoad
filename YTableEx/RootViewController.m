//
//  RootViewController.m
//  YTableEx
//
//  Created by 2YF on 2018/5/16.
//  Copyright © 2018年 2YF. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"

@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSArray *dataArr;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    self.dataArr = @[
                     @"0.表正常数据请求",
                     @"1.表无数据",
                     @"2.表的数据量有限，无法继续上拉加载更多",
                     @"3.表请求失败，重试",
                     @"4.控制器视图 无数据",
                     @"5.控制器视图 重试",
                     ];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ViewController *vc = [ViewController new];
    vc.title = self.dataArr[indexPath.row];
    vc.type = indexPath.row;
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"111"];
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
