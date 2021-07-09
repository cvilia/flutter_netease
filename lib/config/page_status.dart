///页面的状态
enum PageStatus {
  ///加载中
  LOADING,

  ///空页面
  EMPTY,

  ///页面加载完成
  OK,

  ///网络错误
  NETWORK_ERROR,

  ///服务器错误
  SERVER_ERROR,

  ///未登录 or 无效登录
  INVALID_LOGIN
}
