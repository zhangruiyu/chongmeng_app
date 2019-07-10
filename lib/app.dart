import 'package:chongmeng/utils/jiguang_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_localizations/flutter_localizations.dart';

import 'constants/constants.dart';
import 'constants/page_constants.dart';
import 'function/auto/page.dart';
import 'function/bindtel/page.dart';
import 'function/main/community/commitmedia/page.dart';
import 'function/main/community/selecttalktype/page.dart';
import 'function/main/page.dart';
import 'function/pet/selectpetavatar/page.dart';
import 'function/pet/selectsubtype/page.dart';
import 'function/pet/selecttype/page.dart';
import 'function/record/page.dart';
import 'function/record/review/page.dart';
import 'function/setting/page.dart';
import 'function/splash/page.dart';
import 'function/tally/add/page.dart';
import 'function/tally/page.dart';
import 'function/webview/page.dart';
import 'global_store/state.dart';
import 'global_store/store.dart';
import 'helper/user_helper.dart';
import 'localizetion/localizations_delegate.dart';
import 'widget/no_scale_text_widget.dart';

Future<Widget> createApp() async {
  configProject();
  //初始化用户数据
  GlobalStore.store.getState().localUser = await UserHelper.initLocalUser();

  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'splash': SplashPage(),
      PageConstants.MainPage: MainPage(),
      PageConstants.AutoPage: AutoPage(),
      PageConstants.BindTelPage: BindTelPage(),
      PageConstants.RecordPage: RecordPage(),
      PageConstants.ReviewIVPage: ReviewIVPage(),
      PageConstants.SelectTalkTypePage: SelectTalkTypePage(),
      PageConstants.WebviewPage: WebviewPage(),
      PageConstants.SettingPage: SettingPage(),
      PageConstants.SelectTypePage: SelectTypePage(),
      PageConstants.CommitMediaPage: CommitMediaPage(),
      PageConstants.SelectSubTypePage: SelectSubTypePage(),
      PageConstants.SelectPetAvatarPage: SelectPetAvatarPage(),
      PageConstants.TallyPage: TallyPage(),
      PageConstants.AddTallyPage: AddTallyPage(),
    },
    visitor: (String path, Page<Object, dynamic> page) {
      /// XXX
      if (page.isTypeof<GlobalBaseState>()) {
        page.connectExtraStore<GlobalState>(GlobalStore.store,
            (Object pageState, GlobalState appState) {
          if (pageState is GlobalBaseState) {
            dynamic newPageState = pageState;
            if (newPageState.locale == appState.locale &&
                newPageState.localUser == appState.localUser) {
              return pageState;
            } else {
              return (newPageState.clone()
                ..locale = appState.locale
                ..localUser = appState.localUser);
            }
          } else {
            return pageState;
          }
        });
      }

      page.enhancer.append(
        viewMiddleware: <ViewMiddleware<dynamic>>[safetyView<dynamic>()],
        adapterMiddleware: <AdapterMiddleware<dynamic>>[
          safetyAdapter<dynamic>()
        ],
        effectMiddleware: [],
        middleware: <Middleware<dynamic>>[logMiddleware<dynamic>()],
      );

      // }
      ///updateMiddleware
      /// TODO
      // ..updateMiddleware(
      //   view: (List<ViewMiddleware<T>> viewMiddleware) {
      //     viewMiddleware.add(safetyView<T>());
      //   },
      //   adapter: (List<AdapterMiddleware<T>> adapterMiddleware) {
      //     adapterMiddleware.add(safetyAdapter<T>());
      //   },
      // )
    },
  );

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
