import 'resource_artist_bean.dart';
import 'resource_song_data_bean.dart';

class ResourceExtInfoBean {
  List<ResourceArtistBean>? artists;
  ResourceSongDataBean? songData;
  bool? highQuality;
  String? playCount;

  ResourceExtInfoBean({this.artists, this.songData, this.playCount, this.highQuality});

  ResourceExtInfoBean.fromJson(dynamic json) {
    if (json["artists"] != null) {
      artists = [];
      json["artists"].forEach((v) {
        artists?.add(ResourceArtistBean.fromJson(v));
      });
    }
    playCount = json["playCount"] is String ? json["playCount"] : json["playCount"].toString();
    highQuality = json["highQuality"];

    songData = json["songData"] != null ? ResourceSongDataBean.fromJson(json["songData"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (songData != null) {
      map["songData"] = songData?.toJson();
    }
    if (artists != null) {
      map["artists"] = artists?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
