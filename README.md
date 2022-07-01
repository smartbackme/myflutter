# 前言
最近很多人在问我，没有一个不错的demo，不会如何做单工程模式，如何封装网络请求，如何去做网络持久化。那么今天我将demo分享出来。现阶段还无法把我构建的flutter快速开发框架开源出来。暂时用简化demo来展示。
相关文章：
[跟我学企业级flutter项目：flutter模块化，单工程架构模式构思与实践](https://blog.csdn.net/s297165331/article/details/124424002)

[跟我学企业级flutter项目：如何用dio封装一套企业级可扩展高效的网络层](https://blog.csdn.net/s297165331/article/details/123148819)

[跟我学企业级flutter项目：dio网络框架增加公共请求参数&header](https://blog.csdn.net/s297165331/article/details/122699977)

# demo地址：
[https://github.com/smartbackme/myflutter](https://github.com/smartbackme/myflutter)

为了大家更清楚的使用，我将对目录结构进行说明：
# 目录结构
![在这里插入图片描述](https://img-blog.csdnimg.cn/cb6f4d35762a4ea6ac188248dde2df79.png)
## 以模块一来说明
![在这里插入图片描述](https://img-blog.csdnimg.cn/d82a8db139984194a5726cfd267c3d13.png)
模块一启动配置：

```bash
class MyConfiger extends ICommentConfiger{

  @override
  Widget getRouter(RouteSettings settings) {
    var router = RouterPage.getRouter(settings);
    if(router!=null){
      return router;
    }
    return const NullRouter();
  }

}
void main() {
  Application.init(AppInit(MyConfiger()));
  runApp(const MyApp());
}
```

## 公共模块说明
![在这里插入图片描述](https://img-blog.csdnimg.cn/77aa6bba04ec4627b06bc2fa6463d9ee.png)
# 主工程启动说明

```bash
import 'package:commonmodule/commonmodule.dart';
import 'package:commonmodule/config.dart';
import 'package:flutter/material.dart';
import 'package:commonmodule/router_name.dart' as common;
import 'package:kg_density/kg_density.dart';
import 'package:myflutter/page/home.dart';
import 'package:onemodule/router_page.dart' as onemodule;
import 'package:twomodule/router_page.dart' as twomodule;

// 路由分配管理
class MyCommentConfiger extends ICommentConfiger{
  @override
  Widget getRouter(RouteSettings settings) {
    if(settings.name == common.RouterName.home){
      return const HomePage();
    }
    var teachertRouter = onemodule.RouterPage.getRouter(settings);
    if(teachertRouter!=null){
      return teachertRouter;
    }
    var clientRouter = twomodule.RouterPage.getRouter(settings);
    if(clientRouter!=null){
      return clientRouter;
    }
    return const NullRouter();

  }


}

//启动初始化
void main() async {
  MyFlutterBinding.ensureInitialized();
  KgDensity.initKgDensity(designWidth : 375);
  await SpSotre.instance.init();
  ULogManager.init();
  Application.init(AppInit(MyCommentConfiger()));
  runApp(const MyApp());
}

//WidgetsFlutterBinding 配置
class MyFlutterBinding extends WidgetsFlutterBinding with  KgFlutterBinding {

  static WidgetsBinding ensureInitialized() {
    if (WidgetsBinding.instance == null) MyFlutterBinding();
    return WidgetsBinding.instance!;
  }
}

```
