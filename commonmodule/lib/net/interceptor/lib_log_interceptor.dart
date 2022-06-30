
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_ulog/flutter_ulog.dart';

import '../../contants.dart';
typedef void LibLogPrint(String message);
class LibLogInterceptor extends Interceptor {
  LibLogInterceptor({
    this.request = true,
    this.requestHeader = true,
    this.requestBody = false,
    this.responseHeader = true,
    this.responseBody = false,
    this.error = true
  });

  /// Print request [Options]
  bool request;

  /// Print request header [Options.headers]
  bool requestHeader;

  /// Print request data [Options.data]
  bool requestBody;

  /// Print [Response.data]
  bool responseBody;

  /// Print [Response.headers]
  bool responseHeader;

  /// Print error message
  bool error;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var builder = StringBuffer('*** Request *** \n');
    builder.write(_printKV('uri', options.uri));
    //options.headers;

    if (request) {
      builder.write(_printKV('method', options.method));
      builder.write(_printKV('responseType', options.responseType.toString()));
      builder.write(_printKV('followRedirects', options.followRedirects));
      builder.write(_printKV('connectTimeout', options.connectTimeout));
      builder.write(_printKV('sendTimeout', options.sendTimeout));
      builder.write(_printKV('receiveTimeout', options.receiveTimeout));
      builder.write(_printKV(
          'receiveDataWhenStatusError', options.receiveDataWhenStatusError));
          builder.write(_printKV('extra', options.extra));
    }
    if (requestHeader) {
      builder.write('headers:\n');
      options.headers.forEach((key, v) => builder.write(_printKV(' $key', v)));
    }
    if (requestBody) {
      var res = options.data;
      builder.write('data:\n');
      builder.write(_message(res));
      // try{
      //   ULog.json(res.toString(),tag: "${SysConfig.libNetTag}RequestJson");
      // } on Exception catch (e) {
      //   ULog.d(res,tag: "${SysConfig.libNetTag}RequestJson");
      // }
    }
    ULog.d(builder.toString(),tag: "${SysConfig.libNetTag}Request");
    handler.next(options);
  }

  // Handles any object that is causing JsonEncoder() problems
  Object toEncodableFallback(dynamic object) {
    return object.toString();
  }

  String _message(dynamic res) {
    if (res is Map || res is Iterable) {
      var encoder = JsonEncoder.withIndent('  ', toEncodableFallback);
      return encoder.convert(res);
    } else {
      return res.toString();
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    var builder = StringBuffer('*** Response *** \n');
    _printResponse(response,builder,(message){
      ULog.d(message,tag: "${SysConfig.libNetTag}Response");
    });
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (error) {
      var builder = StringBuffer('*** DioError *** \n');
      builder.write('uri: ${err.requestOptions.uri}\n');
      builder.write('$err');
      if (err.response != null) {
        _printResponse(err.response!,builder,(message){
          ULog.e(message,tag: "${SysConfig.libNetTag}Error");
        });
      }else{
        ULog.e(builder.toString(),tag: "${SysConfig.libNetTag}Error");
      }
    }

    handler.next(err);
  }

  void _printResponse(Response response,StringBuffer builder,LibLogPrint pr) {
    builder.write(_printKV('uri', response.requestOptions.uri));
    if (responseHeader) {
      builder.write(_printKV('statusCode', response.statusCode));
      if (response.isRedirect == true) {
        builder.write(_printKV('redirect', response.realUri));
      }

      builder.write('headers:\n');
      response.headers.forEach((key, v) => builder.write(_printKV(' $key', v.join('\r\n\t'))));
    }
    if (responseBody) {
      var res = response.toString();
      builder.write('Response Text:\r\n');
      var resJ = res.trim();
      if (resJ.startsWith("{")) {
        Map<String, dynamic> decode = JsonCodec().decode(resJ);
        builder.write(_message(decode));
      }else if (resJ.startsWith("[")) {
        List decode = JsonCodec().decode(resJ);
        builder.write(_message(decode));
      }else {
        builder.write(res);
      }

      // try{
      //   ULog.json(res,tag: "${SysConfig.libNetTag}ResponseJson");
      // } on Exception catch (e) {
      //   ULog.d(res,tag: "${SysConfig.libNetTag}ResponseJson");
      // }
    }
    pr(builder.toString());

  }

  String _printKV(String key, Object? v) {
    return '$key: $v \n';
  }

}
