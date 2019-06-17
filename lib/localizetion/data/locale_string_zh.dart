import 'abstract_locale_string.dart';

class LocaleStringZh extends AbstractLocaleString {
  @override
  String splashSkip = '跳过';
  @override
  String loginHint = '欢迎';
  @override
  String loginSmsCode = '获取验证码';
  @override
  String loginTelHint = '输入您的手机号码';
  @override
  String loginCodeHint = '输入验证码';

  @override
  String inputSmsCode = '请输入收到的短信验证码';
  @override
  String inputTelNumber = '请输入您的手机号码';
  @override
  String inputTelRightNumber = '请确认您的手机号码输入正确';
  @override
  String inputSmsAllCode = '请输入完整的短信验证码';
  @override
  String inputRightSmsCode = '请输入正确的短信验证码';

  @override
  String get cash => "现金";

  @override
  String get installment => "分期";

  @override
  String get creditCard => "信用卡";

  @override
  String get loan => "贷款";

  @override
  String get interest => "利息";

  @override
  String get day => "日";

  @override
  String get laid_time => "放款时效";

  @override
  String get apply => "申请";

  @override
  String get money_unit => 'Rp';

  @override
  String get monthly_interest => '每月利息';

  @override
  String get cost_year => '成本/年';

  @override
  String get submit => '提交';

  @override
  String get order => "我的订单";//'我的订单',
  @override
  String get qa => "帮助问答";//'帮助问答',
  @override
  String get setting => "设置";//'设置',
  @override
  String get about_us => "关于我们";//'关于我们',
  @override
  String get call_service => "致电服务";//'致电服务',
  @override
  String get working_hours => "工作时间";//'工作时间',
  @override
  String get account => "我的";//'我的'
}
