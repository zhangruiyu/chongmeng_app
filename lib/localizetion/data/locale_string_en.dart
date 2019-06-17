import 'abstract_locale_string.dart';

class LocaleStringEn extends AbstractLocaleString {
  @override
  String splashSkip = ' skip';
  @override
  String loginHint = 'Welcome';
  @override
  String loginSmsCode = 'captcha code';
  @override
  String loginTelHint = 'Enter your phone number';
  @override
  String loginCodeHint = 'Input Verification Code';

  @override
  String inputSmsCode = 'Please enter the SMS verification code you received';
  @override
  String inputTelNumber = 'Please enter your phone number';
  @override
  String inputTelRightNumber =
      'Please confirm that your mobile number is entered correctly';
  @override
  String inputSmsAllCode = 'Please enter the full SMS verification code';
  @override
  String inputRightSmsCode = 'Please enter the correct SMS verification code';

  @override
  String get cash => "Cash";

  @override
  String get installment => "Installment";

  @override
  String get creditCard => "Credit_card";

  @override
  String get loan => "Loan";

  @override
  String get interest => "Interest";

  @override
  String get day => "day";

  @override
  String get laid_time => "laid time";

  @override
  String get apply => "Apply";

  @override
  String get money_unit => 'Rp';

  @override
  String get monthly_interest => 'monthly interest';

  @override
  String get cost_year => 'cost / year';

  @override
  String get submit => 'submit';

  @override
  String get order => "Order";//'我的订单',
  @override
  String get qa => "Q&A";//'帮助问答',
  @override
  String get setting => "Setting";//'设置',
  @override
  String get about_us => "About us";//'关于我们',
  @override
  String get call_service => "Call service";//'致电服务',
  @override
  String get working_hours => "Working hours";//'工作时间',
  @override
  String get account => "Account";//'我的'
}
