/// access_token : "7E6A8E7358E91006D84D1D5D44E71974"
/// unionid : "UID_B0CB102A005FEEDA02B4A640A97DDABD"
/// openid : "1AD92372FDFEC74AC8C0AC34FCB64213"
/// nickname : "麻辣炖土豆儿"
/// partnerType : "0"
/// expires_in : 7776000

///用户登录后返回的bindings字段中的tokenJsonStr字段信息，该字段为json字符串，在此解析一下
class QQBind {
  String? accessToken;
  String? unionid;
  String? openid;
  String? nickname;
  String? partnerType;
  int? expiresIn;

  QQBind({
      this.accessToken, 
      this.unionid, 
      this.openid, 
      this.nickname, 
      this.partnerType, 
      this.expiresIn});

  QQBind.fromJson(dynamic json) {
    accessToken = json["access_token"];
    unionid = json["unionid"];
    openid = json["openid"];
    nickname = json["nickname"];
    partnerType = json["partnerType"];
    expiresIn = json["expires_in"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["access_token"] = accessToken;
    map["unionid"] = unionid;
    map["openid"] = openid;
    map["nickname"] = nickname;
    map["partnerType"] = partnerType;
    map["expires_in"] = expiresIn;
    return map;
  }

}
