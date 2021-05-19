/// agoraRoomNo : 413884
/// alg : ""
/// anchorId : 35013306
/// bgUrl : "http://p2.music.126.net/274PT78C_g3wn5_70wbg3A==/109951163400344312.jpg"
/// extInfo : ""
/// label : "欢唱KTV"
/// liveId : 2373841
/// liveRoomNo : 413884
/// onlineNumber : 9
/// onlineUserList : [{"avatarUrl":"http://p2.music.126.net/274PT78C_g3wn5_70wbg3A==/109951163400344312.jpg","gender":1,"nickname":"咲色桜棲","userId":35013306}]
/// sceneStatus : 2
/// songName : "只凝视着你（あなただけ見つめてる【灌篮高手ed】）（Cover 大黑摩季）"
/// status : 1
/// title : "日文歌～"
/// userProfile : {"avatarUrl":"http://p2.music.126.net/274PT78C_g3wn5_70wbg3A==/109951163400344312.jpg","gender":1,"nickname":"咲色桜棲","userId":35013306}

class BlockRoomInfoBean {
  int? agoraRoomNo;
  int? anchorId;
  String? bgUrl;
  String? extInfo;
  String? label;
  int? liveId;
  int? liveRoomNo;
  int? onlineNumber;
  List<OnlineUserList>? onlineUserList;
  int? sceneStatus;
  String? songName;
  int? status;
  String? title;
  UserProfile? userProfile;

  BlockRoomInfoBean({
      this.agoraRoomNo,
      this.anchorId,
      this.bgUrl,
      this.extInfo,
      this.label,
      this.liveId,
      this.liveRoomNo,
      this.onlineNumber,
      this.onlineUserList,
      this.sceneStatus,
      this.songName,
      this.status,
      this.title,
      this.userProfile});

  BlockRoomInfoBean.fromJson(dynamic json) {
    agoraRoomNo = json["agoraRoomNo"];
    anchorId = json["anchorId"];
    bgUrl = json["bgUrl"];
    extInfo = json["extInfo"];
    label = json["label"];
    liveId = json["liveId"];
    liveRoomNo = json["liveRoomNo"];
    onlineNumber = json["onlineNumber"];
    if (json["onlineUserList"] != null) {
      onlineUserList = [];
      json["onlineUserList"].forEach((v) {
        onlineUserList?.add(OnlineUserList.fromJson(v));
      });
    }
    sceneStatus = json["sceneStatus"];
    songName = json["songName"];
    status = json["status"];
    title = json["title"];
    userProfile = json["userProfile"] != null ? UserProfile.fromJson(json["userProfile"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["agoraRoomNo"] = agoraRoomNo;
    map["anchorId"] = anchorId;
    map["bgUrl"] = bgUrl;
    map["extInfo"] = extInfo;
    map["label"] = label;
    map["liveId"] = liveId;
    map["liveRoomNo"] = liveRoomNo;
    map["onlineNumber"] = onlineNumber;
    if (onlineUserList != null) {
      map["onlineUserList"] = onlineUserList?.map((v) => v.toJson()).toList();
    }
    map["sceneStatus"] = sceneStatus;
    map["songName"] = songName;
    map["status"] = status;
    map["title"] = title;
    if (userProfile != null) {
      map["userProfile"] = userProfile?.toJson();
    }
    return map;
  }

}

/// avatarUrl : "http://p2.music.126.net/274PT78C_g3wn5_70wbg3A==/109951163400344312.jpg"
/// gender : 1
/// nickname : "咲色桜棲"
/// userId : 35013306

class UserProfile {
  String? avatarUrl;
  int? gender;
  String? nickname;
  int? userId;

  UserProfile({
      this.avatarUrl,
      this.gender,
      this.nickname,
      this.userId});

  UserProfile.fromJson(dynamic json) {
    avatarUrl = json["avatarUrl"];
    gender = json["gender"];
    nickname = json["nickname"];
    userId = json["userId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["avatarUrl"] = avatarUrl;
    map["gender"] = gender;
    map["nickname"] = nickname;
    map["userId"] = userId;
    return map;
  }

}

/// avatarUrl : "http://p2.music.126.net/274PT78C_g3wn5_70wbg3A==/109951163400344312.jpg"
/// gender : 1
/// nickname : "咲色桜棲"
/// userId : 35013306

class OnlineUserList {
  String? avatarUrl;
  int? gender;
  String? nickname;
  int? userId;

  OnlineUserList({
      this.avatarUrl,
      this.gender,
      this.nickname,
      this.userId});

  OnlineUserList.fromJson(dynamic json) {
    avatarUrl = json["avatarUrl"];
    gender = json["gender"];
    nickname = json["nickname"];
    userId = json["userId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["avatarUrl"] = avatarUrl;
    map["gender"] = gender;
    map["nickname"] = nickname;
    map["userId"] = userId;
    return map;
  }

}