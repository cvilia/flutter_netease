import 'package:flutter_netease/config/constant.dart';

class Log {
  static void d(String msg, {String key = 'BubbleLog'}) {
    logChannel.invokeMethod('log', {'method': 'd', 'key': key, 'message': msg});
  }

  static void w(String msg, {String key = 'BubbleLog'}) {
    logChannel.invokeMethod('log', {'method': 'w', 'key': key, 'message': msg});
  }

  static void i(String msg, {String key = 'BubbleLog'}) {
    logChannel.invokeMethod('log', {'method': 'i', 'key': key, 'message': msg});
  }

  static void e(String msg, {String key = 'BubbleLog'}) {
    logChannel.invokeMethod('log', {'method': 'e', 'key': key, 'message': msg});
  }

  static void v(String msg, {String key = 'BubbleLog'}) {
    logChannel.invokeMethod('log', {'method': 'v', 'key': key, 'message': msg});
  }
}
