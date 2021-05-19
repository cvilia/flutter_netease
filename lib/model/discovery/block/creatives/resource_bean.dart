import 'package:flutter_netease/model/discovery/block/discovery_ui_element_bean.dart';

import 'resource_ext_info_bean.dart';

/// action : "play_all_song_from_current_index"
/// actionType : "client_customized"
/// alg : "alg_hp_tr_art"
/// logInfo : ""
/// resourceId : "1370891745"
/// resourceType : "song"
/// uiElement : {"image":{"imageUrl":"http://p1.music.126.net/doluJ8-Ra5Re8ko3uFEbUA==/109951164137743769.jpg"},"mainTitle":{"title":"休闲少女"},"rcmdShowType":"DEFAULT","subTitle":{"title":"超85%人播放","titleType":"songRcmdTag"}}
/// valid : true

class ResourceBean {
  String? action;
  String? actionType;
  String? alg;
  String? logInfo;
  ResourceExtInfoBean? resourceExtInfo;
  String? resourceId;
  String? resourceType;
  String? resourceUrl;
  DiscoveryUiElementBean? uiElement;
  bool? valid;

  ResourceBean(
      {this.action,
      this.actionType,
      this.alg,
      this.logInfo,
      this.resourceId,
      this.resourceType,
      this.uiElement,
      this.valid});

  ResourceBean.fromJson(dynamic json) {
    action =
        json["action"] is String ? json["action"] : json["action"].toString();
    actionType = json["actionType"];
    alg = json["alg"];
    logInfo = json["logInfo"];
    uiElement = json["resourceExtInfo"] != null
        ? DiscoveryUiElementBean.fromJson(json["resourceExtInfo"])
        : null;
    resourceId = json["resourceId"];
    resourceType = json["resourceType"];
    resourceUrl = json["resourceUrl"];
    uiElement = json["uiElement"] != null
        ? DiscoveryUiElementBean.fromJson(json["uiElement"])
        : null;
    valid = json["valid"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["action"] = action;
    map["actionType"] = actionType;
    map["alg"] = alg;
    map["logInfo"] = logInfo;
    if (resourceExtInfo != null) {
      map["resourceExtInfo"] = resourceExtInfo?.toJson();
    }
    map["resourceId"] = resourceId;
    map["resourceType"] = resourceType;
    map["resourceUrl"] = resourceUrl;
    if (uiElement != null) {
      map["uiElement"] = uiElement?.toJson();
    }
    map["valid"] = valid;
    return map;
  }
}
