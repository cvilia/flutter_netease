import 'package:flutter/services.dart';

const MethodChannel _channel = MethodChannel('com.cvilia.flutter.net/net.status');

class NetStatus {
  static Future<bool> isWifi() async {
    bool result = await _channel.invokeMethod("isWifi");
    return result ?? false;
  }

  static Future<bool> isMobile() async {
    bool result = await _channel.invokeMethod("isMobile");
    return result ?? false;
  }
}
