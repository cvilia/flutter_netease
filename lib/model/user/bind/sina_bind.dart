/// uid : "7486384296"
/// access_token : "2.00oXGeKI0Gg461242276a345IkePEC"
/// id : 7486384296
/// idstr : "7486384296"
/// name : "宇哥观北京"
/// province : "11"
/// city : "1000"
/// location : "北京"
/// url : ""
/// profile_image_url : "https://tvax1.sinaimg.cn/crop.362.244.824.824.50/008aE6xOly8gij22zjkzxj31580tttc7.jpg?KID=imgbed,tva&Expires=1606305857&ssig=uWpC8vXOAx"
/// profile_url : "u/7486384296"
/// gender : "m"
/// verified : false
/// avatar_large : "https://tvax1.sinaimg.cn/crop.362.244.824.824.180/008aE6xOly8gij22zjkzxj31580tttc7.jpg?KID=imgbed,tva&Expires=1606305857&ssig=O%2B3kkc%2FTRN"
/// avatar_hd : "https://tvax1.sinaimg.cn/crop.362.244.824.824.1024/008aE6xOly8gij22zjkzxj31580tttc7.jpg?KID=imgbed,tva&Expires=1606305857&ssig=omLunOes0m"

///用户登录后返回的bindings字段中的tokenJsonStr字段信息，该字段为json字符串，在此解析一下
///此为新浪
class SinaBind {
  String? uid;
  String? accessToken;
  int? id;
  String? idstr;
  String? name;
  String? province;
  String? city;
  String? location;
  String? url;
  String? profileImageUrl;
  String? profileUrl;
  String? gender;
  bool? verified;
  String? avatarLarge;
  String? avatarHd;

  SinaBind(
      {this.uid,
      this.accessToken,
      this.id,
      this.idstr,
      this.name,
      this.province,
      this.city,
      this.location,
      this.url,
      this.profileImageUrl,
      this.profileUrl,
      this.gender,
      this.verified,
      this.avatarLarge,
      this.avatarHd});

  SinaBind.fromJson(dynamic json) {
    uid = json["uid"];
    accessToken = json["access_token"];
    id = json["id"];
    idstr = json["idstr"];
    name = json["name"];
    province = json["province"];
    city = json["city"];
    location = json["location"];
    url = json["url"];
    profileImageUrl = json["profile_image_url"];
    profileUrl = json["profile_url"];
    gender = json["gender"];
    verified = json["verified"];
    avatarLarge = json["avatar_large"];
    avatarHd = json["avatar_hd"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["uid"] = uid;
    map["access_token"] = accessToken;
    map["id"] = id;
    map["idstr"] = idstr;
    map["name"] = name;
    map["province"] = province;
    map["city"] = city;
    map["location"] = location;
    map["url"] = url;
    map["profile_image_url"] = profileImageUrl;
    map["profile_url"] = profileUrl;
    map["gender"] = gender;
    map["verified"] = verified;
    map["avatar_large"] = avatarLarge;
    map["avatar_hd"] = avatarHd;
    return map;
  }
}
