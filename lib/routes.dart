import 'package:chongmeng/function/my_pet/page.dart';
import 'package:chongmeng/function/signin/signinresult/page.dart';
import 'package:fish_redux/fish_redux.dart';

import 'function/adoption/adoption_add/page.dart';
import 'function/adoption/details/page.dart';
import 'function/adoption/page.dart';
import 'function/auto/page.dart';
import 'function/bindtel/page.dart';
import 'function/integral/record/page.dart';
import 'function/main/community/commit_media/page.dart';
import 'function/main/community/commit_text/page.dart';
import 'function/main/community/selecttalktype/page.dart';
import 'function/main/page.dart';
import 'function/main/store/integral_commodity_detail/page.dart';
import 'function/my_order/page.dart';
import 'function/pet/selectpetavatar/page.dart';
import 'function/pet/selectsubtype/page.dart';
import 'function/pet/selecttype/page.dart';
import 'function/product_details/page.dart';
import 'function/recipe/page.dart';
import 'function/record/page.dart';
import 'function/record/review/page.dart';
import 'function/review_image/page.dart';
import 'function/search/page.dart';
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

class PageConstants {
  static const String SplashPage = 'cm://ForgetPasswordPage'; //忘记密码
  static const String ForgetPasswordPage = 'cm://ForgetPasswordPage'; //忘记密码
  static const String SettingPage = 'cm://SettingPage'; //设置界面
  static const String NoticePage = 'cm://NoticePage'; //公告

  static const String UpdatePage = "cm://UpdatePage"; //更新
  static const String PermissionPage = "cm://PermissionPage"; //权限弹框

  static const String BindTelPage = 'cm://BindTelPage';
  static const String AutoPage = 'cm://AutoPage';
  static const String MainPage = "cm://MainPage"; //主页
  static const String MePage = "cm://MePage"; //我的
  static const String RecordPage = "cm://RecordPage"; //录制视频
  static const String ReviewIVPage = "cm://ReviewIVPage"; //预览录制视频和拍照图片
  static const String SelectTalkTypePage = "cm://SelectTalkTypePage"; //选择说说类型
  static const String CommitMediaPage = "cm://CommitMediaPage"; //发布文字评论
  static const String CommitTextPage = "cm://CommitTextPage"; //发布文字评论
  static const String WebviewPage = "cm://WebviewPage"; //WebviewPage
  static const String SelectTypePage = "cm://SelectTypePage"; //选择宠物大类型
  static const String SelectSubTypePage = "cm://SelectSubTypePage"; //选择宠物子类型
  static const String SelectPetAvatarPage = "cm://SelectPetAvatarPage"; //选择宠物头像
  static const String MyPetPage = "cm://MyPetPage"; //我的宠物
  static const String TallyPage = "cm://TallyPage"; //
  static const String AddTallyPage = "cm://AddTallyPage"; //
  static const String SignInPage = "cm://SignInPage"; //签到
  static const String SignInResultDialog = "cm://SignInResultDialog"; //签到结果弹框
  static const String IntegralRecordPage = "cm://IntegralRecordPage"; //积分记录
  static const String IntegralCommodityDetailPage =
      "cm://IntegralCommodityDetailPage"; //积分商品详情
  static const String ShippingAddressPage = "cm://ShippingAddressPage"; //收货地址
  static const String ShippingAddressAddPage =
      "cm://ShippingAddressAddPage"; //添加收货地址
  static const String MyOrderPage = "cm://MyOrderPage"; //我的订单
  static const String ReviewImagePage = "cm://ReviewImagePage"; //图片预览
  static const String ProductDetailsPage =
      "cm://ProductDetailsPage"; //淘宝推荐产品详情页
  static const String SearchPage = "cm://SearchPage"; //搜索页面
  static const String RecipePage = "cm://RecipePage"; //食谱页面
  static const String AdoptionPage = "cm://AdoptionPage"; //领养列表
  static const String AdoptionAddPage = "cm://AdoptionAddPage"; //添加领养
  static const String AdoptionDetailsPage = "cm://AdoptionDetailsPage"; //领养详情页
}

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
    PageConstants.CommitTextPage: CommitTextPage(),
    PageConstants.ReviewImagePage: ReviewImagePage(),
    PageConstants.ProductDetailsPage: ProductDetailsPage(),
    PageConstants.SearchPage: SearchPage(),
    PageConstants.RecipePage: RecipePage(),
    PageConstants.AdoptionPage: AdoptionPage(),
    PageConstants.AdoptionAddPage: AdoptionAddPage(),
    PageConstants.AdoptionDetailsPage: AdoptionDetailsPage(),
    PageConstants.MyPetPage: MyPetPage(),
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
