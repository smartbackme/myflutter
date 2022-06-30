


import 'app_init.dart';
import 'config.dart';

class Application{
  static Config config = ConfigBuilder().build();

  static late IInit initImpl;
  static void init(IInit init) {
    initImpl = init;
  }

}
