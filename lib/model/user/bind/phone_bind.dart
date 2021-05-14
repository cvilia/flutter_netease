/// countrycode : ""
/// cellphone : "18510909453"
/// hasPassword : true

///用户登录后返回的bindings字段中的tokenJsonStr字段信息，该字段为json字符串，在此解析一下
///
/// 需要注意的是邮箱的绑定接口返回不明确，所以不再解析
class PhoneBind {
  String? countrycode;
  String? cellphone;
  bool? hasPassword;

  PhoneBind({this.countrycode, this.cellphone, this.hasPassword});

  PhoneBind.fromJson(dynamic json) {
    countrycode = json["countrycode"];
    cellphone = json["cellphone"];
    hasPassword = json["hasPassword"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["countrycode"] = countrycode;
    map["cellphone"] = cellphone;
    map["hasPassword"] = hasPassword;
    return map;
  }
}
