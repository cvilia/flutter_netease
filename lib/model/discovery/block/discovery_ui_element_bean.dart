/// image : {"imageUrl":"http://p1.music.126.net/AFf4zoGz_5E2Q6fc8KJsrQ==/109951165974688062.jpg"}
/// labelTexts : ["华语","流行","治愈"]
/// mainTitle : {"title":"嘿！你过上理想中的生活了么？"}
/// subTitle : {"title":"推荐歌单"}
/// button : {"action":"orpheus://playlistCollection?referLog=HOMEPAGE_BLOCK_PLAYLIST_RCMD","actionType":"orpheus","text":"更多"}

class DiscoveryUiElementBean {
  Image? image;
  List<String>? labelTexts;
  MainTitle? mainTitle;
  SubTitle? subTitle;
  Button? button;

  DiscoveryUiElementBean({
      this.image, 
      this.labelTexts, 
      this.mainTitle, 
      this.subTitle, 
      this.button});

  DiscoveryUiElementBean.fromJson(dynamic json) {
    image = json["image"] != null ? Image.fromJson(json["image"]) : null;
    labelTexts = json["labelTexts"] != null ? json["labelTexts"].cast<String>() : [];
    mainTitle = json["mainTitle"] != null ? MainTitle.fromJson(json["mainTitle"]) : null;
    subTitle = json["subTitle"] != null ? SubTitle.fromJson(json["subTitle"]) : null;
    button = json["button"] != null ? Button.fromJson(json["button"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (image != null) {
      map["image"] = image?.toJson();
    }
    map["labelTexts"] = labelTexts;
    if (mainTitle != null) {
      map["mainTitle"] = mainTitle?.toJson();
    }
    if (subTitle != null) {
      map["subTitle"] = subTitle?.toJson();
    }
    if (button != null) {
      map["button"] = button?.toJson();
    }
    return map;
  }

}

/// action : "orpheus://playlistCollection?referLog=HOMEPAGE_BLOCK_PLAYLIST_RCMD"
/// actionType : "orpheus"
/// text : "更多"

class Button {
  String? action;
  String? actionType;
  String? text;

  Button({
      this.action, 
      this.actionType, 
      this.text});

  Button.fromJson(dynamic json) {
    action = json["action"];
    actionType = json["actionType"];
    text = json["text"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["action"] = action;
    map["actionType"] = actionType;
    map["text"] = text;
    return map;
  }

}

/// title : "推荐歌单"

class SubTitle {
  String? title;

  SubTitle({
      this.title});

  SubTitle.fromJson(dynamic json) {
    title = json["title"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["title"] = title;
    return map;
  }

}

/// title : "嘿！你过上理想中的生活了么？"

class MainTitle {
  String? title;

  MainTitle({
      this.title});

  MainTitle.fromJson(dynamic json) {
    title = json["title"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["title"] = title;
    return map;
  }

}

/// imageUrl : "http://p1.music.126.net/AFf4zoGz_5E2Q6fc8KJsrQ==/109951165974688062.jpg"

class Image {
  String? imageUrl;

  Image({
      this.imageUrl});

  Image.fromJson(dynamic json) {
    imageUrl = json["imageUrl"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["imageUrl"] = imageUrl;
    return map;
  }

}