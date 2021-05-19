/// albumSize : 0
/// briefDesc : ""
/// id : 0
/// img1v1Id : 0
/// img1v1Url : "http://p3.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg"
/// musicSize : 0
/// name : ""
/// picId : 0
/// picUrl : "http://p3.music.126.net/6y-UleORITEDbvrOLV0Q8A==/5639395138885805.jpg"
/// topicPerson : 0
/// trans : ""

class ResourceArtistBean {
  int? albumSize;
  String? briefDesc;
  int? id;
  int? img1v1Id;
  String? img1v1Url;
  int? musicSize;
  String? name;
  int? picId;
  String? picUrl;
  int? topicPerson;
  String? trans;

  ResourceArtistBean({
      this.albumSize, 
      this.briefDesc, 
      this.id, 
      this.img1v1Id, 
      this.img1v1Url, 
      this.musicSize, 
      this.name, 
      this.picId, 
      this.picUrl, 
      this.topicPerson, 
      this.trans});

  ResourceArtistBean.fromJson(dynamic json) {
    albumSize = json["albumSize"];
    briefDesc = json["briefDesc"];
    id = json["id"];
    img1v1Id = json["img1v1Id"];
    img1v1Url = json["img1v1Url"];
    musicSize = json["musicSize"];
    name = json["name"];
    picId = json["picId"];
    picUrl = json["picUrl"];
    topicPerson = json["topicPerson"];
    trans = json["trans"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["albumSize"] = albumSize;
    map["briefDesc"] = briefDesc;
    map["id"] = id;
    map["img1v1Id"] = img1v1Id;
    map["img1v1Url"] = img1v1Url;
    map["musicSize"] = musicSize;
    map["name"] = name;
    map["picId"] = picId;
    map["picUrl"] = picUrl;
    map["topicPerson"] = topicPerson;
    map["trans"] = trans;
    return map;
  }

}