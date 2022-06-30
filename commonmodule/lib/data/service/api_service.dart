

import 'package:commonmodule/data/model/api_result.dart';
import 'package:commonmodule/data/model/params/param_test_login.dart';
import 'package:commonmodule/data/model/responses/yj_user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'api_methods.dart';

abstract class LibRestClient {
  factory LibRestClient(Dio dio, {String baseUrl}) = _LibRestClient;

  /// 登录
  @POST(LibApiMethods.testLogin)
  Future<ApiResult<YjUser>> testLogin(@Body() TestLoginParams params);


}



class _LibRestClient implements LibRestClient {
  _LibRestClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ApiResult<YjUser>> testLogin(params) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(params.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResult<YjUser>>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/app/login/appUserLogin',
                queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResult<YjUser>.fromJson(
      _result.data!,
          (json) => YjUser.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
