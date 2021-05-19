import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_netease/http/api.dart';

class DioHelper {
  Dio? _dio;

  DioHelper._internal() {
    BaseOptions options = BaseOptions(
      connectTimeout: 10 * 1000,
      receiveTimeout: 20 * 1000,
      sendTimeout: 20 * 1000,
      baseUrl: Api.SERVER,
      responseType: ResponseType.plain,
    );
    _dio = Dio(options);
    (_dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };
  }

  Future<void> get(String url, {Map? params, DioCallBack? callBack}) async {
    try {
      callBack!(await _dio!.get(url,
          queryParameters:
              params == null ? null : Map<String, dynamic>.from(params)));
    } on DioError catch (e) {
      print(
          '\nget请求错误url:$url,\nmessage:${e.message}\nbody:${e.response.toString()}');
      callBack!(e.response!);
    }
  }

  static final DioHelper _instance = DioHelper._internal();

  factory DioHelper() {
    return _instance;
  }
}

typedef DioCallBack(Response response);

DioHelper dioHelper = DioHelper();
