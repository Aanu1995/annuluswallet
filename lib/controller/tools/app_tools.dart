import 'package:shared_preferences/shared_preferences.dart';

writeStringDataLocally({String key, String value}) async {
  SharedPreferences local = await SharedPreferences.getInstance();
  local.setString(key, value);
}

writeBoolDataLocally({String key, bool value}) async {
  SharedPreferences local = await SharedPreferences.getInstance();
  local.setBool(key, value);
}

writeIntegerDataLocally({String key, int value}) async {
  SharedPreferences local = await SharedPreferences.getInstance();
  local.setInt(key, value);
}

Future<String> getStringDataLocally({String key}) async {
  SharedPreferences local = await SharedPreferences.getInstance();
  return local.getString(key);
}

getIntegerDataLocally({String key}) async {
  SharedPreferences local = await SharedPreferences.getInstance();
  return local.getInt(key);
}

getBoolDataLocally({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences local = await saveLocal;
  return local.getBool(key);
}

removeDataLocally({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences local = await saveLocal;
  local.remove(key);
}

clearDataLocally() async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences local = await saveLocal;
  local.clear();
}
