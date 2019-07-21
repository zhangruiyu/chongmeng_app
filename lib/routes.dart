import 'package:chongmeng/function/signin/signinresult/page.dart';
import 'package:fish_redux/fish_redux.dart';

import 'constants/page_constants.dart';
import 'function/auto/page.dart';
import 'function/bindtel/page.dart';
import 'function/integral/record/page.dart';
import 'function/main/community/commit_media/page.dart';
import 'function/main/community/selecttalktype/page.dart';
import 'function/main/my_order/page.dart';
import 'function/main/page.dart';
import 'function/main/store/integral_commodity_detail/page.dart';
import 'function/pet/selectpetavatar/page.dart';
import 'function/pet/selectsubtype/page.dart';
import 'function/pet/selecttype/page.dart';
import 'function/record/page.dart';
import 'function/record/review/page.dart';
import 'function/setting/page.dart';
import 'function/shipping_address/page.dart';
import 'function/shipping_address/shipping_address_add/page.dart';
import 'function/signin/page.dart';
import 'function/splash/page.dart';
import 'function/tally/add/page.dart';
import 'function/tally/page.dart';
import 'function/webview/page.dart';
import 'global_store/state.dart';
import 'global_store/store.dart';

final AbstractRoutes routes = PageRoutes(
  pages: <String, Page<Object, dynamic>>{
    PageConstants.SplashPage: SplashPage(),
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
    PageConstants.SignInPage: SignInPage(),
    PageConstants.SignInResultDialog: SignInResultDialogPage(),
    PageConstants.IntegralRecordPage: IntegralRecordPage(),
    PageConstants.IntegralCommodityDetailPage: IntegralCommodityDetailPage(),
    PageConstants.ShippingAddressPage: ShippingAddressPage(),
    PageConstants.ShippingAddressAddPage: ShippingAddressAddPage(),
    PageConstants.MyOrderPage: MyOrderPage(),
  },
  visitor: (String path, Page<Object, dynamic> page) {
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
      adapterMiddleware: <AdapterMiddleware<dynamic>>[safetyAdapter<dynamic>()],
      effectMiddleware: [],
      middleware: <Middleware<dynamic>>[logMiddleware<dynamic>()],
    );
  },
);
