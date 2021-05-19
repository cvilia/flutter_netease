import 'package:flutter_netease/model/discovery/block/banner/discovery_banner_bean.dart';
import 'package:flutter_netease/model/discovery/block/extinfo/block_room_info_bean.dart';

/// buttonTitle : "更多房间"
/// buttonUrl : "orpheus://nk/ktvroom/feed?from=20&refer=livetab.recommendpage_modulemore"
/// agoraRoomNo : 0
/// anchorId : 128204992
/// appKeyType : 1
/// bgCoverUrl : "http://p1.music.126.net/swlgE0_oCj49dceAJLE-aA==/109951165990785313.jpg"
/// cover : "http://p2.music.126.net/ieX0LX8RjNaeqLxe9r7kYw==/109951164693681887.jpg"
/// coverId : 109951164693681890
/// endTime : 0
/// liveId : 52915390
/// liveStatus : 1
/// liveType : 2
/// liveUrl : {"hlsPullUrl":"http://pullhls3948069e.live.126.net/live/2586a846cad24040b65b79768d355d52/playlist.m3u8","httpPullUrl":"http://flv3948069e.live.126.net/live/2586a846cad24040b65b79768d355d52.flv?netease=flv3948069e.live.126.net","rtmpPullUrl":"rtmp://v3948069e.live.126.net/live/2586a846cad24040b65b79768d355d52"}
/// onlineNumber : 0
/// orientationScope : 0
/// popularity : 6903
/// privateTag : "聊愈"
/// recLiveDTO : {"accompanimentId":0,"alg":"alg_live_operator_manual_pinned","cardType":0,"recCoverId":0,"songId":0,"typeDesc":"voicelive"}
/// roomId : 118537445
/// startStreamTag : 0
/// startStreamTagName : "聊愈"
/// startTime : 1621435025082
/// title : "失 眠 疗 愈 室🪐"
/// alg : "vs-hp-t7#i2i-hpv4##"
/// id : "a1wJKAv17bgUKDA"
/// logInfo : "detail_group:t5"
/// matchField : 0
/// mlogBaseDataType : 2
/// resource : {"mlogBaseData":{"coverColor":-7109760,"coverHeight":1280,"coverPicKey":"3575895097","coverUrl":"http://p5.music.126.net/obj/w5nDkMOCwrDCmDDDi8Om/3575895097/280b/1fa2/3bcc/88b69eba508165e69fa9e2efae1632a4.jpg","coverWidth":720,"duration":11951,"id":"a1wJKAv17bgUKDA","pubTime":1597068655885,"text":"最讨厌Lisa了，每次看到她就被迷的不行","threadId":"R_MLOG_1001_a1wJKAv17bgUKDA","type":2},"mlogExtVO":{"canCollect":true,"commentCount":83,"likedCount":3203,"playCount":490617,"song":{"albumName":"外文精选","artists":[{"artistId":32435598,"artistName":"QnYs安吻"}],"coverUrl":"http://p1.music.126.net/vORoVC4PVE_sdVD-ZBoYzQ==/109951165545771512.jpg","duration":300990,"id":1804899253,"name":"Swagger (抖音版)"},"videoStartPlayTime":0},"shareUrl":"https://st.music.163.com/mlog/mlog.html?id=a1wJKAv17bgUKDA&type=2&userid=1596907922&songId=null&startTime=null","status":1,"userProfile":{"avatarDetail":{"identityIconUrl":"https://p5.music.126.net/obj/wo3DlcOGw6DClTvDisK1/4761340168/ccce/35dd/ab2d/1a7c8ee0f6bb1fc2760cbb570dfee34f.png","identityLevel":3,"userType":204},"avatarUrl":"http://p2.music.126.net/Lua35WZqOfiGi21i8XSR7g==/109951165767849557.jpg","followed":false,"isAnchor":false,"nickname":"一只小卜","userId":1596907922,"userType":0}}
/// sameCity : false
/// type : 1
/// userInfo : {"authStatus":1,"avatarUrl":"http://p2.music.126.net/y7le3D9oTFVzR2i7jYC6ng==/109951165828332763.jpg","gender":2,"liveRoomNo":115530425,"nickname":"凌洛丶深夜电台","userId":128204992,"userType":4,"vipType":11}
/// verticalCover : "http://p1.music.126.net/U3bky5a3Ljr7VHhgVeMjdQ==/109951165612275625.jpg"
/// verticalCoverId : 109951165612275630
/// subtitle : "抢先一起唱歌聊天"

