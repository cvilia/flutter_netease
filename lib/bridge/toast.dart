import 'package:flutter/services.dart';

const MethodChannel toastChannel = MethodChannel('com.cvilia.bubblemusic.ui/toast');

class Toast {
  static void showShort(String message) {
    _invokeNative('short', message);
  }

  static void showLong(String message) {
    _invokeNative('long', message);
  }

  static void _invokeNative(String method, String message) {
    try {
      toastChannel.invokeMethod(method, message);
    } on MissingPluginException {
      print('bridge Toast miss plugin');
    } on PlatformException catch (e) {
      print('invoke method Toast.$message error,error message:${e.message}');
    }
  }
}
