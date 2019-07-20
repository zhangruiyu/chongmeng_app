import 'constants.dart';

class HttpConstants {
  //  static final String BaseUrl = "http://192.168.1.76:8080/";
//  static final String BaseUrl = "https://api.mustbe.xyz/";
//  static final String BaseStaticUrl = "https://app.mustbe.xyz/";
  static final String BaseUrl =
      isOnline ? "http://api.mustbe.xyz/" : "http://192.168.6.211:8080/";
  static final String BaseStaticUrl =
      isOnline ? "https://app.mustbe.xyz/" : "http://47.95.206.76:8008/";

  static final String SendCode = "app/auth/sendLoginCode"; //发送验证码
  static final String SendThirdLoginCode =
      "app/auth/sendThirdLoginCode"; //发送验证码
  static final String LoginAndRegister = "app/auth/loginAndRegister";
  static final String PetType = "app/pet/type";
  static final String PetSubType = "app/pet/subType";
  static final String AddPet = "app/pet/common/addPet";
  static final String CommitDynamic = "app/dynamic/common/commitDynamic";
  static final String DynamicList = "app/dynamic/dynamic/list";
  static final String ThirdLoginAndRegister =
      "app/auth/common/thirdLoginAndRegister";
  static final String HomeIndex = "app/auth/home/index";
  static final String PeriodEffectiveSign =
      "app/cos/common/periodEffectiveSign";

  static String get AddTally => "app/tally/common/add/tally";

  static String get TallyTags => "app/tally/common/tags";

  static String get CurrentAllTally => "app/tally/common/currentAllTally";

  //签到
  static String get SignList => "app/sign/common/signList";

  static String get Sign => "app/sign/common/sign";

  //积分
  static String get IntegralList => "app/integral/common/integralList";

  static String get TotalIntegral => "app/integral/common/totalIntegral";

  //商城
  static String get AddAddress => "app/store/common/addAddress";
  static String get AddressList => "app/store/common/addressList";
}

class CosType {
  static const PIC_TYPE = 0;
  static const VIDEO_TYPE = 1;
  static const AVATAR_TYPE = 2;
  static const Pet_AVATAR_TYPE = 3;
  static const Tally_TYPE = 4;
}
