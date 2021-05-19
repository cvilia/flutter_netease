import 'package:json_annotation/json_annotation.dart';

/// bannerId : "1621399504310632"
/// encodeId : "6342077609865180917"
/// exclusive : false
/// pic : "http://p1.music.126.net/tHdoSB-o1weiuLTQSdhzIg==/109951165989503345.jpg"
/// pid : "4002"
/// requestId : ""
/// scm : "1.music-homepage.homepage_banner_force.banner.2865980.-810592013.null"
/// showAdTag : true
/// adDispatchJson : ""
/// adLocation : "10002"
/// adSource : "1"
/// adid : "6342077609865180917"
/// adurlV2 : "https://go.163.com/f2e/20210331_tongyi/index.html"
/// song : {"al":{"id":127486725,"name":"夜车","pic":109951165984868800,"picUrl":"http://p4.music.126.net/UQvBQO9gN5KUbRnKRL6udg==/109951165984868804.jpg","pic_str":"109951165984868804"},"ar":[{"id":10589,"name":"张蔷"}],"cd":"01","cf":"","copyright":0,"cp":2707463,"djId":0,"dt":221805,"fee":8,"ftype":0,"h":{"br":320000,"fid":0,"size":8874362,"vd":-49809},"id":1845434968,"l":{"br":128000,"fid":0,"size":3549771,"vd":-45481},"m":{"br":192000,"fid":0,"size":5324635,"vd":-47214},"mark":8192,"mst":9,"mv":14287196,"name":"夜车","no":1,"originCoverType":0,"pop":5,"pst":0,"publishTime":0,"rt":"","rtype":0,"s_id":0,"single":0,"st":0,"t":0,"v":4,"videoInfo":{"moreThanOne":false,"video":{"coverUrl":"http://p4.music.126.net/xlhCLJumbqIB2LJkrVl61A==/109951165984878496.jpg","playTime":2508,"publishTime":1621353600007,"title":"夜车","type":0,"vid":"14287196"}}}
/// targetId : 1845434968
/// targetType : 1
/// titleColor : "red"
/// typeTitle : "独家"
/// url : "https://go.163.com/f2e/20210331_tongyi/index.html"

class DiscoveryBannerBean {
  String? bannerId;
  String? pic;
  String? pid;
  String? requestId;
  bool? showAdTag;
  String? adDispatchJson;
  String? adLocation;
  String? adSource;
  String? adid;
  String? adurlV2;
  Song? song;
  String? targetId;
  String? targetType;
  String? typeTitle;
  String? url;

  DiscoveryBannerBean(
      {this.bannerId,
      this.pic,
      this.pid,
      this.requestId,
      this.showAdTag,
      this.adDispatchJson,
      this.adLocation,
      this.adSource,
      this.adid,
      this.adurlV2,
      this.song,
      this.targetId,
      this.targetType,
      this.typeTitle,
      this.url});

  DiscoveryBannerBean.fromJson(dynamic json) {
    bannerId = json["bannerId"];
    pic = json["pic"];
    pid = json["pid"];
    requestId = json["requestId"];
    showAdTag = json["showAdTag"];
    adDispatchJson = json["adDispatchJson"];
    adLocation = json["adLocation"];
    adSource = json["adSource"];
    adid = json["adid"];
    adurlV2 = json["adurlV2"];
    song = json["song"] != null ? Song.fromJson(json["song"]) : null;
    targetId = json["targetId"] is String ? json["targetId"] : json["targetId"].toString();
    targetType = json["targetType"] is String ? json["targetType"] : json["targetType"].toString();
    typeTitle = json["typeTitle"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["bannerId"] = bannerId;
    map["pic"] = pic;
    map["pid"] = pid;
    map["requestId"] = requestId;
    map["showAdTag"] = showAdTag;
    map["adDispatchJson"] = adDispatchJson;
    map["adLocation"] = adLocation;
    map["adSource"] = adSource;
    map["adid"] = adid;
    map["adurlV2"] = adurlV2;
    if (song != null) {
      map["song"] = song?.toJson();
    }
    map["targetId"] = targetId;
    map["targetType"] = targetType;
    map["typeTitle"] = typeTitle;
    map["url"] = url;
    return map;
  }
}

/// al : {"id":127486725,"name":"夜车","pic":109951165984868800,"picUrl":"http://p4.music.126.net/UQvBQO9gN5KUbRnKRL6udg==/109951165984868804.jpg","pic_str":"109951165984868804"}
/// ar : [{"id":10589,"name":"张蔷"}]
/// cd : "01"
/// cf : ""
/// copyright : 0
/// cp : 2707463
/// djId : 0
/// dt : 221805
/// fee : 8
/// ftype : 0
/// h : {"br":320000,"fid":0,"size":8874362,"vd":-49809}
/// id : 1845434968
/// l : {"br":128000,"fid":0,"size":3549771,"vd":-45481}
/// m : {"br":192000,"fid":0,"size":5324635,"vd":-47214}
/// mark : 8192
/// mst : 9
/// mv : 14287196
/// name : "夜车"
/// no : 1
/// originCoverType : 0
/// pop : 5
/// pst : 0
/// publishTime : 0
/// rt : ""
/// rtype : 0
/// s_id : 0
/// single : 0
/// st : 0
/// t : 0
/// v : 4
/// videoInfo : {"moreThanOne":false,"video":{"coverUrl":"http://p4.music.126.net/xlhCLJumbqIB2LJkrVl61A==/109951165984878496.jpg","playTime":2508,"publishTime":1621353600007,"title":"夜车","type":0,"vid":"14287196"}}

class Song {
  Al? al;
  List<Ar>? ar;
  int? id;
  String? mv;
  String? name;
  VideoInfo? videoInfo;

