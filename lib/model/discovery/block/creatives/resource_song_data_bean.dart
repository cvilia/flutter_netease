import 'resource_album_bean.dart';
import 'resource_artist_bean.dart';

/// album : {"artist":{"albumSize":0,"briefDesc":"","id":0,"img1v1Id":0,"img1v1Url":"http://p3.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg","musicSize":0,"name":"","picId":0,"picUrl":"http://p3.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg","topicPerson":0,"trans":""},"artists":[{"albumSize":0,"briefDesc":"","id":12503194,"img1v1Id":0,"img1v1Url":"http://p4.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg","musicSize":0,"name":"新乐尘符","picId":0,"picUrl":"http://p3.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg","topicPerson":0,"trans":""},{"albumSize":0,"briefDesc":"","id":12174521,"img1v1Id":0,"img1v1Url":"http://p4.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg","musicSize":0,"name":"音阙诗听","picId":0,"picUrl":"http://p3.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg","topicPerson":0,"trans":""}],"blurPicUrl":"http://p3.music.126.net/doluJ8-Ra5Re8ko3uFEbUA==/109951164137743769.jpg","briefDesc":"","commentThreadId":"R_AL_3_79696262","company":"昌禾文化","companyId":0,"copyrightId":1398818,"description":"","id":79696262,"mark":0,"name":"休闲少女","onSale":false,"pic":109951164137743780,"picId":109951164137743780,"picId_str":"109951164137743769","picUrl":"http://p3.music.126.net/doluJ8-Ra5Re8ko3uFEbUA==/109951164137743769.jpg","publishTime":1560096000000,"size":2,"status":0,"subType":"录音室版","tags":"","type":"EP/Single"}
/// artists : [{"albumSize":0,"briefDesc":"","id":12503194,"img1v1Id":0,"img1v1Url":"http://p3.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg","musicSize":0,"name":"新乐尘符","picId":0,"picUrl":"http://p3.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg","topicPerson":0,"trans":""},{"albumSize":0,"briefDesc":"","id":12174521,"img1v1Id":0,"img1v1Url":"http://p3.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg","musicSize":0,"name":"音阙诗听","picId":0,"picUrl":"http://p3.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg","topicPerson":0,"trans":""}]
/// bMusic : {"bitrate":128000,"dfsId":0,"extension":"mp3","id":3794308606,"playTime":175929,"size":2815917,"sr":48000,"volumeDelta":-53531}
/// commentThreadId : "R_SO_4_1370891745"
/// copyFrom : ""
/// copyright : 0
/// copyrightId : 1398818
/// dayPlays : 0
/// disc : "01"
/// duration : 175929
/// fee : 8
/// ftype : 0
/// hMusic : {"bitrate":320000,"dfsId":0,"extension":"mp3","id":3794308604,"playTime":175929,"size":7039725,"sr":48000,"volumeDelta":-57816}
/// hearTime : 0
/// id : 1370891745
/// lMusic : {"bitrate":128000,"dfsId":0,"extension":"mp3","id":3794308606,"playTime":175929,"size":2815917,"sr":48000,"volumeDelta":-53531}
/// mMusic : {"bitrate":192000,"dfsId":0,"extension":"mp3","id":3794308605,"playTime":175929,"size":4223853,"sr":48000,"volumeDelta":-55214}
/// mark : 0
/// mvid : 0
/// name : "休闲少女"
/// no : 1
/// originCoverType : 0
/// playedNum : 0
/// popularity : 90
/// position : 0
/// ringtone : ""
/// rtype : 0
/// score : 90
/// single : 0
/// starred : false
/// starredNum : 0
/// status : 0

class ResourceSongDataBean {
  ResourceAlbumBean? album;
  List<ResourceArtistBean>? artists;
  BMusic? bMusic;
  String? duration;
  HMusic? hMusic;
  String? id;
  LMusic? lMusic;
  MMusic? mMusic;
  String? mvid;
  String? name;
  int? popularity;

  ResourceSongDataBean(
      {this.album,
      this.artists,
      this.bMusic,
      this.duration,
      this.hMusic,
      this.id,
      this.lMusic,
      this.mMusic,
      this.mvid,
      this.name,
      this.popularity});

