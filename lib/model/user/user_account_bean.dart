/// id : 122121024
/// userName : "1_18510909453"
/// type : 1
/// status : 0
/// whitelistAuthority : 0
/// createTime : 1452370506953
/// salt : "[B@7c3e3a1e"
/// tokenVersion : 2
/// ban : 0
/// baoyueVersion : 0
/// donateVersion : 0
/// vipType : 0
/// viptypeVersion : 0
/// anonimousUser : false

///用户登录接口返回数据中的[account]字段
class UserAccountBean {
  int? id;
  String? userName;
  int? type;
  int? status;
  int? whitelistAuthority;
  int? createTime;
  String? salt;
  int? tokenVersion;
  int? ban;
  int? baoyueVersion;
  int? donateVersion;
  int? vipType;
  int? viptypeVersion;
  bool? anonimousUser;

  UserAccountBean({
      this.id, 
      this.userName, 
      this.type, 
      this.status, 
      this.whitelistAuthority, 
      this.createTime, 
      this.salt, 
      this.tokenVersion, 
      this.ban, 
      this.baoyueVersion, 
      this.donateVersion, 
      this.vipType, 
      this.viptypeVersion, 
      this.anonimousUser});

  UserAccountBean.fromJson(dynamic json) {
    id = json["id"];
    userName = json["userName"];
    type = json["type"];
    status = json["status"];
    whitelistAuthority = json["whitelistAuthority"];
    createTime = json["createTime"];
    salt = json["salt"];
    tokenVersion = json["tokenVersion"];
    ban = json["ban"];
    baoyueVersion = json["baoyueVersion"];
    donateVersion = json["donateVersion"];
    vipType = json["vipType"];
    viptypeVersion = json["viptypeVersion"];
    anonimousUser = json["anonimousUser"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["userName"] = userName;
    map["type"] = type;
    map["status"] = status;
    map["whitelistAuthority"] = whitelistAuthority;
    map["createTime"] = createTime;
    map["salt"] = salt;
    map["tokenVersion"] = tokenVersion;
    map["ban"] = ban;
    map["baoyueVersion"] = baoyueVersion;
    map["donateVersion"] = donateVersion;
    map["vipType"] = vipType;
    map["viptypeVersion"] = viptypeVersion;
    map["anonimousUser"] = anonimousUser;
    return map;
  }

}