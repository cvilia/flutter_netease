
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
  String? commentThreadId;
  String? company;
  int? companyId;
  int? copyrightId;
  String? description;
  int? id;
  int? mark;
  String? name;
  bool? onSale;
  int? pic;
  int? picId;
  String? picIdStr;
  String? picUrl;
  int? publishTime;
  int? size;
  int? status;
  String? subType;
  String? tags;
  String? type;

  ResourceAlbumBean({
      this.artist, 
      this.artists, 
      this.blurPicUrl, 
      this.briefDesc, 
      this.commentThreadId, 
      this.company, 
      this.companyId, 
      this.copyrightId, 
      this.description, 
      this.id, 
      this.mark, 
      this.name, 
      this.onSale, 
      this.pic, 
      this.picId, 
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
    commentThreadId = json["commentThreadId"];
    company = json["company"];
    companyId = json["companyId"];
    copyrightId = json["copyrightId"];
    description = json["description"];
    id = json["id"];
    mark = json["mark"];
    name = json["name"];
    onSale = json["onSale"];
    pic = json["pic"];
    picId = json["picId"];
    picIdStr = json["picId_str"];
    picUrl = json["picUrl"];
    publishTime = json["publishTime"];
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
    map["commentThreadId"] = commentThreadId;
    map["company"] = company;
    map["companyId"] = companyId;
    map["copyrightId"] = copyrightId;
    map["description"] = description;
    map["id"] = id;
    map["mark"] = mark;
    map["name"] = name;
    map["onSale"] = onSale;
    map["pic"] = pic;
    map["picId"] = picId;
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