  ResourceSongDataBean.fromJson(dynamic json) {
    album = json["album"] != null ? ResourceAlbumBean.fromJson(json["album"]) : null;
    if (json["artists"] != null) {
      artists = [];
      json["artists"].forEach((v) {
        artists?.add(ResourceArtistBean.fromJson(v));
      });
    }
    bMusic = json["bMusic"] != null ? BMusic.fromJson(json["bMusic"]) : null;
    duration = json["duration"] is String ? json["duration"] : json["duration"].toString();
    hMusic = json["hMusic"] != null ? HMusic.fromJson(json["hMusic"]) : null;
    id = json["id"] is String ? json["id"] : json["id"].toString();
    lMusic = json["lMusic"] != null ? LMusic.fromJson(json["lMusic"]) : null;
    mMusic = json["mMusic"] != null ? MMusic.fromJson(json["mMusic"]) : null;
    mvid = json["mvid"] is String ? json["mvid"] : json["mvid"].toString();
    name = json["name"];
    popularity = json["popularity"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (album != null) {
      map["album"] = album?.toJson();
    }
    if (artists != null) {
      map["artists"] = artists?.map((v) => v.toJson()).toList();
    }
    if (bMusic != null) {
      map["bMusic"] = bMusic?.toJson();
    }
    map["duration"] = duration;
    if (hMusic != null) {
      map["hMusic"] = hMusic?.toJson();
    }
    map["id"] = id;
    if (lMusic != null) {
      map["lMusic"] = lMusic?.toJson();
    }
    if (mMusic != null) {
      map["mMusic"] = mMusic?.toJson();
    }
    map["mvid"] = mvid;
    map["name"] = name;
    map["popularity"] = popularity;
    return map;
  }
}

/// bitrate : 192000
/// dfsId : 0
/// extension : "mp3"
/// id : 3794308605
/// playTime : 175929
/// size : 4223853
/// sr : 48000
/// volumeDelta : -55214

class MMusic {
  String? bitrate;
  String? extension;
  String? id;
  String? playTime;
  String? size;
  String? sr;

  MMusic({this.bitrate, this.extension, this.id, this.playTime, this.size, this.sr});

  MMusic.fromJson(dynamic json) {
    bitrate = json["bitrate"] is String ? json["bitrate"] : json["bitrate"].toString();
    extension = json["extension"];
    id = json["id"] is String ? json["id"] : json["id"].toString();
    playTime = json["playTime"] is String ? json["playTime"] : json["playTime"].toString();
    size = json["size"] is String ? json["size"] : json["size"].toString();
    sr = json["sr"] is String ? json["sr"] : json["sr"].toString();
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["bitrate"] = bitrate;
    map["extension"] = extension;
    map["id"] = id;
    map["playTime"] = playTime;
    map["size"] = size;
    map["sr"] = sr;
    return map;
  }
}

/// bitrate : 128000
/// dfsId : 0
/// extension : "mp3"
/// id : 3794308606
/// playTime : 175929
/// size : 2815917
/// sr : 48000
/// volumeDelta : -53531

class LMusic {
  String? bitrate;
  String? extension;
  String? id;
  String? playTime;
  String? size;
  String? sr;

  LMusic({this.bitrate, this.extension, this.id, this.playTime, this.size, this.sr});

  LMusic.fromJson(dynamic json) {
    bitrate = json["bitrate"] is String ? json["bitrate"] : json["bitrate"].toString();
    extension = json["extension"];
    id = json["id"] is String ? json["id"] : json["id"].toString();
    playTime = json["playTime"] is String ? json["playTime"] : json["playTime"].toString();
    size = json["size"] is String ? json["size"] : json["size"].toString();
    sr = json["sr"] is String ? json["sr"] : json["sr"].toString();
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["bitrate"] = bitrate;
    map["extension"] = extension;
    map["id"] = id;
    map["playTime"] = playTime;
    map["size"] = size;
    map["sr"] = sr;
    return map;
  }
}

/// bitrate : 320000
/// dfsId : 0
/// extension : "mp3"
/// id : 3794308604
/// playTime : 175929
/// size : 7039725
/// sr : 48000
/// volumeDelta : -57816

class HMusic {
  String? bitrate;
  String? extension;
  String? id;
  String? playTime;
  String? size;
  String? sr;

  HMusic({this.bitrate, this.extension, this.id, this.playTime, this.size, this.sr});

  HMusic.fromJson(dynamic json) {
    bitrate = json["bitrate"] is String ? json["bitrate"] : json["bitrate"].toString();
    extension = json["extension"];
    id = json["id"] is String ? json["id"] : json["id"].toString();
    playTime = json["playTime"] is String ? json["playTime"] : json["playTime"].toString();
    size = json["size"] is String ? json["size"] : json["size"].toString();
    sr = json["sr"] is String ? json["sr"] : json["sr"].toString();
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["bitrate"] = bitrate;
    map["extension"] = extension;
    map["id"] = id;
    map["playTime"] = playTime;
    map["size"] = size;
    map["sr"] = sr;
    return map;
  }
}

/// bitrate : 128000
/// dfsId : 0
/// extension : "mp3"
/// id : 3794308606
/// playTime : 175929
/// size : 2815917
/// sr : 48000
/// volumeDelta : -53531

class BMusic {
  String? bitrate;
  String? extension;
  String? id;
  String? playTime;
  String? size;
  String? sr;

  BMusic({this.bitrate, this.extension, this.id, this.playTime, this.size, this.sr});

  BMusic.fromJson(dynamic json) {
    bitrate = json["bitrate"] is String ? json["bitrate"] : json["bitrate"].toString();
    extension = json["extension"];
    id = json["id"] is String ? json["id"] : json["id"].toString();
    playTime = json["playTime"] is String ? json["playTime"] : json["playTime"].toString();
    size = json["size"] is String ? json["size"] : json["size"].toString();
    sr = json["sr"] is String ? json["sr"] : json["sr"].toString();
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["bitrate"] = bitrate;
    map["extension"] = extension;
    map["id"] = id;
    map["playTime"] = playTime;
    map["size"] = size;
    map["sr"] = sr;
    return map;
  }
}
