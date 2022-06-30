
typedef ExpSave = Future<bool> Function(String key);
typedef ExpDataGet<T> = T Function(String key);

abstract class IStore{

  Future<bool> setDouble(String key, double value);
  double? getDouble(String key);

  Future<bool> setInt(String key, int value);
  int? getInt(String key);

  Future<bool> setBool(String key, bool value);
  bool? getBool(String key);


  Object? get(String key);
  Set<String> getKeys();

  Future<bool> remove(String key);

  Future<bool> clear();

  bool hasKey(String key);

  Future<void> reload();
  Future<bool> setString(String key, String value,{bool safe = false});
  String? getString(String key,{bool safe = false});

  Future<bool> setStringMap(String key, Map<String,String> value ,{bool safe = false});
  Map<String,String>? getStringMap(String key ,{bool safe = false});
}