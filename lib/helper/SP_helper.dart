import 'package:shared_preferences/shared_preferences.dart';

class sp_helper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    return await sharedPreferences.setString(key, value);
  }

  static Future<bool> removeData({
    required String key,
  }) async {
    return await sharedPreferences.remove(key);
  }

  static Future<bool> updateDate(
      {required String key, required dynamic value}) async {
    return await sharedPreferences.setString(key, value);
  }
}
