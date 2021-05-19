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
  String? commentThreadId;
  String? copyFrom;
  int? copyright;
  int? copyrightId;
  int? dayPlays;
  String? disc;
  int? duration;
  int? fee;
  int? ftype;
  HMusic? hMusic;
  int? hearTime;
  int? id;
  LMusic? lMusic;
  MMusic? mMusic;
  int? mark;
  int? mvid;
  String? name;
  int? no;
  int? originCoverType;
  int? playedNum;
  int? popularity;
  int? position;
  String? ringtone;
  int? rtype;
  int? score;
  int? single;
  bool? starred;
  int? starredNum;
  int? status;

  ResourceSongDataBean({
      this.album, 
      this.artists, 
      this.bMusic, 
      this.commentThreadId, 
      this.copyFrom, 
      this.copyright, 
      this.copyrightId, 
      this.dayPlays, 
      this.disc, 
      this.duration, 
      this.fee, 
      this.ftype, 
      this.hMusic, 
      this.hearTime, 
      this.id, 
      this.lMusic, 
      this.mMusic, 
      this.mark, 
      this.mvid, 
      this.name, 
      this.no, 
      this.originCoverType, 
      this.playedNum, 
      this.popularity, 
      this.position, 
      this.ringtone, 
      this.rtype, 
      this.score, 
      this.single, 
      this.starred, 
      this.starredNum, 
      this.status});

  ResourceSongDataBean.fromJson(dynamic json) {
    album = json["album"] != null ? ResourceAlbumBean.fromJson(json["album"]) : null;
    if (json["artists"] != null) {
      artists = [];
      json["artists"].forEach((v) {
        artists?.add(ResourceArtistBean.fromJson(v));
      });
    }
    bMusic = json["bMusic"] != null ? BMusic.fromJson(json["bMusic"]) : null;
    commentThreadId = json["commentThreadId"];
    copyFrom = json["copyFrom"];
    copyright = json["copyright"];
    copyrightId = json["copyrightId"];
    dayPlays = json["dayPlays"];
    disc = json["disc"];
    duration = json["duration"];
    fee = json["fee"];
    ftype = json["ftype"];
    hMusic = json["hMusic"] != null ? HMusic.fromJson(json["hMusic"]) : null;
    hearTime = json["hearTime"];
    id = json["id"];
    lMusic = json["lMusic"] != null ? LMusic.fromJson(json["lMusic"]) : null;
    mMusic = json["mMusic"] != null ? MMusic.fromJson(json["mMusic"]) : null;
    mark = json["mark"];
    mvid = json["mvid"];
    name = json["name"];
    no = json["no"];
    originCoverType = json["originCoverType"];
    playedNum = json["playedNum"];
    popularity = json["popularity"];
    position = json["position"];
    ringtone = json["ringtone"];
    rtype = json["rtype"];
    score = json["score"];
    single = json["single"];
    starred = json["starred"];
    starredNum = json["starredNum"];
    status = json["status"];
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
    map["commentThreadId"] = commentThreadId;
    map["copyFrom"] = copyFrom;
    map["copyright"] = copyright;
    map["copyrightId"] = copyrightId;
    map["dayPlays"] = dayPlays;
    map["disc"] = disc;
    map["duration"] = duration;
    map["fee"] = fee;
    map["ftype"] = ftype;
    if (hMusic != null) {
      map["hMusic"] = hMusic?.toJson();
    }
    map["hearTime"] = hearTime;
    map["id"] = id;
    if (lMusic != null) {
      map["lMusic"] = lMusic?.toJson();
    }
    if (mMusic != null) {
      map["mMusic"] = mMusic?.toJson();
    }
    map["mark"] = mark;
    map["mvid"] = mvid;
    map["name"] = name;
    map["no"] = no;
    map["originCoverType"] = originCoverType;
    map["playedNum"] = playedNum;
    map["popularity"] = popularity;
    map["position"] = position;
    map["ringtone"] = ringtone;
    map["rtype"] = rtype;
    map["score"] = score;
    map["single"] = single;
    map["starred"] = starred;
    map["starredNum"] = starredNum;
    map["status"] = status;
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
  int? bitrate;
  int? dfsId;
  String? extension;
  int? id;
  int? playTime;
  int? size;
  int? sr;
  int? volumeDelta;

  MMusic({
      this.bitrate, 
      this.dfsId, 
      this.extension, 
      this.id, 
      this.playTime, 
      this.size, 
      this.sr, 
      this.volumeDelta});

  MMusic.fromJson(dynamic json) {
    bitrate = json["bitrate"];
    dfsId = json["dfsId"];
    extension = json["extension"];
    id = json["id"];
    playTime = json["playTime"];
    size = json["size"];
    sr = json["sr"];
    volumeDelta = json["volumeDelta"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["bitrate"] = bitrate;
    map["dfsId"] = dfsId;
    map["extension"] = extension;
    map["id"] = id;
    map["playTime"] = playTime;
    map["size"] = size;
    map["sr"] = sr;
    map["volumeDelta"] = volumeDelta;
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
  int? bitrate;
  int? dfsId;
  String? extension;
  int? id;
  int? playTime;
  int? size;
  int? sr;
  int? volumeDelta;

  LMusic({
      this.bitrate, 
      this.dfsId, 
      this.extension, 
      this.id, 
      this.playTime, 
      this.size, 
      this.sr, 
      this.volumeDelta});

  LMusic.fromJson(dynamic json) {
    bitrate = json["bitrate"];
    dfsId = json["dfsId"];
    extension = json["extension"];
    id = json["id"];
    playTime = json["playTime"];
    size = json["size"];
    sr = json["sr"];
    volumeDelta = json["volumeDelta"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["bitrate"] = bitrate;
    map["dfsId"] = dfsId;
    map["extension"] = extension;
    map["id"] = id;
    map["playTime"] = playTime;
    map["size"] = size;
    map["sr"] = sr;
    map["volumeDelta"] = volumeDelta;
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
  int? bitrate;
  int? dfsId;
  String? extension;
  int? id;
  int? playTime;
  int? size;
  int? sr;
  int? volumeDelta;

  HMusic({
      this.bitrate, 
      this.dfsId, 
      this.extension, 
      this.id, 
      this.playTime, 
      this.size, 
      this.sr, 
      this.volumeDelta});

  HMusic.fromJson(dynamic json) {
    bitrate = json["bitrate"];
    dfsId = json["dfsId"];
    extension = json["extension"];
    id = json["id"];
    playTime = json["playTime"];
    size = json["size"];
    sr = json["sr"];
    volumeDelta = json["volumeDelta"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["bitrate"] = bitrate;
    map["dfsId"] = dfsId;
    map["extension"] = extension;
    map["id"] = id;
    map["playTime"] = playTime;
    map["size"] = size;
    map["sr"] = sr;
    map["volumeDelta"] = volumeDelta;
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
  int? bitrate;
  int? dfsId;
  String? extension;
  int? id;
  int? playTime;
  int? size;
  int? sr;
  int? volumeDelta;

  BMusic({
      this.bitrate, 
      this.dfsId, 
      this.extension, 
      this.id, 
      this.playTime, 
      this.size, 
      this.sr, 
      this.volumeDelta});

  BMusic.fromJson(dynamic json) {
    bitrate = json["bitrate"];
    dfsId = json["dfsId"];
    extension = json["extension"];
    id = json["id"];
    playTime = json["playTime"];
    size = json["size"];
    sr = json["sr"];
    volumeDelta = json["volumeDelta"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["bitrate"] = bitrate;
    map["dfsId"] = dfsId;
    map["extension"] = extension;
    map["id"] = id;
    map["playTime"] = playTime;
    map["size"] = size;
    map["sr"] = sr;
    map["volumeDelta"] = volumeDelta;
    return map;
  }

}