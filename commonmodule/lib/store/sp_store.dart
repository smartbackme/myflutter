
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

import '../secret_util.dart';
import 'i_store.dart';

class SpSotre implements IStore{

  late SharedPreferences _prefs;

  SpSotre._();

  static final SpSotre _instance = SpSotre._();

  static SpSotre get instance {
    return _instance;
  }

  Future init() async{
    _prefs = await SharedPreferences.getInstance();
  }


  @override
  Future<bool> clear() async {
    return await _prefs.clear();
  }

  @override
  Object? get(String key) {
    return _prefs.get(key);
  }

  @override
  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  @override
  double? getDouble(String key) {
    return _prefs.getDouble(key);
  }

  @override
  int? getInt(String key) {
    return _prefs.getInt(key);
  }

  @override
  Set<String> getKeys() {
    return _prefs.getKeys();
  }


  @override
  bool hasKey(String key) {
    return _prefs.containsKey(key);
  }

  @override
  Future<void> reload() async {
    return await _prefs.reload();
  }

  @override
  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  @override
  Future<bool> setDouble(String key, double value) async {
    return await _prefs.setDouble(key, value);
  }

  @override
  Future<bool> setInt(String key, int value) async {
    return await _prefs.setInt(key, value);
  }

  @override
  Map<String, String>? getStringMap(String key, {bool safe = false}) {
    var value = getString(key,safe: safe);
    if(value!=null){
      return new Map<String, String>.from(convert.jsonDecode(value));
    }
    return null;
  }

  @override
  Future<bool> setStringMap(String key, Map<String, String> value, {bool safe = false}) async{
    String valueJson = convert.jsonEncode(value);
    return await setString(key, valueJson,safe: safe);
  }



  @override
  Future<bool> setString(String key, String value, {bool safe = false}) async {
    var v = value;
    if(safe){
      v = SecretUtil.encryptAES(value);
    }
    return await _prefs.setString(key, v);
  }

  @override
  String? getString(String key, {bool safe = false}) {
    var value = _prefs.getString(key);
    if(value!=null){
      if(safe){
        return SecretUtil.decryptAES(value);
      }
    }
    return value;


  }
}