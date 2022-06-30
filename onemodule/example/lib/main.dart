
import 'package:flutter/widgets.dart';
import 'package:onemodule/onemodule.dart';

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