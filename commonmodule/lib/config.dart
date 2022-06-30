

import 'package:flutter_ulog/flutter_ulog.dart';

import 'net/http_config.dart';

class Config{
  final bool _debugState ;
  final ULogLibLog _libLog ;
  final ULogLibConfig _logConfig ;
  final String _appSafeCode ;
  final String _appSafeCodeIv ;
  final HttpConfig _httpConfig;
  final String? _storageRoot;

  String get appSafeCode{
    return _appSafeCode;
  }

  String get appSafeCodeIv{
    return _appSafeCodeIv;
  }


  String? get storageRoot{
    return _storageRoot;
  }

  bool get debugState{
    return _debugState;
  }

  ULogLibConfig get logConfig{
    return _logConfig;
  }

  HttpConfig get httpConfig{
    return _httpConfig;
  }

  ULogLibLog get libLog{
    return _libLog;
  }

  Config(ConfigBuilder builder): _debugState = builder._debugState,_logConfig = builder._logConfig,_appSafeCode = builder._appSafeCode,_httpConfig = builder._httpConfig,_storageRoot = builder._storageRoot,_libLog = builder._libLog,_appSafeCodeIv = builder._appSafeCodeIv;
}

class ConfigBuilder {
  bool _debugState = true;
  ULogLibConfig _logConfig = ULogLibConfigBuilder().build();
  ULogLibLog _libLog = ULogLibLogBuilder().build();
  String _appSafeCode = "DEFSAFE_12345678";
  String _appSafeCodeIv = "DEFA_IV_12345678";
  HttpConfig _httpConfig = HttpConfigBuilder().build();
  String? _storageRoot;

  ConfigBuilder setDebugState(bool debugState){
    _debugState = debugState;
    return this;
  }

  ConfigBuilder setLogConfig(ULogLibConfig logConfig){
    _logConfig = logConfig;
    return this;
  }

  ConfigBuilder setAppSafeCode(String appSafeCode){
    _appSafeCode = appSafeCode;
    return this;
  }

  ConfigBuilder setHttpConfig(HttpConfig httpConfig){
    _httpConfig = httpConfig;
    return this;
  }

  ConfigBuilder setAppSafeCodeIv(String appSafeCodeIv){
    _appSafeCodeIv = appSafeCodeIv;
    return this;
  }

  ConfigBuilder setStorageRoot(String storageRoot){
    _storageRoot = storageRoot;
    return this;
  }


  ConfigBuilder setLibLog(ULogLibLog value) {
    _libLog = value;
    return this;
  }

  Config build() => Config(this);
}

class ULogLibLog{
  final bool _libLog;
  final bool _lifecycleLog;
  final bool _environmentLog;
  final bool _applicationLog;
  final bool _netLog;
  final bool _storeLog;
  ULogLibLog(ULogLibLogBuilder builder): _libLog = builder._libLog,_lifecycleLog = builder._lifecycleLog,_environmentLog = builder._environmentLog,_applicationLog = builder._applicationLog,_netLog = builder._netLog,_storeLog = builder._storeLog;

  bool get storeLog => _storeLog;

  bool get netLog => _netLog;

  bool get applicationLog => _applicationLog;

  bool get environmentLog => _environmentLog;

  bool get lifecycleLog => _lifecycleLog;

  bool get libLog => _libLog;
}

class ULogLibLogBuilder {
  bool _libLog = true;
  bool _lifecycleLog = true;
  bool _environmentLog = true;
  bool _applicationLog = true;
  bool _netLog = true;
  bool _storeLog = true;


  ULogLibLogBuilder setLibLog(bool value) {
    _libLog = value;
    return this;
  }

  ULogLibLogBuilder setLifecycleLog(bool value) {
    _lifecycleLog = value;
    return this;
  }

  ULogLibLogBuilder setEnvironmentLog(bool value) {
    _environmentLog = value;
    return this;
  }

  ULogLibLogBuilder setApplicationLog(bool value) {
    _applicationLog = value;
    return this;
  }

  ULogLibLogBuilder setNetLog(bool value) {
    _netLog = value;
    return this;
  }

  ULogLibLogBuilder setStoreLog(bool value) {
    _storeLog = value;
    return this;
  }

  ULogLibLog build() => ULogLibLog(this);

}