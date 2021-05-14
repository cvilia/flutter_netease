/// country : "CN"
/// unionid : "oZoefuNHDq5RVlGRXpWV-y1n_H-U"
/// gender : 1
/// avatarUrl : "https://thirdwx.qlogo.cn/mmopen/vi_32/1dl8nNyia9bYWumYOT3QUSeC0MtKhp1q8XnT2dN00TA19ibBkDewKpmfpRA3weZhcM1vnPC6eXPC3Zo2G6NohVZw/132"
/// city : 100
/// openid : "okvmMjskZpSwcfoJmFzIkAWkigVM"
/// access_token : "44_pM5TRJ4fGg7UQLq0-hxRg9YcPW4zLuwittbQVDg-dWiveZH1c4fa90PUc8TVCjWOjiqObikvtV645-KGD6CJY3JWak1GDYPKlyFIaSxjHbM"
/// refresh_token : "44_kojLhUbDGVLpuFqxsU2Tg6uFopDysoy3cOl0DKm93y-bm44SS8NxfW7YD4kiOlDfPW_U76o-o3JSad_JhpLu71iC6ggWYFof5qRZ5OfHk7c"
/// uid : "oZoefuNHDq5RVlGRXpWV-y1n_H-U"
/// province : 0
/// scope : "snsapi_userinfo"
/// nickname : "姑酌彼兕觥"
/// followersCount : 0
/// expires_in : 7200
/// followingsCount : 0


///用户登录后返回的bindings字段中的tokenJsonStr字段信息，该字段为json字符串，在此解析一下
class WechatBind {
  String? country;
  String? unionid;
  int? gender;
  String? avatarUrl;
  int? city;
  String? openid;
  String? accessToken;
  String? refreshToken;
  String? uid;
  int? province;
  String? scope;
  String? nickname;
  int? followersCount;
  int? expiresIn;
  int? followingsCount;

  WechatBind({
      this.country, 
      this.unionid, 
      this.gender, 
      this.avatarUrl, 
      this.city, 
      this.openid, 
      this.accessToken, 
      this.refreshToken, 
      this.uid, 
      this.province, 
      this.scope, 
      this.nickname, 
      this.followersCount, 
      this.expiresIn, 
      this.followingsCount});

  WechatBind.fromJson(dynamic json) {
    country = json["country"];
    unionid = json["unionid"];
    gender = json["gender"];
    avatarUrl = json["avatarUrl"];
    city = json["city"];
    openid = json["openid"];
    accessToken = json["access_token"];
    refreshToken = json["refresh_token"];
    uid = json["uid"];
    province = json["province"];
    scope = json["scope"];
    nickname = json["nickname"];
    followersCount = json["followersCount"];
    expiresIn = json["expires_in"];
    followingsCount = json["followingsCount"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["country"] = country;
    map["unionid"] = unionid;
    map["gender"] = gender;
    map["avatarUrl"] = avatarUrl;
    map["city"] = city;
    map["openid"] = openid;
    map["access_token"] = accessToken;
    map["refresh_token"] = refreshToken;
    map["uid"] = uid;
    map["province"] = province;
    map["scope"] = scope;
    map["nickname"] = nickname;
    map["followersCount"] = followersCount;
    map["expires_in"] = expiresIn;
    map["followingsCount"] = followingsCount;
    return map;
  }

}