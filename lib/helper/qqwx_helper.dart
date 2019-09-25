import 'package:chongmeng/constants/constants.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

class QQWXHelper {
  static void init() {
    fluwx.register(appId: WXKey, universalLink: "");
  }

  static void pay() {
    fluwx.pay(
        appId: WXKey,
        partnerId: '1900000109',
        prepayId: '1101000000140415649af9fc314aa427',
        packageValue: 'Sign=WXPay',
        nonceStr: '1101000000140429eb40476f8896f4c9',
        timeStamp: 1398746574,
        sign: '7FFECB600D7157C5AA49810D2D8F28BC2811827B',
        signType: '选填',
        extData: '选填');
  }
}
