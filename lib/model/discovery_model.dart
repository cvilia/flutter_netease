import 'package:json_annotation/json_annotation.dart'; 
  
part 'discovery_model.g.dart';


@JsonSerializable()
  class DiscoveryModel extends Object {

  int code;

  Data data;

  String message;

  DiscoveryModel(this.code,this.data,this.message,);

  factory DiscoveryModel.fromJson(Map<String, dynamic> srcJson) => _$DiscoveryModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DiscoveryModelToJson(this);

}

  
@JsonSerializable()
  class Data extends Object {

  List<Blocks> blocks;

  String cursor;

  bool hasMore;

  PageConfig pageConfig;

  Data(this.blocks,this.cursor,this.hasMore,this.pageConfig,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
@JsonSerializable()
  class Blocks extends Object {

  String blockCode;

  bool canClose;

  ExtInfo extInfo;

  String showType;

  Blocks(this.blockCode,this.canClose,this.extInfo,this.showType,);

  factory Blocks.fromJson(Map<String, dynamic> srcJson) => _$BlocksFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BlocksToJson(this);

}

  
@JsonSerializable()
  class ExtInfo extends Object {

  List<Banners> banners;

  ExtInfo(this.banners,);

  factory ExtInfo.fromJson(Map<String, dynamic> srcJson) => _$ExtInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ExtInfoToJson(this);

}

  
@JsonSerializable()
  class Banners extends Object {

  String bannerId;

  DynamicVideoData dynamicVideoData;

  String encodeId;

  bool exclusive;

  String pic;

  String requestId;

  bool showAdTag;

  int targetId;

  int targetType;

  String typeTitle;

  String url;

  Banners(this.bannerId,this.dynamicVideoData,this.encodeId,this.exclusive,this.pic,this.requestId,this.showAdTag,this.targetId,this.targetType,this.typeTitle,this.url,);

  factory Banners.fromJson(Map<String, dynamic> srcJson) => _$BannersFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannersToJson(this);

}

  
@JsonSerializable()
  class DynamicVideoData extends Object {

  int maxVideoPlayCount;

  String resourceId;

  int urlExpireTimeInMills;

  String videoUrl;

  DynamicVideoData(this.maxVideoPlayCount,this.resourceId,this.urlExpireTimeInMills,this.videoUrl,);

  factory DynamicVideoData.fromJson(Map<String, dynamic> srcJson) => _$DynamicVideoDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DynamicVideoDataToJson(this);

}

  
@JsonSerializable()
  class PageConfig extends Object {

  bool fullscreen;

  String homepageMode;

  String nodataToast;

  int refreshInterval;

  String refreshToast;

  bool showModeEntry;

  int songLabelMarkLimit;

  List<String> songLabelMarkPriority;

  PageConfig(this.fullscreen,this.homepageMode,this.nodataToast,this.refreshInterval,this.refreshToast,this.showModeEntry,this.songLabelMarkLimit,this.songLabelMarkPriority,);

  factory PageConfig.fromJson(Map<String, dynamic> srcJson) => _$PageConfigFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PageConfigToJson(this);

}

  
