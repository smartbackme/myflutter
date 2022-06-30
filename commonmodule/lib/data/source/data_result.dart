
///数据统一返回
class DataResult<T>{

  final T? data;

  DataResult(this.data);

}

class Success<T> extends DataResult<T>{
  Success(T data) : super(data);
}

class Error<T> extends DataResult<T>{
  final dynamic exception;
  Error(this.exception) : super(null);

}

class Loading<T> extends DataResult{
  Loading(T data) : super(data);
}

