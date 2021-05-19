import 'package:flutter_netease/model/discovery/block/block_ext_info_bean.dart';
import 'package:flutter_netease/model/discovery/block/creatives/creatives_bean.dart';
import 'package:flutter_netease/model/discovery/block/discovery_ui_element_bean.dart';
import 'package:json_annotation/json_annotation.dart';

class BlockBean {
  String? showType;
  String? logInfo;
  bool? canClose;
  @JsonKey(name: "extInfo")
  BlockExtInfoBean? extInfo;
  @JsonKey(name: "extInfo")
  List<BlockExtInfoBean>? extInfos;
  DiscoveryUiElementBean? uiElement;
  List<CreativesBean>? creatives;

  BlockBean({this.showType, this.logInfo, this.canClose, this.extInfo, this.extInfos, this.uiElement, this.creatives});

  BlockBean.fromJson(dynamic json) {
    showType = json["showType"];
    logInfo = json["logInfo"];
    canClose = json["canClose"];
    uiElement = json["uiElement"] == null ? null : DiscoveryUiElementBean.fromJson(json["uiElement"]);
    if (json["creatives"] != null) {
      creatives = [];
      json["creatives"].forEach((v) => creatives?.add(CreativesBean.fromJson(v)));
    }
    if (showType == "BANNER" || showType == "HOMEPAGE_SLIDE_FUN_CLUB") {
      extInfo = json["extInfo"] == null ? null : BlockExtInfoBean.fromJson(json["extInfo"]);
    } else {
      if (json["extInfos"] != null) {
        extInfos = [];
        json["extInfos"].forEach((v) => extInfos?.add(BlockExtInfoBean.fromJson(v)));
      }
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["showType"] = showType;
    map["logInfo"] = logInfo;
    map["canClose"] = canClose;
    if (uiElement != null) {
      map["uiElement"] = uiElement?.toJson();
    }
    if (creatives != null) {
      map["creatives"] = creatives?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
