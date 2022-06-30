

import 'package:commonmodule/data/model/api_result.dart';
import 'package:commonmodule/data/model/params/param_test_login.dart';
import 'package:commonmodule/data/model/responses/yj_user.dart';
import 'package:commonmodule/data/service/api_service.dart';
import 'package:commonmodule/data/source/remote/lib_app_remote_data_source.dart';
import 'package:commonmodule/data/source/remote/remote_base.dart';
import 'package:commonmodule/net/dio_utli.dart';
import 'package:commonmodule/data/source/remote/base_repository.dart';

import 'data_result.dart';

class LibAppResponsitory extends BaseRepository<Null, LibAppRemoteDataSource>
    implements ILibAppRemoteDataSource {
  LibAppResponsitory() : super(remoteDataSource: LibAppRemoteDataSource());

  static LibAppResponsitory? _instance;

  static LibAppResponsitory _getInstance() {
    if (_instance == null) {
      _instance = LibAppResponsitory();
    }
    return _instance!;
  }

  static LibAppResponsitory get instance => _getInstance();

  @override
  Future<DataResult<ApiResult<YjUser>>> testLogin(
      String account, String password,String identityType) {
    return remoteDataSource!.testLogin(account, password,identityType);
  }

}