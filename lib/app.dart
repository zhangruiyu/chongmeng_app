import 'package:chongmeng/utils/jiguang_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'constants/constants.dart';
import 'constants/page_constants.dart';
import 'function/auto/page.dart';
import 'function/bindtel/page.dart';
import 'function/main/community/commitmedia/page.dart';
import 'function/main/community/selecttalktype/page.dart';
import 'function/main/page.dart';
import 'function/record/page.dart';
import 'function/record/review/page.dart';
import 'function/setting/page.dart';
import 'function/splash/page.dart';
import 'global_store/state.dart';
import 'global_store/store.dart';
import 'helper/user_helper.dart';
import 'localizetion/localizations_delegate.dart';
import 'widget/no_scale_text_widget.dart';

//create global page helper
Page<T, dynamic> pageConfiguration<T extends Cloneable<T>>(
    Page<T, dynamic> page) {
  return page

    ///connect with app-store
    ..connectExtraStore(GlobalStore.store, (T pageState, GlobalState appState) {
      if (pageState is GlobalBaseState) {
        dynamic newPageState = pageState as GlobalBaseState;
        if (newPageState.locale == appState.locale &&
            newPageState.localUser == appState.localUser) {
          return pageState;
        } else {
          return (newPageState.clone()
            ..locale = appState.locale
            ..localUser = appState.localUser) as T;
        }
      } else {
        return pageState;
      }
    })

    ///updateMiddleware
    ..updateMiddleware(
      view: (List<ViewMiddleware<T>> viewMiddleware) {
        viewMiddleware.add(safetyView<T>());
      },
      adapter: (List<AdapterMiddleware<T>> adapterMiddleware) {
        adapterMiddleware.add(safetyAdapter<T>());
      },
      dispatch: (List<Middleware<T>> middleware) {
        middleware.add(logMiddleware());
      },
    );
}

Future<Widget> createApp() async {
  configProject();
  //初始化用户数据
  GlobalStore.store.getState().localUser = await UserHelper.initLocalUser();
  final AbstractRoutes routes = HybridRoutes(routes: <AbstractRoutes>[
    PageRoutes(
      pages: <String, Page<Object, dynamic>>{
        'splash': pageConfiguration(SplashPage()),
        PageConstants.MainPage: pageConfiguration(MainPage()),
        PageConstants.AutoPage: pageConfiguration(AutoPage()),
        PageConstants.BindTelPage: pageConfiguration(BindTelPage()),
        PageConstants.RecordPage: pageConfiguration(RecordPage()),
        PageConstants.ReviewIVPage: pageConfiguration(ReviewIVPage()),
        PageConstants.SelectTalkTypePage:
            pageConfiguration(SelectTalkTypePage()),
        PageConstants.SettingPage: pageConfiguration(SettingPage()),
      },
    ),
  ]);

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
    home: routes.buildPage('splash', null),
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
