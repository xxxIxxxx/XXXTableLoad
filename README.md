# XXXTableLoad

![效果图](https://ws1.sinaimg.cn/large/006tNc79gy1freay40vu8g30ap0nn1kx.gif)

##### [直达 GitHub](https://github.com/xxxIxxxx/XXXTableLoad)



#### **此工程依赖 [MJRefresh](https://github.com/CoderMJLee/MJRefresh)、[SDAutoLayout](https://github.com/gsdios/SDAutoLayout)、[ReactiveCocoa 2.5.0](https://github.com/ReactiveCocoa/ReactiveCocoa)** 在使用pod导入时会自动导入
> ####主要针是对[MJRefresh](https://github.com/CoderMJLee/MJRefresh)进一步封装，感谢[李明杰CoderMJLee](https://github.com/CoderMJLee)。
> ####[SDAutoLayout](https://github.com/gsdios/SDAutoLayout)在工程中负责空数据界面的布局，感谢[高少东GSD](https://github.com/gsdios)
> ####[ReactiveCocoa 2.5.0](https://github.com/ReactiveCocoa/ReactiveCocoa)主要负责将重试按钮的点击事件回传

-



### 安装

```
1.pod search XXXTableLoad
如未搜索到 请执行 pod repo update 进行更新，然后清除搜索缓存 rm ~/Library/Caches/CocoaPods/search_index.json

2.pod 'XXXTableLoad', '~> 1.0.1'

3.#import <XXXTableHeader.h>

3.设置配置项 通过 `XXXTableLoadConfig` 设置相关配置

```
-
#####  主要根据配置的 [XXXTableLoadConfig manager].startPage 和 [XXXTableLoadConfig manager].singleMaxDataCount 来判断是否为空数据界面

#####[XXXTableLoadConfig manager].startPage 为数据加载的起始页码默认为1
#####[XXXTableLoadConfig manager].singleMaxDataCount 为后台单次返回的最大数据量默认为20条

### 使用

1.使用tableView调用此方法快速为tableView配置下拉动画 上拉动画

```
-(void)xxx_tableLoadDataClick:(void(^)(void))pullDownClick andPullUP:(void(^)(void))pullUpClic
```

2.单独配置下拉动画

```
-(void)xxx_tableSetPullDownAnimatioAndPdClick:(void (^)(void))pdClick;
```

3.与1.2方法配合使用，使用tableView调用此方法停止动画，并刷新列表

```
- (void)xxx_tableGetSingleCount:(NSInteger )singleCount page:(NSInteger )page image:(UIImage *)image tips:(NSString *)tips tryClick:(void(^)(void))tryAgain;
```
4.**重试按钮根据是否补全tryClick来进行展示，一般在请求失败时补全**

##具体使用方法请看Demo

