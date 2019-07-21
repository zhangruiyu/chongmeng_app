import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/jiguang_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_localizations/flutter_localizations.dart';

import 'constants/constants.dart';
import 'constants/page_constants.dart';
import 'global_store/store.dart';
import 'helper/user_helper.dart';
import 'localizetion/localizations_delegate.dart';
import 'widget/no_scale_text_widget.dart';

Future<Widget> createApp() async {
  configProject();
  //初始化用户数据
  GlobalStore.store.getState().localUser = await UserHelper.initLocalUser();

  return MaterialApp(
    debugShowCheckedModeBanner: false,
    locale: GlobalStore.store.getState().locale,
    onGenerateTitle: (BuildContext context) {
      return DefaultLocalizations.of(context).appName;
    },
    localizationsDelegates: [
      // ... app-specific localization delegate[s] here
      const DefaultLocalizationsDelegate(),
      DefaultCupertinoLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('zh', ''),
      const Locale('en', ''),
      // ... other locales the app supports
    ],
//    theme: themeProvide.themeData,
    theme: ThemeData(
        primaryColor: Colors.amberAccent[200],
        accentColor: Colors.amberAccent[200],
        dividerColor: colorE4E4E4),
    home: routes.buildPage(PageConstants.SplashPage, null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(
          builder: (BuildContext context) {
            return routes.buildPage(settings.name, settings.arguments);
          },
          settings: RouteSettings(name: settings.name));
    },
    builder: (context, widget) {
      return NoScaleTextWidget(
        child: widget,
      );
    },
  );
}

void configProject() {
  JiguangUtils.init();
}
