/// bindingTime : 1551079487559
/// tokenJsonStr : "{\"countrycode\":\"\",\"cellphone\":\"18510909453\",\"hasPassword\":true}"
/// expiresIn : 2147483647
/// expired : false
/// refreshTime : 1551079487
/// url : ""
/// userId : 122121024
/// id : 6808660939
/// type : 1
///用户登录接口返回数据中的[bindings]字段
class UserBindInfoBean {
  int? bindingTime;
  String? tokenJsonStr;
  int? expiresIn;
  bool? expired;
  int? refreshTime;
  String? url;
  int? userId;
  int? id;
  /// type类型 1=手机号 2=微博 5=QQ  10=w微信  16=网易邮箱
  int? type;

  UserBindInfoBean(
      {this.bindingTime,
      this.tokenJsonStr,
      this.expiresIn,
      this.expired,
      this.refreshTime,
      this.url,
      this.userId,
      this.id,
      this.type});

  UserBindInfoBean.fromJson(dynamic json) {
    bindingTime = json["bindingTime"];
    tokenJsonStr = json["tokenJsonStr"];
    expiresIn = json["expiresIn"];
    expired = json["expired"];
    refreshTime = json["refreshTime"];
    url = json["url"];
    userId = json["userId"];
    id = json["id"];
    type = json["type"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["bindingTime"] = bindingTime;
    map["tokenJsonStr"] = tokenJsonStr;
    map["expiresIn"] = expiresIn;
    map["expired"] = expired;
    map["refreshTime"] = refreshTime;
    map["url"] = url;
    map["userId"] = userId;
    map["id"] = id;
    map["type"] = type;
    return map;
  }
}
