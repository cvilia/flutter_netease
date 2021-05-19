import 'package:flutter_netease/model/discovery/block/discovery_ui_element_bean.dart';

import 'resource_ext_info_bean.dart';

/// logInfo : ""
/// resourceId : "1370891745"
/// resourceType : "song"
/// uiElement : {"image":{"imageUrl":"http://p1.music.126.net/doluJ8-Ra5Re8ko3uFEbUA==/109951164137743769.jpg"},"mainTitle":{"title":"休闲少女"},"rcmdShowType":"DEFAULT","subTitle":{"title":"超85%人播放","titleType":"songRcmdTag"}}
/// valid : true

class ResourceBean {
  String? logInfo;
  ResourceExtInfoBean? resourceExtInfo;
  String? resourceId;
  String? resourceType;
  String? resourceUrl;
  DiscoveryUiElementBean? uiElement;
  bool? valid;

  ResourceBean(
      {
      this.logInfo,
      this.resourceId,
      this.resourceType,
      this.uiElement,
      this.valid});

  ResourceBean.fromJson(dynamic json) {
    // logInfo = json["logInfo"];
    // uiElement = json["resourceExtInfo"] != null
    //     ? DiscoveryUiElementBean.fromJson(json["resourceExtInfo"])
    //     : null;
    // resourceId = json["resourceId"];
    // resourceType = json["resourceType"];
    // resourceUrl = json["resourceUrl"];
    // uiElement = json["uiElement"] != null
    //     ? DiscoveryUiElementBean.fromJson(json["uiElement"])
    //     : null;
    // valid = json["valid"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
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
