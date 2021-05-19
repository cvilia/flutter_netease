import 'package:flutter_netease/model/discovery/block/block_bean.dart';
import 'package:flutter_netease/model/discovery/discovery_page_config_bean.dart';

/// hasMore : true
/// cursor : ""

class DataBean {
  bool? hasMore;
  String? cursor;
  List<BlockBean>? blocks;
  DiscoveryPageConfigBean? pageConfig;

  DataBean({this.hasMore, this.cursor, this.blocks, this.pageConfig});

  DataBean.fromJson(dynamic json) {
    hasMore = json["hasMore"];
    cursor = json["cursor"];
    if (json["blocks"] != null) {
      blocks = [];
      (json["blocks"] as List)
          .forEach((element) => blocks?.add(BlockBean.fromJson(element)));
    }
    pageConfig = json["pageConfig"] == null
        ? null
        : DiscoveryPageConfigBean.fromJson(json["pageConfig"]);
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["hasMore"] = hasMore;
    map["cursor"] = cursor;
    if (blocks != null) {
      map["blocks"] = blocks?.map((e) => e.toJson()).toList();
    }
    if (pageConfig != null) {
      map["pageConfig"] = pageConfig?.toJson();
    }
    return map;
  }
}
