import 'constants.dart';

class HttpConstants {
  //  static final String BaseUrl = "http://192.168.1.76:8080/";
//  static final String BaseUrl = "https://api.mustbe.xyz/";
//  static final String BaseStaticUrl = "https://app.mustbe.xyz/";
  static final String BaseUrl =
      isOnline ? "https://api.mustbe.xyz/" : "http://47.95.206.76:8008/";
  static final String BaseStaticUrl =
      isOnline ? "https://app.mustbe.xyz/" : "http://47.95.206.76:8008/";

  static final String LoginAccount = "user/loginaccount"; //账号登录
  static final String LoginPhone = "user/loginphone"; //手机号快捷登录

  static final String SendCode = "sms/sendcode"; //发送验证码
  static final String ForgetPwd = "user/forgetpassword"; //忘记密码

  static final String JoinProduct = "product/userjoinproduct"; //统计浏览信息
  static final String GetUserInfo = "user/getuserinfo"; //获取用户信息
  static final String ActivityUrl = "sysconstant/myActivityUrl"; //账户页面的图片
  static final String GetSwitch = "sysconstant/getSwitch"; //跳转h5还是原生
  static final String Flashlogin = "user/flashlogin"; //闪验登录

  static final String GetTodayPush = "product/getappproductmodel"; //获取今日主推
  static final String getAppCreaditProduct =
      "creditProduct/getAppCreaditProduct"; //信用卡
  static final String GetAllBorrowing = "/product/getProductList"; //获取全部借款
  static final String LoginOut = "user/logout"; //登出
  static final String HomeNotices = "sysnotice/getsysnotices"; //公告列表
  static final String UpdateApp = "sysconstant/getInfo"; //更新
  static final String PutDeviceInfo = "/device/putDeviceInfo"; //添加设备信息
  static final String AuthInfo = "/auth/realinfo"; //实名

  // --- H5 ---
  static final String NoticeDetail = BaseStaticUrl + "notice/"; //小喇叭详情
  static final String InviteFriends = BaseStaticUrl + "profile/toinvite"; //邀请
  static final String Question = BaseStaticUrl + "profile/qa"; //常见问题
  static final String AboutAs = BaseStaticUrl + "profile/about"; //关于我们
  static final String userInfo = BaseStaticUrl + "profile/info";
  static final String order = BaseStaticUrl + "order";
  static final String InviteFriendShare =
      BaseStaticUrl + "user/invite/"; //邀请好友分享
  static final String DownLoad = BaseStaticUrl + "user/go2download"; //分享下载
  //印尼
  static final String ProductList = "product/list"; //分享下载
  static final String HomeDetail = "index/gethomeIndex"; //获取首页信息
}
