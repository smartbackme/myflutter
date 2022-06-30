

// import '../../../../../flutter_mmkv/lib/src/mmkv_store.dart';
// import 'package:mmkv/mmkv.dart';


import 'package:commonmodule/store/sp_store.dart';

import '../contants.dart';

class HttpPersistent{

  static const int urlPresistent = 1;
  static const int headerPresistent = 2;
  static const int allPresistent = 3;

  // static MMKV _store(String baseUrl, int type) => MMKVStore.sysSafeMMKV(name: '${SysConfig.sysPersistent}${baseUrl}_${type.toString()}');
  static Map<String,Map<String, String>> headerPersistent = Map();
  static Map<String,Map<String, String>> urlPersistent = Map();

  static Map<String, String>? _storeMap(String baseUrl, int type){
    return SpSotre.instance.getStringMap('${SysConfig.sysPersistent}${baseUrl}_${type.toString()}',safe: true);
  }

  static _saveStoreMap(String baseUrl, int type,Map<String, String> value){
    SpSotre.instance.setStringMap('${SysConfig.sysPersistent}${baseUrl}_${type.toString()}',value,safe: true);
  }

  static _clear(String baseUrl, int type){
    SpSotre.instance.remove('${SysConfig.sysPersistent}${baseUrl}_${type.toString()}');
  }

  static _store(String baseUrl, int type,String key,String value){
    var store = _storeMap(baseUrl, type);
    if(store == null){
      store = {key : value};
    }else{
      store[key] = value;
    }
    _saveStoreMap(baseUrl, type, store);
  }

  static void setPersistent(String baseUrl,String key,String value,{int type = allPresistent}){
    if (type == allPresistent || type == headerPresistent) {
      if (!headerPersistent.containsKey(baseUrl)) {
        headerPersistent[baseUrl] = Map<String, String>();
      }
      var keyMap = headerPersistent[baseUrl]!;
      keyMap[key] = value;
      _store(baseUrl, headerPresistent , key, value);
    }
    if (type == allPresistent || type == urlPresistent) {
      if (!urlPersistent.containsKey(baseUrl)) {
        urlPersistent[baseUrl] = Map<String, String>();
      }
      var keyMap = urlPersistent[baseUrl]!;
      keyMap[key] = value;
      _store(baseUrl, urlPresistent,key, value);
    }
  }

  static void setPersistentMap(String baseUrl,Map<String, String> map,{int type = allPresistent}){
    if (type == allPresistent || type == headerPresistent) {
      if (!headerPersistent.containsKey(baseUrl)) {
        headerPersistent[baseUrl] = Map<String, String>();
      }
      var keyMap = headerPersistent[baseUrl]!;
      keyMap.addAll(map);
      _saveStoreMap(baseUrl, headerPresistent,keyMap);
      // keyMap.forEach((key, value) {
      //   _store(baseUrl, headerPresistent,key, value);
      // });
    }
    if (type == allPresistent || type == urlPresistent) {
      if (!urlPersistent.containsKey(baseUrl)) {
        urlPersistent[baseUrl] = Map<String, String>();
      }
      var keyMap = urlPersistent[baseUrl]!;
      keyMap.addAll(map);
      // keyMap.forEach((key, value) {
      //   _store(baseUrl, urlPresistent,key, value);
      // });
      _saveStoreMap(baseUrl, urlPresistent,keyMap);
    }
  }

  static Map<String, String>? getPersistent(String baseUrl, {int type = allPresistent}) {
    Map<String, String>? map;
    if (type == allPresistent || type == headerPresistent) {
      Map<String, String>? headerMap;
      if (headerPersistent.containsKey(baseUrl)) {
        headerMap = headerPersistent[baseUrl];
      } else {
        headerMap = null;
        for(var key in headerPersistent.keys){
          if(baseUrl.startsWith(key)){
            headerMap = headerPersistent[key];
            break;
          }
        }
      }
      if (headerMap != null) {
        if (map == null) {
          map = Map();
        }
        map.addAll(headerMap);
      }
    }
    if (type == allPresistent || type == urlPresistent) {
      Map<String, String>? urlMap;
      if (urlPersistent.containsKey(baseUrl)) {
        urlMap = urlPersistent[baseUrl];
      } else {
        urlMap = null;
        for(var key in urlPersistent.keys){
          if(baseUrl.startsWith(key)){
            urlMap = urlPersistent[key];
            break;
          }
        }
      }

      if (urlMap != null) {
        if (map == null) {
          map = Map();
        }
        map.addAll(urlMap);
      }
    }
    return map;
  }

  static Map<String, String> _all(String baseurl, int type) {
    var st = _storeMap(baseurl, type);
    // var keys = st.allKeys;
    // var map = Map<String, String?>();
    // keys.forEach((element) {
    //   var value = mmkv.decodeString(element);
    //   map[element] = value;
    // });
    return st??Map<String, String>();
  }

  static void flushPersistent(String baseurl, {int type = allPresistent}) {
    if (type == allPresistent || type == headerPresistent) {
      var map = _all(baseurl, headerPresistent);
      headerPersistent[baseurl]?.clear();

      if (!headerPersistent.containsKey(baseurl)) {
        headerPersistent[baseurl] = Map<String, String>();
      }
      var keyMap = headerPersistent[baseurl]!;
      keyMap.addAll(map);
    }
    if (type == allPresistent || type == urlPresistent) {
      var map = _all(baseurl, urlPresistent);
      urlPersistent[baseurl]?.clear();
      if (!urlPersistent.containsKey(baseurl)) {
        urlPersistent[baseurl] = Map<String, String>();
      }
      var keyMap = urlPersistent[baseurl]!;
      keyMap.addAll(map);
    }

  }

  static void removeAllPersistent(String baseurl, {int type = allPresistent}) {
    if (type == allPresistent || type == headerPresistent) {
      headerPersistent[baseurl]?.clear();
      _clear(baseurl, headerPresistent);
      // _store(baseurl, headerPresistent).clearAll();
    }
    if (type == allPresistent || type == urlPresistent) {
      urlPersistent[baseurl]?.clear();
      _clear(baseurl, urlPresistent);
      // _store(baseurl, urlPresistent).clearAll();
    }
  }
}