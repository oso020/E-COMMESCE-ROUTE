import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveDate({required String key, required dynamic value}) {
    if (value is int) {
      return sharedPreferences.setInt(key, value);
    } else if (value is String) {
      return sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return sharedPreferences.setBool(key, value);
    } else {
      return sharedPreferences.setDouble(key, value);
    }
  }

  static Object? getData(String key) {
    return sharedPreferences.get(key);
  }

  static Future<bool> removeDate({required String key}) async {
    return await sharedPreferences.remove(key);
  }
}
