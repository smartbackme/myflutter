//
// import 'dart:async';
//
// import 'package:flutter/services.dart';
//
// class Commonmodule {
//   static const MethodChannel _channel = MethodChannel('commonmodule');
//
//   static Future<String?> get platformVersion async {
//     final String? version = await _channel.invokeMethod('getPlatformVersion');
//     return version;
//   }
// }
//
//

export 'package:commonmodule/app_init.dart';
export 'package:commonmodule/application.dart';
export 'package:commonmodule/router_name.dart';
export 'package:commonmodule/page/null_router.dart';
export 'package:commonmodule/app.dart';
export 'package:commonmodule/store/sp_store.dart';
export 'package:commonmodule/data/source/lib_app_responsitory.dart';
export 'package:flutter_ulog/flutter_ulog.dart';
export 'package:commonmodule/ulog_manager.dart';