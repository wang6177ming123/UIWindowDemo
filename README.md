# UIWindowDemo
iOS 单例写窗口，当从后台回来时Window挡住原来的
写这个demo是在看唐巧老师的书之后写的一个的demo，毕竟demo比文字有说服力

在iOS应用中使用UIWindow和UIView来显示界面，UIWindow不包含任何默认的内容，但是他被当做UIView的容器，用于放置应用中所有的UIView

UIWindow 继承自UIView 基本上具有UIView的所有功能，以及一些增加的方法。

1.最常用的程序刚启动时设置窗口

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *na = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController  = na;

2.UIWindow的层级显示如下

 NSLog(@"UIWindowLevelNormal=%f\nUIWindowLevelAlert=%f\nUIWindowLevelStatusBar=%f",UIWindowLevelNormal,UIWindowLevelAlert,UIWindowLevelStatusBar);

UIWindowLevelNormal=0.000000
UIWindowLevelAlert=2000.000000
UIWindowLevelStatusBar=1000.000000

当有其他的UIWindow的时候在使用中层级会有其它数值，如alertview等等；

3.使用单例创建UIWindow

具体的地址见代码

demo中的用于当app 退出进入后台时调用单例，然后用新建的UIWindow覆盖到原来的UIWindow上面如果输入的密码正确就隐藏掉
