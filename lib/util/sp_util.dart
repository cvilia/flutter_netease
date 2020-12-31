import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static Future<String> getString(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }

  static Future<bool> getBool(String key, bool defaultValue) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getBool(key) ?? defaultValue;
  }

  static Future<int> getInt(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getInt(key);
  }

  static Future<double> getDouble(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getDouble(key);
  }

  static Future<void> putObject(String key, dynamic value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (value is String) {
      sp.setString(key, value);
    } else if (value is int) {
      sp.setInt(key, value);
    } else if (value is double) {
      sp.setDouble(key, value);
    } else if (value is bool) {
      sp.setBool(key, value);
    }
  }

  static Future<void> putString(String key, String value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  static Future<void> putBoolean(String key, bool value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool(key, value);
  }

  static Future<void> putInt(String key, int value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt(key, value);
  }

  static Future<void> putDouble(String key, double value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setDouble(key, value);
  }

  static Future<bool> clearAll() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.clear();
  }
}
