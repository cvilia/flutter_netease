/// pageConfig : {"abtest":["homepage-v7.3","homepage-v7.4","hp-list2-v2","sunny-vip-rpc2","fm-hp7-all2","fm-hp7-all","daily-flow2","daily-health2","mp-mgc-new","list-reason-new","list-cover-new","sunny-playlist2","mgc-sunny2","playlist-rank","hp-dailyrec","HP-alg-apollo","playlist-page","hp-title-3","mp-vip-playlist","hp-calendar-3","server-op-sunny","mp-mgc-new2","newuserevent1","hp-yunquan-1","yunbei-all-test","radar-yuncun","hy-enhance","hp-mod-sort-v1","alg-hp7-t1","scene-playlist","mp-radar","alg-list-square","hy-playlist-rk","alg-hp7-t2","hy-mgc-radar","total-intent","mgc-square","FH-style-flow","mgc-mystery","style-rec-flow","mp-filter","mgc-list","mgc-artist","mgc-time","mgc-newsong","mgc-tail","mgc-new-tail-test","hp-shiping","hp-mgc","hp-alg","lr-list-rank","fm-ranker-ctl","mp-child-list","vs-hp-recall","mp-child-list2","mp-mgc-college","mp-mgc-scene","mp-newuser-rank","mp-minor-lan","vs-hp-long-term","style-newuser","hp-mod-sort-v2","style-newsong","mp-force-list"],"fullscreen":false,"homepageMode":"RCMD_MODE","nodataToast":"到底啦~","refreshInterval":600000,"refreshToast":"","showModeEntry":true,"songLabelMarkLimit":1,"songLabelMarkPriority":["trial","vip","exclusive","sq","pre_sale"]}

class DiscoveryPageConfigBean {
  PageConfig? pageConfig;

  DiscoveryPageConfigBean({
      this.pageConfig});

  DiscoveryPageConfigBean.fromJson(dynamic json) {
    pageConfig = json["pageConfig"] != null ? PageConfig.fromJson(json["pageConfig"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (pageConfig != null) {
      map["pageConfig"] = pageConfig?.toJson();
    }
    return map;
  }
}

/// abtest : ["homepage-v7.3","homepage-v7.4","hp-list2-v2","sunny-vip-rpc2","fm-hp7-all2","fm-hp7-all","daily-flow2","daily-health2","mp-mgc-new","list-reason-new","list-cover-new","sunny-playlist2","mgc-sunny2","playlist-rank","hp-dailyrec","HP-alg-apollo","playlist-page","hp-title-3","mp-vip-playlist","hp-calendar-3","server-op-sunny","mp-mgc-new2","newuserevent1","hp-yunquan-1","yunbei-all-test","radar-yuncun","hy-enhance","hp-mod-sort-v1","alg-hp7-t1","scene-playlist","mp-radar","alg-list-square","hy-playlist-rk","alg-hp7-t2","hy-mgc-radar","total-intent","mgc-square","FH-style-flow","mgc-mystery","style-rec-flow","mp-filter","mgc-list","mgc-artist","mgc-time","mgc-newsong","mgc-tail","mgc-new-tail-test","hp-shiping","hp-mgc","hp-alg","lr-list-rank","fm-ranker-ctl","mp-child-list","vs-hp-recall","mp-child-list2","mp-mgc-college","mp-mgc-scene","mp-newuser-rank","mp-minor-lan","vs-hp-long-term","style-newuser","hp-mod-sort-v2","style-newsong","mp-force-list"]
/// fullscreen : false
/// homepageMode : "RCMD_MODE"
/// nodataToast : "到底啦~"
/// refreshInterval : 600000
/// refreshToast : ""
/// showModeEntry : true
/// songLabelMarkLimit : 1
/// songLabelMarkPriority : ["trial","vip","exclusive","sq","pre_sale"]

class PageConfig {
  bool? fullscreen;
  String? homepageMode;
  String? nodataToast;
  int? refreshInterval;
  String? refreshToast;
  bool? showModeEntry;
  int? songLabelMarkLimit;

  PageConfig({
      this.fullscreen, 
      this.homepageMode, 
      this.nodataToast, 
      this.refreshInterval, 
      this.refreshToast, 
      this.showModeEntry, 
      this.songLabelMarkLimit});

  PageConfig.fromJson(dynamic json) {
    fullscreen = json["fullscreen"];
    homepageMode = json["homepageMode"];
    nodataToast = json["nodataToast"];
    refreshInterval = json["refreshInterval"];
    refreshToast = json["refreshToast"];
    showModeEntry = json["showModeEntry"];
    songLabelMarkLimit = json["songLabelMarkLimit"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["fullscreen"] = fullscreen;
    map["homepageMode"] = homepageMode;
    map["nodataToast"] = nodataToast;
    map["refreshInterval"] = refreshInterval;
    map["refreshToast"] = refreshToast;
    map["showModeEntry"] = showModeEntry;
    map["songLabelMarkLimit"] = songLabelMarkLimit;
    return map;
  }

}