import 'dart:convert';

import 'package:crypto/crypto.dart';

///字符串工具类
class TextUtils {
  ///判断字符串是否为空
  static bool isEmpty(String? str) {
    if(str==null||str=='')return true;
    return false;
  }

  ///计算md5
  static String toMd5(String str) {
    var bytes = utf8.encode(str);
    return md5.convert(bytes).toString();
  }
}
