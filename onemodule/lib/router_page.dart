

import 'package:flutter/widgets.dart';
import 'package:onemodule/page/page.dart';
import 'package:onemodule/router_name.dart';
import 'package:commonmodule/router_name.dart' as common;

import 'page/home.dart';


class RouterPage{

  static Widget? getRouter(RouteSettings settings){
    switch (settings.name) {
      case common.RouterName.home:
        return const HomePage();
      case RouterName.page:
        return const PagePage();
    }
  }

}
