

import 'dart:io';

import 'package:commonmodule/store/sp_store.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import '../application.dart';
import '../contants.dart';
import 'http_config.dart';
import 'interceptor/error_interceptor.dart';
import 'interceptor/lib_log_interceptor.dart';
import 'interceptor/presistent_interceptor.dart';
import 'interceptor/retry_on_connection_change_interceptor.dart';
import 'interceptor/time_interceptor.dart';

class DioUtil{

  final String _baseUrl;
  final HttpConfig _config;
  final List<Interceptor> _interceptors;

  late Dio _dio;

  Dio get dio{
    return _dio;
  }
  DioUtil._internal(this._baseUrl, this._config, this._interceptors){
    BaseOptions options = new BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: _config.connectTimeout,
      receiveTimeout: _config.receiveTimeOut,
    );
    _dio = new Dio(options);
    var retry = new Dio(options);
    _interceptors.forEach((element) {
      if(element is RetryOnConnectionChangeInterceptor){
        element.dio = retry;
      }else{
        if(!(element is ErrorInterceptor)){
          retry.interceptors.add(element);
        }
      }
      _dio.interceptors.add(element);
    });
    proxy(_dio);
    proxy(retry);
  }

  void proxy(Dio dio){
    if (SpSotre.instance.getBool(SysConfig.PROXY_ENABLE)??false) {
      String? porxy = SpSotre.instance.getString(SysConfig.PROXY_IP_PROT)??null;
      if(porxy!=null){
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
            (client) {
          client.findProxy = (uri) {
            return "PROXY $porxy";
          };
          //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
        };
      }
    }
  }

  static late Map<String,DioUtil> _dioUtils = Map();

  static DioUtil instance(String baseUrl,{HttpConfig? config, List<Interceptor>? interceptors,List<Interceptor>? applyInterceptors}){
    if(!_dioUtils.containsKey(baseUrl)){
      List<Interceptor> list = [PresistentInterceptor(),TimeInterceptor(),RetryOnConnectionChangeInterceptor(),LibLogInterceptor(requestBody: Application.config.debugState,responseBody: Application.config.debugState),ErrorInterceptor()];
      // List<Interceptor> list = [ErrorInterceptor(),PresistentInterceptor()];
      var inter = interceptors??list;
      if(applyInterceptors!=null){
        inter.addAll(applyInterceptors);
      }
      _dioUtils[baseUrl] = DioUtil._internal(baseUrl,config??Application.config.httpConfig,inter);
    }
    return _dioUtils[baseUrl]!;
  }

  // CancelToken _cancelToken = new CancelToken();

  static late Map<String,Dio> _dioB = Map();

  static void add(String key,Dio dio){
    _dioB[key] = dio;
  }

  static Dio getDio(String key) => _dioB[key]!;


}