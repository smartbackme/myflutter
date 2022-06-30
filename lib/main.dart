import 'package:commonmodule/commonmodule.dart';
import 'package:commonmodule/config.dart';
import 'package:flutter/material.dart';
import 'package:commonmodule/router_name.dart' as common;
import 'package:kg_density/kg_density.dart';
import 'package:myflutter/page/home.dart';
import 'package:onemodule/router_page.dart' as onemodule;
import 'package:twomodule/router_page.dart' as twomodule;

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

void main() async {
  MyFlutterBinding.ensureInitialized();
  KgDensity.initKgDensity(designWidth : 375);
  await SpSotre.instance.init();
  ULogManager.init();
  Application.init(AppInit(MyCommentConfiger()));
  runApp(const MyApp());
}

class MyFlutterBinding extends WidgetsFlutterBinding with  KgFlutterBinding {

  static WidgetsBinding ensureInitialized() {
    if (WidgetsBinding.instance == null) MyFlutterBinding();
    return WidgetsBinding.instance!;
  }
}
