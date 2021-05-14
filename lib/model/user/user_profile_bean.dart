import 'package:json_annotation/json_annotation.dart';

/// description : ""
/// vipType : 0
/// gender : 1
/// accountStatus : 0
/// avatarImgId : 109951165380951600
/// avatarImgIdStr : "109951165380951600"
/// backgroundImgIdStr : "109951165418386456"
/// nickname : "麻辣炖土豆儿"
/// defaultAvatar : false
/// backgroundImgId : 109951165418386460
/// province : 110000
/// birthday : 749404800000
/// avatarUrl : "https://p3.music.126.net/Uod614kFPptcj661BPLsOg==/109951165380951600.jpg"
/// city : 110101
/// djStatus : 0
/// expertTags : null
/// authStatus : 0
/// userType : 0
/// followed : false
/// backgroundUrl : "https://p3.music.126.net/OL02rfkLbzAvQ-W4OHJvOA==/109951165418386456.jpg"
/// detailDescription : ""
/// userId : 122121024
/// mutual : false
/// remarkName : null
/// signature : "爱音乐爱自己"
/// authority : 0
/// avatarImgId_str : "109951165380951600"
/// followeds : 4
/// follows : 3
/// eventCount : 2
/// avatarDetail : null
/// playlistCount : 4
/// playlistBeSubscribedCount : 0

///用户登录接口返回数据中的[profile]字段
class UserProfileBean {
  String? description;
  int? vipType;
  int? gender;
  int? accountStatus;
  int? avatarImgId;
  String? avatarImgIdStr;
  String? backgroundImgIdStr;
  String? nickname;
  bool? defaultAvatar;
  int? backgroundImgId;
  int? province;
  int? birthday;
  String? avatarUrl;
  int? city;
  int? djStatus;
  ///该字段返回的结果是{}，初步判断用不上，不再处理
  // dynamic? experts;
  dynamic? expertTags;
  int? authStatus;
  int? userType;
  bool? followed;
  String? backgroundUrl;
  String? detailDescription;
  int? userId;
  bool? mutual;
  dynamic? remarkName;
  String? signature;
  int? authority;

  ///该字段重复，不再需要
  // @JsonKey(name: 'avatarImgId_str')
  // String? avatarImgIdStr;
  int? followeds;
  int? follows;
  int? eventCount;
  dynamic? avatarDetail;
  int? playlistCount;
  int? playlistBeSubscribedCount;

  UserProfileBean(
      {this.description,
      this.vipType,
      this.gender,
      this.accountStatus,
      this.avatarImgId,
      this.avatarImgIdStr,
      this.backgroundImgIdStr,
      this.nickname,
      this.defaultAvatar,
      this.backgroundImgId,
      this.province,
      this.birthday,
      this.avatarUrl,
      this.city,
      this.djStatus,
      this.expertTags,
      this.authStatus,
      this.userType,
      this.followed,
      this.backgroundUrl,
      this.detailDescription,
      this.userId,
      this.mutual,
      this.remarkName,
      this.signature,
      this.authority,
      // this.avatarImgIdStr,
      this.followeds,
      this.follows,
      this.eventCount,
      this.avatarDetail,
      this.playlistCount,
      this.playlistBeSubscribedCount});

  UserProfileBean.fromJson(dynamic json) {
    description = json["description"];
    vipType = json["vipType"];
    gender = json["gender"];
    accountStatus = json["accountStatus"];
    avatarImgId = json["avatarImgId"];
    avatarImgIdStr = json["avatarImgIdStr"];
    backgroundImgIdStr = json["backgroundImgIdStr"];
    nickname = json["nickname"];
    defaultAvatar = json["defaultAvatar"];
    backgroundImgId = json["backgroundImgId"];
    province = json["province"];
    birthday = json["birthday"];
    avatarUrl = json["avatarUrl"];
    city = json["city"];
    djStatus = json["djStatus"];
    expertTags = json["expertTags"];
    authStatus = json["authStatus"];
    userType = json["userType"];
    followed = json["followed"];
    backgroundUrl = json["backgroundUrl"];
    detailDescription = json["detailDescription"];
    userId = json["userId"];
    mutual = json["mutual"];
    remarkName = json["remarkName"];
    signature = json["signature"];
    authority = json["authority"];
    // avatarImgIdStr = json["avatarImgId_str"];
    followeds = json["followeds"];
    follows = json["follows"];
    eventCount = json["eventCount"];
    avatarDetail = json["avatarDetail"];
    playlistCount = json["playlistCount"];
    playlistBeSubscribedCount = json["playlistBeSubscribedCount"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["description"] = description;
    map["vipType"] = vipType;
    map["gender"] = gender;
    map["accountStatus"] = accountStatus;
    map["avatarImgId"] = avatarImgId;
    map["avatarImgIdStr"] = avatarImgIdStr;
    map["backgroundImgIdStr"] = backgroundImgIdStr;
    map["nickname"] = nickname;
    map["defaultAvatar"] = defaultAvatar;
    map["backgroundImgId"] = backgroundImgId;
    map["province"] = province;
    map["birthday"] = birthday;
    map["avatarUrl"] = avatarUrl;
    map["city"] = city;
    map["djStatus"] = djStatus;
    map["expertTags"] = expertTags;
    map["authStatus"] = authStatus;
    map["userType"] = userType;
    map["followed"] = followed;
    map["backgroundUrl"] = backgroundUrl;
    map["detailDescription"] = detailDescription;
    map["userId"] = userId;
    map["mutual"] = mutual;
    map["remarkName"] = remarkName;
    map["signature"] = signature;
    map["authority"] = authority;
    // map["avatarImgId_str"] = avatarImgIdStr;
    map["followeds"] = followeds;
    map["follows"] = follows;
    map["eventCount"] = eventCount;
    map["avatarDetail"] = avatarDetail;
    map["playlistCount"] = playlistCount;
    map["playlistBeSubscribedCount"] = playlistBeSubscribedCount;
    return map;
  }
}
