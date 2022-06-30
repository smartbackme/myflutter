
import 'package:commonmodule/data/model/api_result.dart';
import 'package:commonmodule/data/model/params/param_test_login.dart';
import 'package:commonmodule/data/model/responses/yj_user.dart';
import 'package:commonmodule/data/service/api_service.dart';
import 'package:commonmodule/data/source/remote/remote_base.dart';
import 'package:commonmodule/net/dio_utli.dart';
import 'package:commonmodule/data/source/remote/base_repository.dart';
import 'package:dio/dio.dart';

import '../data_result.dart';
abstract class ILibAppRemoteDataSource {

  Future<DataResult<ApiResult<YjUser>>> testLogin(
      String account, String password,String identityType);

}


class LibAppRemoteDataSource extends BaseRemoteDataSource with RemoteBase
    implements ILibAppRemoteDataSource  {
  var libRest = LibRestClient(DioUtil.instance("http://www.baidu.com/").dio);


  @override
  Future<DataResult<ApiResult<YjUser>>> testLogin(
      String account, String password,String identityType) async {
    return remoteDataResult(() => libRest.testLogin(TestLoginParams(account, password,identityType)));
  }
}
