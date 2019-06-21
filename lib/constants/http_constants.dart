import 'constants.dart';

class HttpConstants {
  //  static final String BaseUrl = "http://192.168.1.76:8080/";
//  static final String BaseUrl = "https://api.mustbe.xyz/";
//  static final String BaseStaticUrl = "https://app.mustbe.xyz/";
  static final String BaseUrl =
      isOnline ? "http://api.mustbe.xyz/" : "http://192.168.1.49:8080/";
  static final String BaseStaticUrl =
      isOnline ? "https://app.mustbe.xyz/" : "http://47.95.206.76:8008/";

  static final String SendCode = "app/user/sendLoginCode"; //发送验证码
  static final String LoginAndRegister = "app/user/loginAndRegister";
  static final String HomeIndex = "app/home/index";
}
