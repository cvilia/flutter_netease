import 'package:flutter/services.dart';

const MethodChannel logChannel = MethodChannel('com.cvilia.flutter.log/log');

class Log {
  static void d(String msg, String key) {
    logChannel.invokeMethod('d', {'key': key, 'message': msg});
  }

  static void w(String msg, String key) {
    logChannel.invokeMethod('w', {'key': key, 'message': msg});
  }

  static void i(String msg, String key) {
    logChannel.invokeMethod('i', {'key': key, 'message': msg});
  }

  static void e(String msg, String key) {
    logChannel.invokeMethod('e', {'key': key, 'message': msg});
  }

  static void v(String msg, String key) {
    logChannel.invokeMethod('v', {'key': key, 'message': msg});
  }
}