class BlockExtInfoBean {
  String? buttonTitle;
  String? buttonUrl;
  int? agoraRoomNo;
  int? anchorId;
  int? appKeyType;
  String? bgCoverUrl;
  String? cover;
  String? coverId;
  int? endTime;
  String? liveId;
  int? liveStatus;
  int? liveType;
  LiveUrl? liveUrl;
  int? popularity;
  String? privateTag;
  RecLiveDTO? recLiveDTO;
  String? roomId;
  int? startStreamTag;
  String? startStreamTagName;
  String? startTime;
  String? title;
  Resource? resource;
  int? type;
  UserInfo? userInfo;
  String? verticalCover;
  String? verticalCoverId;
  String? subtitle;
  List<DiscoveryBannerBean>? banners;
  List<BlockRoomInfoBean>? roomInfoList;

  BlockExtInfoBean(
      {this.buttonTitle,
      this.buttonUrl,
      this.agoraRoomNo,
      this.anchorId,
      this.appKeyType,
      this.bgCoverUrl,
      this.cover,
      this.coverId,
      this.endTime,
      this.liveId,
      this.liveStatus,
      this.liveType,
      this.liveUrl,
      this.popularity,
      this.privateTag,
      this.recLiveDTO,
      this.roomId,
      this.startStreamTag,
      this.startStreamTagName,
      this.startTime,
      this.title,
      this.resource,
      this.type,
      this.userInfo,
      this.verticalCover,
      this.verticalCoverId,
      this.subtitle,
      this.banners,
      this.roomInfoList});

