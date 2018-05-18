# XXXTableLoad

![效果图](https://ws1.sinaimg.cn/large/006tNc79gy1freay40vu8g30ap0nn1kx.gif)

### 使用

1. `pod 'XXXTableLoad', '~> 1.0.1'`
2. ` #import "XXXTableHeader.h" `
3. 设置配置项 通过 `XXXTableLoadConfig` 设置相关配置


### **主要根据配置的 [XXXTableLoadConfig manager].startPage 和 [XXXTableLoadConfig manager].singleMaxDataCount 来判断是否为空数据界面**


#### 配置下拉上拉动画及事件
```
__weak typeof(self) weakSelf = self;
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
```

#### 数据请求到后相关操作
```
[self.tableView xxx_tableGetSingleCount:singleDataArr.count page:self.page image:nil tips:nil tryClick:nil]

/// 当网络出现问题 请求未能到达服务端时 补全block即可 展示重试按钮
            __weak typeof(self) weakSelf = self;
            [self.tableView xxx_viewEmptyImage:nil andTip:nil andTryClick:^{
                /// 模拟恢复正常
                weakSelf.type = 0;
                [weakSelf addData];
            }];

```

### **重试按钮根据是否补全tryClick来进行展示，一般在请求失败时补全**



