import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/function/share/state.dart';
import 'package:chongmeng/network/entity/share_result_entity.dart';
import 'package:chongmeng/network/entity/share_url_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/share_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:oktoast/oktoast.dart';
import 'action.dart';
import 'model/hot_movie_entity.dart';
import 'state.dart';

Effect<MovieState> buildEffect() {
  return combineEffects(<Object, Effect<MovieState>>{
    MovieAction.Refresh: _onRefresh,
    MovieAction.Share: _onShare,
  });
}

Future<void> _onRefresh(Action action, Context<MovieState> ctx) async {
  (await RequestClient.request<HotMovieEntity>(
          ctx.context, HttpConstants.MoiveHot))
      .yes((value) {
    ctx.dispatch(MovieActionCreator.onResetData(value.data));
  });
  CompleterUtils.complete(action);
}

Future<void> _onShare(Action action, Context<MovieState> ctx) async {
  (await RequestClient.request<ShareUrlEntity>(
          ctx.context, HttpConstants.shareUrl,
          showLoadingIndicator: true))
      .yes((value) async {
    var result = await ShareUtils.share(
      ctx.context,
      ShareState.h5,
      content: "他来啦,他来啦,他正在使用宠窝app打折购买电影票",
      dec: "我已成功购买打折电影票,特邀请您来一起省钱",
      url: value.data.inviteUrl,
      title: Padding(
        child: Text(
          "分享即可得萌币,邀请成功更可获得大额萌币",
          style: TextStyle(fontSize: 18),
        ),
        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      ),
    );
    if (ShareUtils.isShareSuccess(result)) {
      (await RequestClient.request<ShareResultEntity>(
              ctx.context, HttpConstants.shareAward,
              queryParameters: {'shareType': 'MovieShare'},
              showLoadingIndicator: true))
          .yes((value) async {
        showToast("恭喜您,获得${value.data.value}萌币",
            duration: Duration(
              milliseconds: 3300,
            ));
      });
    }
  });
}
