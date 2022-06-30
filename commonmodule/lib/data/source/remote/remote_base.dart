
import 'package:commonmodule/data/model/api_result.dart';
import 'package:commonmodule/exception/bussiness_exception.dart';
import 'package:commonmodule/exception/lib_network_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter_ulog/flutter_ulog.dart';

import '../../user_store.dart';
import '../data_result.dart';


const int httpSuccessCode = 0;
const int httpErrorCode = 1;
const int httpTokenExt = 10001;

extension SuccessExt<T> on Success<T> {
  Success<T> appSuccess() {
    var data = this.data;
    if (data is ApiResult) {
      if (data.code != httpSuccessCode) {
        if (data.code == httpTokenExt) {
          UserStore().onLogout();
        }
        // TipToast.instance.tip(data.message ?? YJString.yjNetCommonError,
        //     tipType: TipType.normal);
        throw BusinessErrorException(data.code!, data.message);
      }
    }
    // else if (data is YjApiResult) {
    //   if (data.code != httpSuccessCode) {
    //     if (data.code == httpErrorCode) {
    //       if (data.message == '暂无权限') {
    //         UserStore().onLogout();
    //       }
    //     }
    //     TipToast.instance.tip(data.message ?? YJString.yjNetCommonError,
    //         tipType: TipType.normal);
    //     throw BusinessErrorException(data.code!, data.message);
    //   }
    // }
    return this;
  }
}

extension ErrorExt<T> on Error<T> {
  void appError() {
    var exception = this.exception;
    if (exception is LibNetWorkException) {
      // TipToast.instance.tip(exception.message, tipType: TipType.error);
    }
  }
}


typedef ResultF<T> = Future<ApiResult<T>> Function();

mixin RemoteBase {


  Future<DataResult<ApiResult<T>>> remoteDataResult<T>(ResultF<T> resultF) async {
    try {
      var data = await resultF.call();
      return Success(data).appSuccess();
    } on DioError catch (err, stack) {
      var e = err.error;
      ULog.e(e.toString(), error: e, stackTrace: stack);
      return Error(e)..appError();
    } catch (e, stack) {
      ULog.e(e.toString(), error: e, stackTrace: stack);
      return Error(e)..appError();
    }
  }


}