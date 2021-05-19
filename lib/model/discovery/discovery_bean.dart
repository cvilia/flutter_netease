import 'package:flutter_netease/model/discovery/block/data_bean.dart';

class DiscoveryBean {
  int? code;
  DataBean? data;
  String? message;

  DiscoveryBean({this.code, this.data, this.message});

  DiscoveryBean.fromJson(dynamic json) {
    code = json["code"];
    data = json["data"] == null ? null : DataBean.fromJson(json["data"]);
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = code;
    map["message"] = message;
    if (data != null) {
      map["data"] = data?.toJson();
    }
    return map;
  }
}
