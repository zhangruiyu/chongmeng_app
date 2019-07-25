import 'package:chongmeng/function/main/home/model/home_entity.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<BannerState> buildEffect() {
  return combineEffects(<Object, Effect<BannerState>>{
    BannerAction.SkipWebViewPage: _onSkipWebViewPage,
  });
}

void _onSkipWebViewPage(Action action, Context<BannerState> ctx) {
  HomeDataBanner itemBanner = action.payload;
  NavigatorHelper.pushWebPage(
      ctx.context, itemBanner.title, itemBanner.itemUrl);
}
