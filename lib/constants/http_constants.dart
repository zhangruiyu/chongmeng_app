import 'constants.dart';

class HttpConstants {
  //  static final String BaseUrl = "http://192.168.1.76:8080/";
//  static final String BaseUrl = "https://api.mustbe.xyz/";
//  static final String BaseStaticUrl = "https://app.mustbe.xyz/";
  static final String BaseUrl =
      isOnline ? "http://123.207.154.134:8080/" : "http://192.168.1.4:8080/";

  static final String SendCode = "app/auth/sendLoginCode"; //发送验证码
  static final String SendThirdLoginCode =
      "app/auth/sendThirdLoginCode"; //发送验证码
  static final String LoginAndRegister = "app/auth/loginAndRegister";
  static final String PetType = "app/pet/type";
  static final String PetSubType = "app/pet/subType";
  static final String AddPet = "app/pet/common/addPet";
  static final String CommitDynamic = "app/dynamic/common/commitDynamic";
  static final String DynamicLiked = "app/dynamic/common/dynamic/liked";
  static final String DynamicList = "app/dynamic/dynamic/list";
  static final String ThirdLoginAndRegister = "app/auth/thirdLoginAndRegister";
  static final String HomeIndex = "app/main/home/index";
  static final String AccountIndex = "app/main/common/account/index";
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

  static String get IntegralCommodityList =>
      "app/store/integralCommodityList"; //积分商城列表

  static String get BuyIntegralCommodity =>
      "app/store/common/buyIntegralCommodity"; //

  static String get IntegralOrderList =>
      "app/store/common/integralOrderList"; //兑换订单

  static String get AliSearch => "app/ali/search"; //淘宝客搜索
  static String get RecipeList => "app/recipe/list"; //食谱
  static String get AdoptionAdd => "/app/adoption/common/add"; //添加领养
  static String get AdoptionList => "/app/adoption/list"; //领养列表
  static String get PetList => "/app/pet/common/petList"; //当前用户宠物列表
}

class CosType {
  static const PIC_TYPE = 0;
  static const VIDEO_TYPE = 1;
  static const AVATAR_TYPE = 2;
  static const Pet_AVATAR_TYPE = 3;
  static const Tally_TYPE = 4;
  static const Adoption_TYPE = 5;
}