  Song({this.al, this.ar, this.id, this.mv, this.name, this.videoInfo});

  Song.fromJson(dynamic json) {
    al = json["al"] != null ? Al.fromJson(json["al"]) : null;
    if (json["ar"] != null) {
      ar = [];
      json["ar"].forEach((v) {
        ar?.add(Ar.fromJson(v));
      });
    }
    id = json["id"];
    mv = json["mv"] is String ? json["mv"] : json["mv"].toString();
    name = json["name"];
    videoInfo = json["videoInfo"] != null ? VideoInfo.fromJson(json["videoInfo"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (al != null) {
      map["al"] = al?.toJson();
    }
    if (ar != null) {
      map["ar"] = ar?.map((v) => v.toJson()).toList();
    }
    map["id"] = id;
    map["mv"] = mv;
    map["name"] = name;
    if (videoInfo != null) {
      map["videoInfo"] = videoInfo?.toJson();
    }
    return map;
  }
}

/// moreThanOne : false
/// video : {"coverUrl":"http://p4.music.126.net/xlhCLJumbqIB2LJkrVl61A==/109951165984878496.jpg","playTime":2508,"publishTime":1621353600007,"title":"夜车","type":0,"vid":"14287196"}

class VideoInfo {
  bool? moreThanOne;
  Video? video;

  VideoInfo({this.moreThanOne, this.video});

  VideoInfo.fromJson(dynamic json) {
    moreThanOne = json["moreThanOne"];
    video = json["video"] != null ? Video.fromJson(json["video"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["moreThanOne"] = moreThanOne;
    if (video != null) {
      map["video"] = video?.toJson();
    }
    return map;
  }
}

/// coverUrl : "http://p4.music.126.net/xlhCLJumbqIB2LJkrVl61A==/109951165984878496.jpg"
/// playTime : 2508
/// publishTime : 1621353600007
/// title : "夜车"
/// type : 0
/// vid : "14287196"

class Video {
  String? coverUrl;
  int? playTime;
  int? publishTime;
  String? title;
  int? type;
  String? vid;

  Video({this.coverUrl, this.playTime, this.publishTime, this.title, this.type, this.vid});

  Video.fromJson(dynamic json) {
    coverUrl = json["coverUrl"];
    playTime = json["playTime"];
    publishTime = json["publishTime"];
    title = json["title"];
    type = json["type"];
    vid = json["vid"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["coverUrl"] = coverUrl;
    map["playTime"] = playTime;
    map["publishTime"] = publishTime;
    map["title"] = title;
    map["type"] = type;
    map["vid"] = vid;
    return map;
  }
}

/// id : 10589
/// name : "张蔷"

class Ar {
  @JsonKey(name: "id")
  String? singerId;
  String? name;

  Ar({this.singerId, this.name});

  Ar.fromJson(dynamic json) {
    singerId = json["id"] is String ? json["id"] : json["id"].toString();
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = singerId;
    map["name"] = name;
    return map;
  }
}

/// id : 127486725
/// name : "夜车"
/// pic : 109951165984868800
/// picUrl : "http://p4.music.126.net/UQvBQO9gN5KUbRnKRL6udg==/109951165984868804.jpg"
/// pic_str : "109951165984868804"

class Al {
  @JsonKey(name: "id")
  String? albumId;
  String? name;
  String? picUrl;
  String? picStr;

  Al({this.albumId, this.name, this.picUrl, this.picStr});

  Al.fromJson(dynamic json) {
    albumId = json["id"] is String ? json["id"] : json["id"].toString();
    name = json["name"];
    picUrl = json["picUrl"];
    picStr = json["pic_str"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = albumId;
    map["name"] = name;
    map["picUrl"] = picUrl;
    map["pic_str"] = picStr;
    return map;
  }
}
