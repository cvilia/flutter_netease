import 'package:flutter/services.dart';
import 'package:flutter_netease/channel/channel_id.dart';

class FlutterBridge {
  FlutterBridge._internal();

  static final FlutterBridge _instance = FlutterBridge._internal();

  factory FlutterBridge() => _instance;

  Future invokeMethod(String method, [dynamic params]) => channel
      .invokeMethod(method, params)
      .catchError((e) => print('调用原生方法---------$method---------出错'));
}

FlutterBridge flutterBridge = FlutterBridge();
