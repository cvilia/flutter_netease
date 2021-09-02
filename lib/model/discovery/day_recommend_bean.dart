/// code : 200
/// data : {"dailySongs":[{"al":{"id":120919402,"name":"四季予你","picUrl":"http://p3.music.126.net/k5r1GC-erKK4WcDmzyrsIw==/109951165648878421.jpg","pic_str":"109951165648878421"},"ar":[{"id":7424,"name":"程响"}],"id":1807537867,"mv":14241570,"name":"四季予你","originSongSimpleData":{"albumMeta":{"id":121002821,"name":"沈园外"},"artists":[{"id":12227865,"name":"阿YueYue"},{"id":30437391,"name":"戾格"},{"id":12852319,"name":"小田音乐社"}],"name":"沈园外","songId":1808078153},"reason":"根据你可能喜欢的单曲 提拉米苏"}],"recommendReasons":[{"reason":"超69%人播放","songId":1807537867},{"reason":"你关注的音乐人","songId":1481805493}]}

class DayRecommendBean {
  int? code;
  Data? data;

  DayRecommendBean({this.code, this.data});

  DayRecommendBean.fromJson(dynamic json) {
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['code'] = code;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// dailySongs : [{"al":{"id":120919402,"name":"四季予你","picUrl":"http://p3.music.126.net/k5r1GC-erKK4WcDmzyrsIw==/109951165648878421.jpg","pic_str":"109951165648878421"},"ar":[{"id":7424,"name":"程响"}],"id":1807537867,"mv":14241570,"name":"四季予你","originSongSimpleData":{"albumMeta":{"id":121002821,"name":"沈园外"},"artists":[{"id":12227865,"name":"阿YueYue"},{"id":30437391,"name":"戾格"},{"id":12852319,"name":"小田音乐社"}],"name":"沈园外","songId":1808078153},"reason":"根据你可能喜欢的单曲 提拉米苏"}]
/// recommendReasons : [{"reason":"超69%人播放","songId":1807537867},{"reason":"你关注的音乐人","songId":1481805493}]

class Data {
  List<DailySongs>? dailySongs;
  List<RecommendReasons>? recommendReasons;

  Data({this.dailySongs, this.recommendReasons});

  Data.fromJson(dynamic json) {
    if (json['dailySongs'] != null) {
      dailySongs = [];
      json['dailySongs'].forEach((v) {
        dailySongs?.add(DailySongs.fromJson(v));
      });
    }
    if (json['recommendReasons'] != null) {
      recommendReasons = [];
      json['recommendReasons'].forEach((v) {
        recommendReasons?.add(RecommendReasons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (dailySongs != null) {
      map['dailySongs'] = dailySongs?.map((v) => v.toJson()).toList();
    }
    if (recommendReasons != null) {
      map['recommendReasons'] = recommendReasons?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// reason : "超69%人播放"
/// songId : 1807537867

class RecommendReasons {
  String? reason;
  int? songId;

  RecommendReasons({this.reason, this.songId});

  RecommendReasons.fromJson(dynamic json) {
    reason = json['reason'];
    songId = json['songId'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['reason'] = reason;
    map['songId'] = songId;
    return map;
  }
}

/// al : {"id":120919402,"name":"四季予你","picUrl":"http://p3.music.126.net/k5r1GC-erKK4WcDmzyrsIw==/109951165648878421.jpg","pic_str":"109951165648878421"}
/// ar : [{"id":7424,"name":"程响"}]
/// id : 1807537867
/// mv : 14241570
/// name : "四季予你"
/// originSongSimpleData : {"albumMeta":{"id":121002821,"name":"沈园外"},"artists":[{"id":12227865,"name":"阿YueYue"},{"id":30437391,"name":"戾格"},{"id":12852319,"name":"小田音乐社"}],"name":"沈园外","songId":1808078153}
/// reason : "根据你可能喜欢的单曲 提拉米苏"

class DailySongs {
  Album? album;
  List<Singer>? singer;
  int? id;
  int? mv;
  String? name;
  OriginSongSimpleData? originSongSimpleData;
  String? reason;

  DailySongs({this.album, this.singer, this.id, this.mv, this.name, this.originSongSimpleData, this.reason});

  DailySongs.fromJson(dynamic json) {
    album = json['al'] != null ? Album.fromJson(json['al']) : null;
    if (json['ar'] != null) {
      singer = [];
      json['ar'].forEach((v) {
        singer?.add(Singer.fromJson(v));
      });
    }
    id = json['id'];
    mv = json['mv'];
    name = json['name'];
    originSongSimpleData =
        json['originSongSimpleData'] != null ? OriginSongSimpleData.fromJson(json['originSongSimpleData']) : null;
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (album != null) {
      map['al'] = album?.toJson();
    }
    if (singer != null) {
      map['ar'] = singer?.map((v) => v.toJson()).toList();
    }
    map['id'] = id;
    map['mv'] = mv;
    map['name'] = name;
    if (originSongSimpleData != null) {
      map['originSongSimpleData'] = originSongSimpleData?.toJson();
    }
    map['reason'] = reason;
    return map;
  }
}

/// albumMeta : {"id":121002821,"name":"沈园外"}
/// artists : [{"id":12227865,"name":"阿YueYue"},{"id":30437391,"name":"戾格"},{"id":12852319,"name":"小田音乐社"}]
/// name : "沈园外"
/// songId : 1808078153

class OriginSongSimpleData {
  AlbumMeta? albumMeta;
  List<Artists>? artists;
  String? name;
  int? songId;

  OriginSongSimpleData({this.albumMeta, this.artists, this.name, this.songId});

  OriginSongSimpleData.fromJson(dynamic json) {
    albumMeta = json['albumMeta'] != null ? AlbumMeta.fromJson(json['albumMeta']) : null;
    if (json['artists'] != null) {
      artists = [];
      json['artists'].forEach((v) {
        artists?.add(Artists.fromJson(v));
      });
    }
    name = json['name'];
    songId = json['songId'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (albumMeta != null) {
      map['albumMeta'] = albumMeta?.toJson();
    }
    if (artists != null) {
      map['artists'] = artists?.map((v) => v.toJson()).toList();
    }
    map['name'] = name;
    map['songId'] = songId;
    return map;
  }
}

/// id : 12227865
/// name : "阿YueYue"

class Artists {
  int? id;
  String? name;

  Artists({this.id, this.name});

  Artists.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}

/// id : 121002821
/// name : "沈园外"

class AlbumMeta {
  int? id;
  String? name;

  AlbumMeta({this.id, this.name});

  AlbumMeta.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}

/// id : 7424
/// name : "程响"

class Singer {
  int? id;
  String? name;

  Singer({this.id, this.name});

  Singer.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}

/// id : 120919402
/// name : "四季予你"
/// picUrl : "http://p3.music.126.net/k5r1GC-erKK4WcDmzyrsIw==/109951165648878421.jpg"
/// pic_str : "109951165648878421"

class Album {
  int? id;
  String? name;
  String? picUrl;
  String? picStr;

  Album({this.id, this.name, this.picUrl, this.picStr});

  Album.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    picUrl = json['picUrl'];
    picStr = json['pic_str'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['picUrl'] = picUrl;
    map['pic_str'] = picStr;
    return map;
  }
}
