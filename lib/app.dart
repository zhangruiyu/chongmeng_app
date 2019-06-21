import 'package:chongmeng/utils/jiguang_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'constants/constants.dart';
import 'constants/page_constants.dart';
import 'function/auto/page.dart';
import 'function/main/page.dart';
import 'function/splash/page.dart';
import 'global_store/store.dart';
import 'localizetion/localizations_delegate.dart';
import 'widget/no_scale_text_widget.dart';

//create global page helper
Page<T, dynamic> pageConfiguration<T extends Cloneable<T>>(
    Page<T, dynamic> page) {
  return page
/*
    ///connect with app-store
    ..connectExtraStore(GlobalStore.store, (T pagestate, GlobalState appState) {
      return pagestate.locale == appState.locale
          ? pagestate
          : ((pagestate.clone())..locale = appState.locale);
    })*/

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

Widget createApp() {
  JiguangUtils.init();
  final AbstractRoutes routes = HybridRoutes(routes: <AbstractRoutes>[
    PageRoutes(
      pages: <String, Page<Object, dynamic>>{
        'splash': pageConfiguration(SplashPage()),
        PageConstants.MainPage: pageConfiguration(MainPage()),
        PageConstants.AutoPage: pageConfiguration(AutoPage()),
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
        primaryColor: Colors.amberAccent,
        accentColor: Color(0xffED594A),
        dividerColor: colorf3f3f3),
    home: routes.buildPage('splash', null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
    builder: (context, widget) {
      return NoScaleTextWidget(
        child: widget,
      );
    },
  );
}
