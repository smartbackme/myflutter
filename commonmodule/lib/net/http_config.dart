

class HttpConfig{
  final int _connectTimeout ;
  final int _receiveTimeOut ;
  final bool _retry;
  final int _retryCount;

  get connectTimeout{
    return _connectTimeout;
  }

  get receiveTimeOut{
    return _receiveTimeOut;
  }

  get retry{
    return _retry;
  }
  get retryCount{
    return _retryCount;
  }

  HttpConfig(HttpConfigBuilder builder): _connectTimeout = builder._connectTimeout,_receiveTimeOut = builder._receiveTimeOut,_retry = builder._retry,_retryCount = builder._retryCount;
}

class HttpConfigBuilder {
  int _connectTimeout = 10000;//连接超时时间
  int _receiveTimeOut = 30000;//接收超时时间
  bool _retry = false;
  int _retryCount = 3;

  // var maxRetry = 1 重试次数

  HttpConfigBuilder setConnectTimeout(int connectTimeout){
    _connectTimeout = connectTimeout;
    return this;
  }

  HttpConfigBuilder setReceiveTimeOut(int receiveTimeOut){
    _receiveTimeOut = receiveTimeOut;
    return this;
  }

  HttpConfigBuilder setRetry(bool retry){
    _retry = retry;
    return this;
  }

  HttpConfigBuilder setRetryCount(int retryCount){
    _retryCount = _retryCount;
    return this;
  }

  HttpConfig build() => HttpConfig(this);
}