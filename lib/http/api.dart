class Api {
  static const String SERVER = 'http://121.89.204.40:3000';

  static const String LOGIN_BY_PHONE = '/login/cellphone';
  static const String LOGIN_BY_MAIL = '/login';
  static const String DISCOVER_BANNER = '/banner'; //type 1=android
  static const String MY_USER_DETAIL = '/user/detail'; //uid

  ///music
  static const String GET_MUSIC_URL = '/song/url'; //获取音乐url 必选参数 id，可选参数br，码率
}
