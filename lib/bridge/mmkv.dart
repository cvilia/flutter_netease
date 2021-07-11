import 'dart:ffi';

import 'package:flutter/services.dart';

import 'log.dart';

class MMKV {
  static MethodChannel _mmkvChannel = MethodChannel('com.cvilia.bubblemusic.io/mmkv');

  static Future<bool> setInt(String key, int value) async {
    return await _invokeSet('setInt', key, value);
  }

  static Future<bool> setDouble(String key, double value) async {
    return await _invokeSet('setDouble', key, value);
  }

  static Future<bool> setString(String key, String value) async {
    return await _invokeSet('setString', key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _invokeSet('setBool', key, value);
  }

  static Future<int> getInt(String key, {int? defaultValue = -1}) async {
    return await _invokeGet('getInt', key, defaultValue: defaultValue);
  }

  static Future<Double> getDouble(String key, {double? defaultValue = -1.0}) async {
    return await _invokeGet('getDouble', key, defaultValue: defaultValue);
  }

  static Future<String?> getString(String key, {String? defaultValue = ''}) async {
    if (await _invokeGet('getString', key) == '') return null;
    return await _invokeGet('getString', key);
  }

  static Future<bool> getBool(String key, {bool? defaultValue = false}) async {
    return await _invokeGet('getBool', key);
  }

  static Future<bool> _invokeSet(String method, String key, dynamic value) async {
    try {
      return await _mmkvChannel.invokeMethod(method, {'value': value, "key": key});
    } on MissingPluginException catch (e) {
      Log.e('MMKV', 'bridge Log miss plugin,error message  ---  ${e.message}');
    } on PlatformException catch (e) {
      Log.e('MMKV', 'invoke method Log.$method error,error message:${e.message}');
    }
    return false;
  }

  static Future<dynamic> _invokeGet(String method, String key, {dynamic defaultValue}) async {
    try {
      return await _mmkvChannel.invokeMethod(method, {"key": key, 'value': defaultValue});
    } on MissingPluginException catch (e) {
      Log.e('MMKV', 'bridge Log miss plugin,,error message  ---  ${e.message}');
    } on PlatformException catch (e) {
      Log.e('MMKV', 'invoke method Log.$method error,error message:${e.message}');
    }
    return null;
  }
}
