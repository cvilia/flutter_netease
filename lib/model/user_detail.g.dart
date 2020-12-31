// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) {
  return UserDetail(
    json['level'] as int,
    json['listenSongs'] as int,
    json['userPoint'] == null
        ? null
        : UserPoint.fromJson(json['userPoint'] as Map<String, dynamic>),
    json['mobileSign'] as bool,
    json['pcSign'] as bool,
    json['profile'] == null
        ? null
        : Profile.fromJson(json['profile'] as Map<String, dynamic>),
    json['peopleCanSeeMyPlayRecord'] as bool,
    (json['bindings'] as List)
        ?.map((e) =>
            e == null ? null : Bindings.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['adValid'] as bool,
    json['code'] as int,
    json['createTime'] as int,
    json['createDays'] as int,
  );
}

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) =>
    <String, dynamic>{
      'level': instance.level,
      'listenSongs': instance.listenSongs,
      'userPoint': instance.userPoint,
      'mobileSign': instance.mobileSign,
      'pcSign': instance.pcSign,
      'profile': instance.profile,
      'peopleCanSeeMyPlayRecord': instance.peopleCanSeeMyPlayRecord,
      'bindings': instance.bindings,
      'adValid': instance.adValid,
      'code': instance.code,
      'createTime': instance.createTime,
      'createDays': instance.createDays,
    };

UserPoint _$UserPointFromJson(Map<String, dynamic> json) {
  return UserPoint(
    json['userId'] as int,
    json['balance'] as int,
    json['updateTime'] as int,
    json['version'] as int,
    json['status'] as int,
    json['blockBalance'] as int,
  );
}

Map<String, dynamic> _$UserPointToJson(UserPoint instance) => <String, dynamic>{
      'userId': instance.userId,
      'balance': instance.balance,
      'updateTime': instance.updateTime,
      'version': instance.version,
      'status': instance.status,
      'blockBalance': instance.blockBalance,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    json['vipType'] as int,
    json['userType'] as int,
    json['createTime'] as int,
    json['nickname'] as String,
    json['avatarUrl'] as String,
    json['mutual'] as bool,
    json['followed'] as bool,
    json['authStatus'] as int,
    json['detailDescription'] as String,
    json['experts'] == null
        ? null
        : Experts.fromJson(json['experts'] as Map<String, dynamic>),
    json['djStatus'] as int,
    json['accountStatus'] as int,
    json['birthday'] as int,
    json['gender'] as int,
    json['province'] as int,
    json['city'] as int,
    json['defaultAvatar'] as bool,
    json['avatarImgId'] as int,
    json['backgroundImgId'] as int,
    json['backgroundUrl'] as String,
    json['avatarImgIdStr'] as String,
    json['backgroundImgIdStr'] as String,
    json['description'] as String,
    json['userId'] as int,
    json['signature'] as String,
    json['authority'] as int,
    json['followeds'] as int,
    json['follows'] as int,
    json['blacklist'] as bool,
    json['eventCount'] as int,
    json['allSubscribedCount'] as int,
    json['playlistBeSubscribedCount'] as int,
    json['avatarImgId_str'] as String,
    json['followMe'] as bool,
    json['artistIdentity'] as List,
    json['cCount'] as int,
    json['sDJPCount'] as int,
    json['playlistCount'] as int,
    json['sCount'] as int,
    json['newFollows'] as int,
  );
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'vipType': instance.vipType,
      'userType': instance.userType,
      'createTime': instance.createTime,
      'nickname': instance.nickname,
      'avatarUrl': instance.avatarUrl,
      'mutual': instance.mutual,
      'followed': instance.followed,
      'authStatus': instance.authStatus,
      'detailDescription': instance.detailDescription,
      'experts': instance.experts,
      'djStatus': instance.djStatus,
      'accountStatus': instance.accountStatus,
      'birthday': instance.birthday,
      'gender': instance.gender,
      'province': instance.province,
      'city': instance.city,
      'defaultAvatar': instance.defaultAvatar,
      'avatarImgId': instance.avatarImgId,
      'backgroundImgId': instance.backgroundImgId,
      'backgroundUrl': instance.backgroundUrl,
      'avatarImgIdStr': instance.avatarImgIdStr,
      'backgroundImgIdStr': instance.backgroundImgIdStr,
      'description': instance.description,
      'userId': instance.userId,
      'signature': instance.signature,
      'authority': instance.authority,
      'followeds': instance.followeds,
      'follows': instance.follows,
      'blacklist': instance.blacklist,
      'eventCount': instance.eventCount,
      'allSubscribedCount': instance.allSubscribedCount,
      'playlistBeSubscribedCount': instance.playlistBeSubscribedCount,
      'avatarImgId_str': instance.avatarImgId_str,
      'followMe': instance.followMe,
      'artistIdentity': instance.artistIdentity,
      'cCount': instance.cCount,
      'sDJPCount': instance.sDJPCount,
      'playlistCount': instance.playlistCount,
      'sCount': instance.sCount,
      'newFollows': instance.newFollows,
    };

Experts _$ExpertsFromJson(Map<String, dynamic> json) {
  return Experts();
}

Map<String, dynamic> _$ExpertsToJson(Experts instance) => <String, dynamic>{};

Bindings _$BindingsFromJson(Map<String, dynamic> json) {
  return Bindings(
    json['expiresIn'] as int,
    json['refreshTime'] as int,
    json['bindingTime'] as int,
    json['expired'] as bool,
    json['url'] as String,
    json['userId'] as int,
    json['id'] as int,
    json['type'] as int,
  );
}

Map<String, dynamic> _$BindingsToJson(Bindings instance) => <String, dynamic>{
      'expiresIn': instance.expiresIn,
      'refreshTime': instance.refreshTime,
      'bindingTime': instance.bindingTime,
      'expired': instance.expired,
      'url': instance.url,
      'userId': instance.userId,
      'id': instance.id,
      'type': instance.type,
    };
