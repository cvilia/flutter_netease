
import 'package:flutter_netease/model/user/user_account_bean.dart';
import 'package:flutter_netease/model/user/user_bind_info_bean.dart';
import 'package:flutter_netease/model/user/user_profile_bean.dart';

///用户登录实体类
class UserLoginBean {
  int? loginType;
  int? code;
  UserAccountBean? account;
  String? token;
  UserProfileBean? profile;
  List<UserBindInfoBean>? bindings;
  String? cookie;

  UserLoginBean(
      {this.loginType,
      this.code,
      this.account,
      this.token,
      this.profile,
      this.bindings,
      this.cookie});

  UserLoginBean.fromJson(dynamic json) {
    loginType = json['loginType'];
    code = json['code'];
    account = json['account'] == null
        ? null
        : UserAccountBean.fromJson(json['account']);
    token = json['token'];
    profile = json['profile'] == null
        ? null
        : UserProfileBean.fromJson(json['profile']);
    cookie = json['cookie'];

    if (json['bindings'] != null) {
      bindings = [];
      json['bindings']
          .forEach((v) => bindings?.add(UserBindInfoBean.fromJson(v)));
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['loginType'] = loginType;
    map['code'] = code;
    if (account != null) {
      map['account'] = account?.toJson();
    }
    map['token'] = token;
    if (profile != null) {
      map['profile'] = profile?.toJson();
    }

    if (bindings != null) {
      map['bindings'] = bindings?.map((e) => e.toJson()).toList();
    }
    return map;
  }
}
