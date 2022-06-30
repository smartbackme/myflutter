
import 'package:flutter/widgets.dart';
import 'package:commonmodule/router_name.dart' as common;
import 'package:twomodule/router_name.dart';

import 'page/home.dart';
import 'page/page.dart';


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
