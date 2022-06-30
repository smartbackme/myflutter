
import 'dart:io';

import 'package:dio/dio.dart';

class LibNetWorkException implements Exception{

  final String _message;
  final int _code;

  int get code{
    return _code;
  }

  String get message{
    return _message;
  }

  LibNetWorkException( this._code,this._message);

  @override
  String toString() {
    return "$_code : $_message";
  }



  factory LibNetWorkException.create(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:{
          return LibNetWorkException(-1, "请求取消");
        }
      case DioErrorType.connectTimeout:{
          return LibNetWorkException(-1, "网络请求失败,请检查");
        }
      case DioErrorType.sendTimeout:{
          return LibNetWorkException(-1, "网络请求超时,请检查");
        }
      case DioErrorType.receiveTimeout:{
          return LibNetWorkException(-1, "服务器响应超时");
        }
      case DioErrorType.response:{
          try{
            return LibNetWorkException(error.response!.statusCode!,"HTTP ${error.response!.statusCode!}:服务器错误");
          } catch (_) {
            return LibNetWorkException(-1, "数据异常:${error.error.toString()}");
          }
        }
      case DioErrorType.other:{
        if (error.error is SocketException) {
          return LibNetWorkException(-1, error.error.message);
        } else {
          return LibNetWorkException(-1, error.error.toString());
        }
      }
      default:{
          return LibNetWorkException(-1, error.error.toString());
      }
    }
  }
}
