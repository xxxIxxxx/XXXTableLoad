Pod::Spec.new do |s|
  s.name         = 'XXXTableLoad'
  s.version      = '1.0.1'
  s.summary      = '快速为tableView配置下拉上拉动画及空数据展示'
  s.homepage     = 'https://github.com/xxxIxxxx/XXXTableLoad'
  s.license      = 'MIT'
  s.authors      = {'i2yf' => 'i2yf@vip.qq.com'}
  s.platform     = :ios
  s.platform     = :ios, "8.0"
  s.source       = {:git => 'https://github.com/xxxIxxxx/XXXTableLoad.git', :tag => s.version}
  s.source_files = 'XXXTableLoad/*.{h,m}'
  s.requires_arc = true
  s.dependency "MJRefresh", "~> 3.1.15.1"
  s.dependency "SDAutoLayout", "~> 2.2.0"
  s.dependency "ReactiveCocoa", "~> 2.5.0"
end