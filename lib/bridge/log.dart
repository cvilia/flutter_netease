import 'package:flutter/services.dart';

const MethodChannel logChannel = MethodChannel('com.cvilia.bubblemusic.log/log');

class Log {
  static void d(String? key, String message) {
    _invokeNative('d', key, message);
  }

  static void w(String? key, String message) {
    _invokeNative('w', key, message);
  }

  static void i(String? key, String message) {
    _invokeNative('i', key, message);
  }

  static void e(String? key, String message) {
    _invokeNative('e', key, message);
  }

  static void v(String? key, String message) {
    _invokeNative('v', key, message);
  }

  static void _invokeNative(String method, String? key, String message) {
    try {
      logChannel.invokeMethod(method, {'key': key??'FlutterNeteaseLog', 'message': message});
    } on MissingPluginException {
      print('bridge Log miss plugin');
    } on PlatformException catch (e) {
      print('invoke method Log.$method error,error message:${e.message}');
    }
  }
}
