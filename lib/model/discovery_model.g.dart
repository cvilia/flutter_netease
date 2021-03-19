// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscoveryModel _$DiscoveryModelFromJson(Map<String, dynamic> json) {
  return DiscoveryModel(
    json['code'] as int,
    json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    json['message'] as String,
  );
}

Map<String, dynamic> _$DiscoveryModelToJson(DiscoveryModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    (json['blocks'] as List)
        ?.map((e) =>
            e == null ? null : Blocks.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['cursor'] as String,
    json['hasMore'] as bool,
    json['pageConfig'] == null
        ? null
        : PageConfig.fromJson(json['pageConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'blocks': instance.blocks,
      'cursor': instance.cursor,
      'hasMore': instance.hasMore,
      'pageConfig': instance.pageConfig,
    };

Blocks _$BlocksFromJson(Map<String, dynamic> json) {
  return Blocks(
    json['blockCode'] as String,
    json['canClose'] as bool,
    json['extInfo'] == null
        ? null
        : ExtInfo.fromJson(json['extInfo'] as Map<String, dynamic>),
    json['showType'] as String,
  );
}

Map<String, dynamic> _$BlocksToJson(Blocks instance) => <String, dynamic>{
      'blockCode': instance.blockCode,
      'canClose': instance.canClose,
      'extInfo': instance.extInfo,
      'showType': instance.showType,
    };

ExtInfo _$ExtInfoFromJson(Map<String, dynamic> json) {
  return ExtInfo(
    (json['banners'] as List)
        ?.map((e) =>
            e == null ? null : Banners.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ExtInfoToJson(ExtInfo instance) => <String, dynamic>{
      'banners': instance.banners,
    };

Banners _$BannersFromJson(Map<String, dynamic> json) {
  return Banners(
    json['bannerId'] as String,
    json['dynamicVideoData'] == null
        ? null
        : DynamicVideoData.fromJson(
            json['dynamicVideoData'] as Map<String, dynamic>),
    json['encodeId'] as String,
    json['exclusive'] as bool,
    json['pic'] as String,
    json['requestId'] as String,
    json['showAdTag'] as bool,
    json['targetId'] as int,
    json['targetType'] as int,
    json['typeTitle'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$BannersToJson(Banners instance) => <String, dynamic>{
      'bannerId': instance.bannerId,
      'dynamicVideoData': instance.dynamicVideoData,
      'encodeId': instance.encodeId,
      'exclusive': instance.exclusive,
      'pic': instance.pic,
      'requestId': instance.requestId,
      'showAdTag': instance.showAdTag,
      'targetId': instance.targetId,
      'targetType': instance.targetType,
      'typeTitle': instance.typeTitle,
      'url': instance.url,
    };

DynamicVideoData _$DynamicVideoDataFromJson(Map<String, dynamic> json) {
  return DynamicVideoData(
    json['maxVideoPlayCount'] as int,
    json['resourceId'] as String,
    json['urlExpireTimeInMills'] as int,
    json['videoUrl'] as String,
  );
}

Map<String, dynamic> _$DynamicVideoDataToJson(DynamicVideoData instance) =>
    <String, dynamic>{
      'maxVideoPlayCount': instance.maxVideoPlayCount,
      'resourceId': instance.resourceId,
      'urlExpireTimeInMills': instance.urlExpireTimeInMills,
      'videoUrl': instance.videoUrl,
    };

PageConfig _$PageConfigFromJson(Map<String, dynamic> json) {
  return PageConfig(
    json['fullscreen'] as bool,
    json['homepageMode'] as String,
    json['nodataToast'] as String,
    json['refreshInterval'] as int,
    json['refreshToast'] as String,
    json['showModeEntry'] as bool,
    json['songLabelMarkLimit'] as int,
    (json['songLabelMarkPriority'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PageConfigToJson(PageConfig instance) =>
    <String, dynamic>{
      'fullscreen': instance.fullscreen,
      'homepageMode': instance.homepageMode,
      'nodataToast': instance.nodataToast,
      'refreshInterval': instance.refreshInterval,
      'refreshToast': instance.refreshToast,
      'showModeEntry': instance.showModeEntry,
      'songLabelMarkLimit': instance.songLabelMarkLimit,
      'songLabelMarkPriority': instance.songLabelMarkPriority,
    };
