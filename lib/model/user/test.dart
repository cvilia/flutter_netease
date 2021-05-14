/// tst : [{"bindingTime":1551079487559,"url":"","userId":122121024,"expired":false,"expiresIn":2147483647,"tokenJsonStr":"","refreshTime":1551079487,"id":6808660939,"type":1},{"bindingTime":1551079487559,"url":"","userId":122121024,"expired":false,"expiresIn":2147483647,"tokenJsonStr":"","refreshTime":1551079487,"id":6808660939,"type":1}]

class Test {
  List<Tst>? tst;

  Test({
      this.tst});

  Test.fromJson(dynamic json) {
    if (json["tst"] != null) {
      tst = [];
      json["tst"].forEach((v) {
        tst?.add(Tst.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (tst != null) {
      map["tst"] = tst?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// bindingTime : 1551079487559
/// url : ""
/// userId : 122121024
/// expired : false
/// expiresIn : 2147483647
/// tokenJsonStr : ""
/// refreshTime : 1551079487
/// id : 6808660939
/// type : 1

class Tst {
  int? bindingTime;
  String? url;
  int? userId;
  bool? expired;
  int? expiresIn;
  String? tokenJsonStr;
  int? refreshTime;
  int? id;
  int? type;

  Tst({
      this.bindingTime, 
      this.url, 
      this.userId, 
      this.expired, 
      this.expiresIn, 
      this.tokenJsonStr, 
      this.refreshTime, 
      this.id, 
      this.type});

  Tst.fromJson(dynamic json) {
    bindingTime = json["bindingTime"];
    url = json["url"];
    userId = json["userId"];
    expired = json["expired"];
    expiresIn = json["expiresIn"];
    tokenJsonStr = json["tokenJsonStr"];
    refreshTime = json["refreshTime"];
    id = json["id"];
    type = json["type"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["bindingTime"] = bindingTime;
    map["url"] = url;
    map["userId"] = userId;
    map["expired"] = expired;
    map["expiresIn"] = expiresIn;
    map["tokenJsonStr"] = tokenJsonStr;
    map["refreshTime"] = refreshTime;
    map["id"] = id;
    map["type"] = type;
    return map;
  }

}