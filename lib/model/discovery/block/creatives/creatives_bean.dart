import 'package:flutter_netease/model/discovery/block/creatives/resource_bean.dart';
import 'package:flutter_netease/model/discovery/block/discovery_ui_element_bean.dart';

/// action : "orpheus://openurl?url=https%3A%2F%2Fmp.music.163.com%2F603cd8e05a4984f5fe152411%3Ffull_screen%3Dtrue%26rankingId%3D2002%26needminibar%3Dtrue&referLog=HOMEPAGE_BLOCK_TOPLIST"
/// actionType : "orpheus"
/// creativeExtInfoVO : {"topListOriginType":"H5","topListSongIds":[1836021414,1839243729,1838531847,1836033729,1833848187,1834727583,1833853447,1838499733,1836819872,1837286893]}
/// creativeId : "INDIE_MUSIC_CHART##"
/// creativeType : "toplist"
/// position : 0

class CreativesBean {
  String? code;
  CreativeExtInfoVO? creativeExtInfoVO;
  String? creativeId;
  ResourceBean? resources;
  DiscoveryUiElementBean? uiElement;
  String? source;
  String? traceId;

  CreativesBean(
      {this.creativeExtInfoVO, this.creativeId, this.resources, this.uiElement, this.source, this.traceId, this.code});

  CreativesBean.fromJson(dynamic json) {
    creativeExtInfoVO =
        json["creativeExtInfoVO"] != null ? CreativeExtInfoVO.fromJson(json["creativeExtInfoVO"]) : null;
    creativeId = json["creativeId"];
    resources = json["resources"] != null ? ResourceBean.fromJson(json["resources"]) : null;
    uiElement = json["uiElement"] != null ? DiscoveryUiElementBean.fromJson(json["uiElement"]) : null;
    source = json["source"];
    traceId = json["traceId"];
    code = json["code"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (creativeExtInfoVO != null) {
      map["creativeExtInfoVO"] = creativeExtInfoVO?.toJson();
    }
    map["creativeId"] = creativeId;
    if (resources != null) {
      map["resources"] = resources?.toJson();
    }
    if (uiElement != null) {
      map["uiElement"] = uiElement?.toJson();
    }
    map["source"] = source;
    map["traceId"] = traceId;
    map["code"] = code;
    return map;
  }
}

/// topListOriginType : "H5"
/// topListSongIds : [1836021414,1839243729,1838531847,1836033729,1833848187,1834727583,1833853447,1838499733,1836819872,1837286893]

class CreativeExtInfoVO {
  String? topListOriginType;
  List<String>? topListSongIds;

  CreativeExtInfoVO({this.topListOriginType, this.topListSongIds});

  CreativeExtInfoVO.fromJson(dynamic json) {
    topListOriginType = json["topListOriginType"];
    topListSongIds = json["topListSongIds"] != null ? json["topListSongIds"].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["topListOriginType"] = topListOriginType;
    map["topListSongIds"] = topListSongIds;
    return map;
  }
}
