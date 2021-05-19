import 'resource_artist_bean.dart';

/// artist : {"albumSize":0,"briefDesc":"","id":0,"img1v1Id":0,"img1v1Url":"http://p3.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg","musicSize":0,"name":"","picId":0,"picUrl":"http://p3.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg","topicPerson":0,"trans":""}
/// artists : [{"albumSize":0,"briefDesc":"","id":12503194,"img1v1Id":0,"img1v1Url":"http://p4.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg","musicSize":0,"name":"新乐尘符","picId":0,"picUrl":"http://p3.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg","topicPerson":0,"trans":""},{"albumSize":0,"briefDesc":"","id":12174521,"img1v1Id":0,"img1v1Url":"http://p4.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg","musicSize":0,"name":"音阙诗听","picId":0,"picUrl":"http://p3.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg","topicPerson":0,"trans":""}]
/// blurPicUrl : "http://p3.music.126.net/doluJ8-Ra5Re8ko3uFEbUA==/109951164137743769.jpg"
/// briefDesc : ""
/// commentThreadId : "R_AL_3_79696262"
/// company : "昌禾文化"
/// companyId : 0
/// copyrightId : 1398818
/// description : ""
/// id : 79696262
/// mark : 0
/// name : "休闲少女"
/// onSale : false
/// pic : 109951164137743780
/// picId : 109951164137743780
/// picId_str : "109951164137743769"
/// picUrl : "http://p3.music.126.net/doluJ8-Ra5Re8ko3uFEbUA==/109951164137743769.jpg"
/// publishTime : 1560096000000
/// size : 2
/// status : 0
/// subType : "录音室版"
/// tags : ""
/// type : "EP/Single"

class ResourceAlbumBean {
  ResourceArtistBean? artist;
  List<ResourceArtistBean>? artists;
  String? blurPicUrl;
  String? briefDesc;
  String? company;
  String? companyId;
  String? copyrightId;
  String? description;
  String? id;
  int? mark;
  String? name;
  bool? onSale;
  String? picIdStr;
  String? picUrl;
  String? publishTime;
  int? size;
  int? status;
  String? subType;
  String? tags;
  String? type;

  ResourceAlbumBean(
      {this.artist,
      this.artists,
      this.blurPicUrl,
      this.briefDesc,
      this.company,
      this.companyId,
      this.copyrightId,
      this.description,
      this.id,
      this.mark,
      this.name,
      this.onSale,
      this.picIdStr,
      this.picUrl,
      this.publishTime,
      this.size,
      this.status,
      this.subType,
      this.tags,
      this.type});

  ResourceAlbumBean.fromJson(dynamic json) {
    artist = json["artist"] != null ? ResourceArtistBean.fromJson(json["artist"]) : null;
    if (json["artists"] != null) {
      artists = [];
      json["artists"].forEach((v) {
        artists?.add(ResourceArtistBean.fromJson(v));
      });
    }
    blurPicUrl = json["blurPicUrl"];
    briefDesc = json["briefDesc"];
    company = json["company"];
    companyId = json["companyId"] is String ? json["companyId"] : json["companyId"].toString();
    copyrightId = json["copyrightId"] is String ? json["copyrightId"] : json["copyrightId"].toString();
    description = json["description"];
    id = json["id"] is String ? json["id"] : json["id"].toString();
    mark = json["mark"];
    name = json["name"];
    onSale = json["onSale"];
    picIdStr = json["picId_str"];
    picUrl = json["picUrl"];
    publishTime = json["publishTime"] is String ? json["publishTime"] : json["publishTime"].toString();
    size = json["size"];
    status = json["status"];
    subType = json["subType"];
    tags = json["tags"];
    type = json["type"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (artist != null) {
      map["artist"] = artist?.toJson();
    }
    if (artists != null) {
      map["artists"] = artists?.map((v) => v.toJson()).toList();
    }
    map["blurPicUrl"] = blurPicUrl;
    map["briefDesc"] = briefDesc;
    map["company"] = company;
    map["companyId"] = companyId;
    map["copyrightId"] = copyrightId;
    map["description"] = description;
    map["id"] = id;
    map["mark"] = mark;
    map["name"] = name;
    map["onSale"] = onSale;
    map["picId_str"] = picIdStr;
    map["picUrl"] = picUrl;
    map["publishTime"] = publishTime;
    map["size"] = size;
    map["status"] = status;
    map["subType"] = subType;
    map["tags"] = tags;
    map["type"] = type;
    return map;
  }
}