  BlockExtInfoBean.fromJson(dynamic json) {
    buttonTitle = json["buttonTitle"];
    buttonUrl = json["buttonUrl"];
    agoraRoomNo = json["agoraRoomNo"];
    anchorId = json["anchorId"];
    appKeyType = json["appKeyType"];
    bgCoverUrl = json["bgCoverUrl"];
    cover = json["cover"];
    coverId = json["coverId"] is String ? json["coverId"] : json["coverId"].toString();
    endTime = json["endTime"];
    liveId = json["liveId"] is String ? json["liveId"] : json["liveId"].toString();
    liveStatus = json["liveStatus"];
    liveType = json["liveType"];
    liveUrl = json["liveUrl"] != null ? LiveUrl.fromJson(json["liveUrl"]) : null;
    popularity = json["popularity"];
    privateTag = json["privateTag"];
    recLiveDTO = json["recLiveDTO"] != null ? RecLiveDTO.fromJson(json["recLiveDTO"]) : null;
    roomId = json["roomId"] is String ? json["roomId"] : json["roomId"].toString();
    startStreamTag = json["startStreamTag"];
    startStreamTagName = json["startStreamTagName"];
    startTime = json["startTime"] is String ? json["startTime"] : json["startTime"].toString();
    title = json["title"];
    resource = json["resource"] != null ? Resource.fromJson(json["resource"]) : null;
    type = json["type"];
    userInfo = json["userInfo"] != null ? UserInfo.fromJson(json["userInfo"]) : null;
    verticalCover = json["verticalCover"];
    verticalCoverId = json["verticalCoverId"] is String ? json["verticalCoverId"] : json["verticalCoverId"].toString();
    subtitle = json["subtitle"];
    if (json["banners"] != null) {
      banners = [];
      json["banners"].forEach((v) {
        banners?.add(DiscoveryBannerBean.fromJson(v));
      });
    }
    if (json["roomInfoList"] != null) {
      roomInfoList = [];
      json["roomInfoList"].forEach((v) {
        roomInfoList?.add(BlockRoomInfoBean.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["buttonTitle"] = buttonTitle;
    map["buttonUrl"] = buttonUrl;
    map["agoraRoomNo"] = agoraRoomNo;
    map["anchorId"] = anchorId;
    map["appKeyType"] = appKeyType;
    map["bgCoverUrl"] = bgCoverUrl;
    map["cover"] = cover;
    map["coverId"] = coverId;
    map["endTime"] = endTime;
    map["liveId"] = liveId;
    map["liveStatus"] = liveStatus;
    map["liveType"] = liveType;
    if (liveUrl != null) {
      map["liveUrl"] = liveUrl?.toJson();
    }
    map["popularity"] = popularity;
    map["privateTag"] = privateTag;
    if (recLiveDTO != null) {
      map["recLiveDTO"] = recLiveDTO?.toJson();
    }
    map["roomId"] = roomId;
    map["startStreamTag"] = startStreamTag;
    map["startStreamTagName"] = startStreamTagName;
    map["startTime"] = startTime;
    map["title"] = title;
    if (resource != null) {
      map["resource"] = resource?.toJson();
    }
    map["type"] = type;
    if (userInfo != null) {
      map["userInfo"] = userInfo?.toJson();
    }
    map["verticalCover"] = verticalCover;
    map["verticalCoverId"] = verticalCoverId;
    map["subtitle"] = subtitle;
    if (roomInfoList != null) {
      map["roomInfoList"] = roomInfoList?.map((v) => v.toJson()).toList();
    }
    if (banners != null) {
      map["banners"] = banners?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// authStatus : 1
/// avatarUrl : "http://p2.music.126.net/y7le3D9oTFVzR2i7jYC6ng==/109951165828332763.jpg"
/// gender : 2
/// liveRoomNo : 115530425
/// nickname : "凌洛丶深夜电台"
/// userId : 128204992
/// userType : 4
/// vipType : 11

class UserInfo {
  int? authStatus;
  String? avatarUrl;
  int? gender;
  int? liveRoomNo;
  String? nickname;
  int? userId;
  int? userType;
  int? vipType;

  UserInfo(
      {this.authStatus,
      this.avatarUrl,
      this.gender,
      this.liveRoomNo,
      this.nickname,
      this.userId,
      this.userType,
      this.vipType});

  UserInfo.fromJson(dynamic json) {
    authStatus = json["authStatus"];
    avatarUrl = json["avatarUrl"];
    gender = json["gender"];
    liveRoomNo = json["liveRoomNo"];
    nickname = json["nickname"];
    userId = json["userId"];
    userType = json["userType"];
    vipType = json["vipType"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["authStatus"] = authStatus;
    map["avatarUrl"] = avatarUrl;
    map["gender"] = gender;
    map["liveRoomNo"] = liveRoomNo;
    map["nickname"] = nickname;
    map["userId"] = userId;
    map["userType"] = userType;
    map["vipType"] = vipType;
    return map;
  }
}

/// mlogBaseData : {"coverColor":-7109760,"coverHeight":1280,"coverPicKey":"3575895097","coverUrl":"http://p5.music.126.net/obj/w5nDkMOCwrDCmDDDi8Om/3575895097/280b/1fa2/3bcc/88b69eba508165e69fa9e2efae1632a4.jpg","coverWidth":720,"duration":11951,"id":"a1wJKAv17bgUKDA","pubTime":1597068655885,"text":"最讨厌Lisa了，每次看到她就被迷的不行","threadId":"R_MLOG_1001_a1wJKAv17bgUKDA","type":2}
/// mlogExtVO : {"canCollect":true,"commentCount":83,"likedCount":3203,"playCount":490617,"song":{"albumName":"外文精选","artists":[{"artistId":32435598,"artistName":"QnYs安吻"}],"coverUrl":"http://p1.music.126.net/vORoVC4PVE_sdVD-ZBoYzQ==/109951165545771512.jpg","duration":300990,"id":1804899253,"name":"Swagger (抖音版)"},"videoStartPlayTime":0}
/// shareUrl : "https://st.music.163.com/mlog/mlog.html?id=a1wJKAv17bgUKDA&type=2&userid=1596907922&songId=null&startTime=null"
/// status : 1
/// userProfile : {"avatarDetail":{"identityIconUrl":"https://p5.music.126.net/obj/wo3DlcOGw6DClTvDisK1/4761340168/ccce/35dd/ab2d/1a7c8ee0f6bb1fc2760cbb570dfee34f.png","identityLevel":3,"userType":204},"avatarUrl":"http://p2.music.126.net/Lua35WZqOfiGi21i8XSR7g==/109951165767849557.jpg","followed":false,"isAnchor":false,"nickname":"一只小卜","userId":1596907922,"userType":0}

class Resource {
  MlogBaseData? mlogBaseData;
  MlogExtVO? mlogExtVO;
  String? shareUrl;
  int? status;
  UserProfile? userProfile;

  Resource({this.mlogBaseData, this.mlogExtVO, this.shareUrl, this.status, this.userProfile});

  Resource.fromJson(dynamic json) {
    mlogBaseData = json["mlogBaseData"] != null ? MlogBaseData.fromJson(json["mlogBaseData"]) : null;
    mlogExtVO = json["mlogExtVO"] != null ? MlogExtVO.fromJson(json["mlogExtVO"]) : null;
    shareUrl = json["shareUrl"];
    status = json["status"];
    userProfile = json["userProfile"] != null ? UserProfile.fromJson(json["userProfile"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (mlogBaseData != null) {
      map["mlogBaseData"] = mlogBaseData?.toJson();
    }
    if (mlogExtVO != null) {
      map["mlogExtVO"] = mlogExtVO?.toJson();
    }
    map["shareUrl"] = shareUrl;
    map["status"] = status;
    if (userProfile != null) {
      map["userProfile"] = userProfile?.toJson();
    }
    return map;
  }
}

/// avatarDetail : {"identityIconUrl":"https://p5.music.126.net/obj/wo3DlcOGw6DClTvDisK1/4761340168/ccce/35dd/ab2d/1a7c8ee0f6bb1fc2760cbb570dfee34f.png","identityLevel":3,"userType":204}
/// avatarUrl : "http://p2.music.126.net/Lua35WZqOfiGi21i8XSR7g==/109951165767849557.jpg"
/// followed : false
/// isAnchor : false
/// nickname : "一只小卜"
/// userId : 1596907922
/// userType : 0

class UserProfile {
  AvatarDetail? avatarDetail;
  String? avatarUrl;
  bool? followed;
  bool? isAnchor;
  String? nickname;
  int? userId;
  int? userType;

  UserProfile(
      {this.avatarDetail, this.avatarUrl, this.followed, this.isAnchor, this.nickname, this.userId, this.userType});

  UserProfile.fromJson(dynamic json) {
    avatarDetail = json["avatarDetail"] != null ? AvatarDetail.fromJson(json["avatarDetail"]) : null;
    avatarUrl = json["avatarUrl"];
    followed = json["followed"];
    isAnchor = json["isAnchor"];
    nickname = json["nickname"];
    userId = json["userId"];
    userType = json["userType"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (avatarDetail != null) {
      map["avatarDetail"] = avatarDetail?.toJson();
    }
    map["avatarUrl"] = avatarUrl;
    map["followed"] = followed;
    map["isAnchor"] = isAnchor;
    map["nickname"] = nickname;
    map["userId"] = userId;
    map["userType"] = userType;
    return map;
  }
}

/// identityIconUrl : "https://p5.music.126.net/obj/wo3DlcOGw6DClTvDisK1/4761340168/ccce/35dd/ab2d/1a7c8ee0f6bb1fc2760cbb570dfee34f.png"
/// identityLevel : 3
/// userType : 204

class AvatarDetail {
  String? identityIconUrl;
  int? identityLevel;
  int? userType;

  AvatarDetail({this.identityIconUrl, this.identityLevel, this.userType});

  AvatarDetail.fromJson(dynamic json) {
    identityIconUrl = json["identityIconUrl"];
    identityLevel = json["identityLevel"];
    userType = json["userType"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["identityIconUrl"] = identityIconUrl;
    map["identityLevel"] = identityLevel;
    map["userType"] = userType;
    return map;
  }
}

/// canCollect : true
/// commentCount : 83
/// likedCount : 3203
/// playCount : 490617
/// song : {"albumName":"外文精选","artists":[{"artistId":32435598,"artistName":"QnYs安吻"}],"coverUrl":"http://p1.music.126.net/vORoVC4PVE_sdVD-ZBoYzQ==/109951165545771512.jpg","duration":300990,"id":1804899253,"name":"Swagger (抖音版)"}
/// videoStartPlayTime : 0

class MlogExtVO {
  bool? canCollect;
  int? commentCount;
  int? likedCount;
  int? playCount;
  Song? song;
  int? videoStartPlayTime;

  MlogExtVO({this.canCollect, this.commentCount, this.likedCount, this.playCount, this.song, this.videoStartPlayTime});

  MlogExtVO.fromJson(dynamic json) {
    canCollect = json["canCollect"];
    commentCount = json["commentCount"];
    likedCount = json["likedCount"];
    playCount = json["playCount"];
    song = json["song"] != null ? Song.fromJson(json["song"]) : null;
    videoStartPlayTime = json["videoStartPlayTime"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["canCollect"] = canCollect;
    map["commentCount"] = commentCount;
    map["likedCount"] = likedCount;
    map["playCount"] = playCount;
    if (song != null) {
      map["song"] = song?.toJson();
    }
    map["videoStartPlayTime"] = videoStartPlayTime;
    return map;
  }
}

/// albumName : "外文精选"
/// artists : [{"artistId":32435598,"artistName":"QnYs安吻"}]
/// coverUrl : "http://p1.music.126.net/vORoVC4PVE_sdVD-ZBoYzQ==/109951165545771512.jpg"
/// duration : 300990
/// id : 1804899253
/// name : "Swagger (抖音版)"

class Song {
  String? albumName;
  List<Artists>? artists;
  String? coverUrl;
  int? duration;
  int? id;
  String? name;

  Song({this.albumName, this.artists, this.coverUrl, this.duration, this.id, this.name});

  Song.fromJson(dynamic json) {
    albumName = json["albumName"];
    if (json["artists"] != null) {
      artists = [];
      json["artists"].forEach((v) {
        artists?.add(Artists.fromJson(v));
      });
    }
    coverUrl = json["coverUrl"];
    duration = json["duration"];
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["albumName"] = albumName;
    if (artists != null) {
      map["artists"] = artists?.map((v) => v.toJson()).toList();
    }
    map["coverUrl"] = coverUrl;
    map["duration"] = duration;
    map["id"] = id;
    map["name"] = name;
    return map;
  }
}

/// artistId : 32435598
/// artistName : "QnYs安吻"

class Artists {
  int? artistId;
  String? artistName;

  Artists({this.artistId, this.artistName});

  Artists.fromJson(dynamic json) {
    artistId = json["artistId"];
    artistName = json["artistName"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["artistId"] = artistId;
    map["artistName"] = artistName;
    return map;
  }
}

/// coverColor : -7109760
/// coverHeight : 1280
/// coverPicKey : "3575895097"
/// coverUrl : "http://p5.music.126.net/obj/w5nDkMOCwrDCmDDDi8Om/3575895097/280b/1fa2/3bcc/88b69eba508165e69fa9e2efae1632a4.jpg"
/// coverWidth : 720
/// duration : 11951
/// id : "a1wJKAv17bgUKDA"
/// pubTime : 1597068655885
/// text : "最讨厌Lisa了，每次看到她就被迷的不行"
/// threadId : "R_MLOG_1001_a1wJKAv17bgUKDA"
/// type : 2

class MlogBaseData {
  int? coverHeight;
  String? coverPicKey;
  String? coverUrl;
  int? coverWidth;
  String? duration;
  String? id;
  String? text;
  String? threadId;
  int? type;

  MlogBaseData(
      {this.coverHeight,
      this.coverPicKey,
      this.coverUrl,
      this.coverWidth,
      this.duration,
      this.id,
      this.text,
      this.threadId,
      this.type});

  MlogBaseData.fromJson(dynamic json) {
    coverHeight = json["coverHeight"];
    coverPicKey = json["coverPicKey"];
    coverUrl = json["coverUrl"];
    coverWidth = json["coverWidth"];
    duration = json["duration"] is String ? json["duration"] : json["duration"].toString();
    id = json["id"];
    text = json["text"];
    threadId = json["threadId"];
    type = json["type"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["coverHeight"] = coverHeight;
    map["coverPicKey"] = coverPicKey;
    map["coverUrl"] = coverUrl;
    map["coverWidth"] = coverWidth;
    map["duration"] = duration;
    map["id"] = id;
    map["text"] = text;
    map["threadId"] = threadId;
    map["type"] = type;
    return map;
  }
}

/// accompanimentId : 0
/// alg : "alg_live_operator_manual_pinned"
/// cardType : 0
/// recCoverId : 0
/// songId : 0
/// typeDesc : "voicelive"

class RecLiveDTO {
  int? accompanimentId;
  String? alg;
  int? cardType;
  int? recCoverId;
  int? songId;
  String? typeDesc;

  RecLiveDTO({this.accompanimentId, this.alg, this.cardType, this.recCoverId, this.songId, this.typeDesc});

  RecLiveDTO.fromJson(dynamic json) {
    accompanimentId = json["accompanimentId"];
    alg = json["alg"];
    cardType = json["cardType"];
    recCoverId = json["recCoverId"];
    songId = json["songId"];
    typeDesc = json["typeDesc"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["accompanimentId"] = accompanimentId;
    map["alg"] = alg;
    map["cardType"] = cardType;
    map["recCoverId"] = recCoverId;
    map["songId"] = songId;
    map["typeDesc"] = typeDesc;
    return map;
  }
}

/// hlsPullUrl : "http://pullhls3948069e.live.126.net/live/2586a846cad24040b65b79768d355d52/playlist.m3u8"
/// httpPullUrl : "http://flv3948069e.live.126.net/live/2586a846cad24040b65b79768d355d52.flv?netease=flv3948069e.live.126.net"
/// rtmpPullUrl : "rtmp://v3948069e.live.126.net/live/2586a846cad24040b65b79768d355d52"

class LiveUrl {
  String? hlsPullUrl;
  String? httpPullUrl;
  String? rtmpPullUrl;

  LiveUrl({this.hlsPullUrl, this.httpPullUrl, this.rtmpPullUrl});

  LiveUrl.fromJson(dynamic json) {
    hlsPullUrl = json["hlsPullUrl"];
    httpPullUrl = json["httpPullUrl"];
    rtmpPullUrl = json["rtmpPullUrl"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["hlsPullUrl"] = hlsPullUrl;
    map["httpPullUrl"] = httpPullUrl;
    map["rtmpPullUrl"] = rtmpPullUrl;
    return map;
  }
}
