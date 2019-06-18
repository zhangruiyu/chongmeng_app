import 'package:chongmeng/constants/constants.dart';
import 'package:janalytics/janalytics.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';

JmessageFlutter JMessage = JmessageFlutter();

class JiguangUtils {
  static Janalytics janalytics = new Janalytics();
  static JPush jpush = new JPush();

  static init() {
    janalytics.setup(
      appKey: "5273001af03971f6b56827d1",
      channel: "theChannel",
    );
    janalytics.setDebugMode(!isRelease);
    if (isRelease) {
      janalytics.initCrashHandler();
    }
    jpush.setup(
      appKey: "5273001af03971f6b56827d1",
      channel: "theChannel",
      production: isRelease,
      debug: !isRelease, // 设置是否打印 debug 日志
    );
    jpush.addEventHandler(
      // 接收通知回调方法。
      onReceiveNotification: (Map<String, dynamic> message) async {
        print("flutter onReceiveNotification: $message");
      },
      // 点击通知回调方法。
      onOpenNotification: (Map<String, dynamic> message) async {
        print("flutter onOpenNotification: $message");
      },
      // 接收自定义消息回调方法。
      onReceiveMessage: (Map<String, dynamic> message) async {
        print("flutter onReceiveMessage: $message");
      },
//      jpush.getRegistrationID().then((rid) { });
    );
    jpush.applyPushAuthority(
        new NotificationSettingsIOS(sound: true, alert: true, badge: true));
  }
}
