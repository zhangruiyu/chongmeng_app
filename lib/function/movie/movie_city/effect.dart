import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'model/cinema_city_entity.dart';
import 'state.dart';

Effect<MovieCityState> buildEffect() {
  return combineEffects(<Object, Effect<MovieCityState>>{
    MovieCityAction.Refresh: _onRefresh,
    MovieCityAction.SelectCity: _onSelectCity,
  });
}

Future _onRefresh(Action action, Context<MovieCityState> ctx) async {
  (await RequestClient.request<CinemaCityEntity>(
          ctx.context, HttpConstants.movieCity))
      .yes((value) {
    ctx.dispatch(MovieCityActionCreator.onResetData(value.data));
  });
  CompleterUtils.complete(action);
}

Future _onSelectCity(Action action, Context<MovieCityState> ctx) async {
  Navigator.pop(ctx.context, action.payload);
}
