/// name : 12

class Test {
  int name;

  Test({
      this.name});

  Test.fromJson(dynamic json) {
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = name;
    return map;
  }

}