
///本地数据源基础继承
abstract class BaseLocalDataSource{}
///网络数据源基础继承
abstract class BaseRemoteDataSource{}
///数据仓库基础类
abstract class BaseRepository<T1 extends BaseLocalDataSource?, T2 extends BaseRemoteDataSource?>{
  final T1? localDataSource;
  final T2? remoteDataSource;

  BaseRepository({this.localDataSource, this.remoteDataSource});
}
