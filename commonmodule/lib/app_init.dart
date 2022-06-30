

import 'package:flutter/widgets.dart';

class AppInit extends IInit{
  ICommentConfiger iCommentConfiger;

  AppInit(this.iCommentConfiger);
}


abstract class ICommentConfiger{
  Widget getRouter(RouteSettings settings);
}

abstract class IInit{
}