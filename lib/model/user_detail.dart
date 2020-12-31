import 'package:flutter_netease/http/api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_detail.g.dart';

///我的模块，顶部获取的用户信息，接口为[Api.DISCOVER_USER_DETAIL]
@JsonSerializable()
class UserDetail extends Object {
  int level;

  int listenSongs;

  UserPoint userPoint;

  bool mobileSign;

  bool pcSign;

  Profile profile;

  bool peopleCanSeeMyPlayRecord;

  List<Bindings> bindings;

  bool adValid;

  int code;

  int createTime;

  int createDays;

  UserDetail(
    this.level,
    this.listenSongs,
    this.userPoint,
    this.mobileSign,
    this.pcSign,
    this.profile,
    this.peopleCanSeeMyPlayRecord,
    this.bindings,
    this.adValid,
    this.code,
    this.createTime,
    this.createDays,
  );

  factory UserDetail.fromJson(Map<String, dynamic> srcJson) =>
      _$UserDetailFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserDetailToJson(this);
}

@JsonSerializable()
class UserPoint extends Object {
  int userId;

  int balance;

  int updateTime;

  int version;

  int status;

  int blockBalance;

  UserPoint(
    this.userId,
    this.balance,
    this.updateTime,
    this.version,
    this.status,
    this.blockBalance,
  );

  factory UserPoint.fromJson(Map<String, dynamic> srcJson) =>
      _$UserPointFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserPointToJson(this);
}

@JsonSerializable()
class Profile extends Object {
  int vipType;

  int userType;

  int createTime;

  String nickname;

  String avatarUrl;

  bool mutual;

  bool followed;

  int authStatus;

  String detailDescription;

  Experts experts;

  int djStatus;

  int accountStatus;

  int birthday;

  int gender;

  int province;

  int city;

  bool defaultAvatar;

  int avatarImgId;

  int backgroundImgId;

  String backgroundUrl;

  String avatarImgIdStr;

  String backgroundImgIdStr;

  String description;

  int userId;

  String signature;

  int authority;

  int followeds;

  int follows;

  bool blacklist;

  int eventCount;

  int allSubscribedCount;

  int playlistBeSubscribedCount;

  String avatarImgId_str;

  bool followMe;

  List<dynamic> artistIdentity;

  int cCount;

  int sDJPCount;

  int playlistCount;

  int sCount;

  int newFollows;

  Profile(
    this.vipType,
    this.userType,
    this.createTime,
    this.nickname,
    this.avatarUrl,
    this.mutual,
    this.followed,
    this.authStatus,
    this.detailDescription,
    this.experts,
    this.djStatus,
    this.accountStatus,
    this.birthday,
    this.gender,
    this.province,
    this.city,
    this.defaultAvatar,
    this.avatarImgId,
    this.backgroundImgId,
    this.backgroundUrl,
    this.avatarImgIdStr,
    this.backgroundImgIdStr,
    this.description,
    this.userId,
    this.signature,
    this.authority,
    this.followeds,
    this.follows,
    this.blacklist,
    this.eventCount,
    this.allSubscribedCount,
    this.playlistBeSubscribedCount,
    this.avatarImgId_str,
    this.followMe,
    this.artistIdentity,
    this.cCount,
    this.sDJPCount,
    this.playlistCount,
    this.sCount,
    this.newFollows,
  );

  factory Profile.fromJson(Map<String, dynamic> srcJson) =>
      _$ProfileFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

@JsonSerializable()
class Experts extends Object {
  Experts();

  factory Experts.fromJson(Map<String, dynamic> srcJson) =>
      _$ExpertsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ExpertsToJson(this);
}

@JsonSerializable()
class Bindings extends Object {
  int expiresIn;

  int refreshTime;

  int bindingTime;

  bool expired;

  String url;

  int userId;

  int id;

  int type;

  Bindings(
    this.expiresIn,
    this.refreshTime,
    this.bindingTime,
    this.expired,
    this.url,
    this.userId,
    this.id,
    this.type,
  );

  factory Bindings.fromJson(Map<String, dynamic> srcJson) =>
      _$BindingsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BindingsToJson(this);
}
