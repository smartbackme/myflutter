
import 'dart:io';

import 'package:commonmodule/exception/lib_network_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter_ulog/flutter_ulog.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../contants.dart';

/// 错误处理拦截器
class ErrorInterceptor extends Interceptor {
// 是否有网
  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.type == DioErrorType.other) {
      bool isConnectNetWork = await isConnected();
      if (!isConnectNetWork && err.error is SocketException) {
        err.error = SocketException("当前网络不可用，请检查您的网络");
      }else if (err.error is SocketException){
        err.error = SocketException("网络错误，请检查网络");
      }
    }
    err.error = LibNetWorkException.create(err);
    ULog.d('DioError : ${err.error.toString()}',tag: "${SysConfig.libNetTag}Interceptor");
    super.onError(err, handler);
  }

}