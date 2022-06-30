import 'package:flutter_ulog/flutter_ulog.dart';

import 'application.dart';
import 'contants.dart';

class ULogManager{

  static void init(){
    var config = Application.config;
    // ULog.init((value){
    //   return ;
    // });
    if(config.debugState){
      ULog.addLogAdapter(ConsoleAdapter());
    }
  }
}

class ConsoleAdapter extends ULogConsoleAdapter{

  ConsoleAdapter():super(formatStrategy: ULogLibConsoleFormatStrategy()..config = Application.config.logConfig);

  @override
  bool isLoggable(ULogType type, String? tag) {
    if(Application.config.debugState){
      return _isLog(tag);
    }else{
      return false;
    }
  }

  bool _isLog(String? tag){
    var log = Application.config.libLog;
    if(log.libLog){
      if(tag!=null){
        if(tag.contains(SysConfig.libApplicationTag)){
          if(!log.applicationLog){
            return false;
          }
        }else if(tag.contains(SysConfig.libEnvironmentTag)){
          if(!log.environmentLog){
            return false;
          }
        }else if(tag.contains(SysConfig.libLifeCycleTag)){
          if(!log.lifecycleLog){
            return false;
          }
        }else if(tag.contains(SysConfig.libNetTag)){
          if(!log.netLog){
            return false;
          }
        }else if(tag.contains(SysConfig.libStoreTag)){
          if(!log.storeLog){
            return false;
          }
        }
      }
    }else{
      if(tag!=null&&tag.contains(SysConfig.libTag)){
        return false;
      }
    }
    return true;
  }
}