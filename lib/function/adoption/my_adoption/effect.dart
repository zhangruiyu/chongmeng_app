import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/function/adoption/model/adoption_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/widget/custom_dialog.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/material.dart' as prefix0;
import 'action.dart';
import 'model/my_adoption_entity.dart';
import 'state.dart';

Effect<MyAdoptionState> buildEffect() {
  return combineEffects(<Object, Effect<MyAdoptionState>>{
    MyAdoptionAction.Refresh: _onRefresh,
    MyAdoptionAction.ShowAdoptionState: _onShowAdoptionState,
  });
}

void _onShowAdoptionState(Action action, Context<MyAdoptionState> ctx) {
  MyAdoptionDataAdoption adoption = action.payload;
  var of = prefix0.Theme.of(ctx.context);
  showDialog(
      context: ctx.context,
      builder: (context) {
        return Container(
          alignment: Alignment.center,
          child: CanSetWidthDialog(
              minWidth: 275.0,
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        color: colorWhite),
                    width: double.infinity,
                    padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            child: Text("下架"),
                            onPressed: () {
                              _onUpdateAdoption(ctx, adoption.id, 20);
                            },
                            color: of.accentColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            child: Text("已被领养"),
                            onPressed: () {
                              _onUpdateAdoption(ctx, adoption.id, 10);
                            },
                            color: of.accentColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 38.0, bottom: 30.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(ctx.context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: colorWhite,
                      ),
                    ),
                  )
                ],
              )),
        );
      });
}

Future _onUpdateAdoption(
    Context<MyAdoptionState> ctx, int adoptionId, int status) async {
  var result = await RequestClient.request<MyAdoptionEntity>(
      ctx.context, HttpConstants.UpdateAdoptionState,
      showLoadingIndicator: true,
      queryParameters: {'adoptionId': adoptionId, "status": status});
  if (result.hasSuccess) {
    ctx.dispatch(MyAdoptionActionCreator.onResetData(result.data.data));
  }
}

Future _onRefresh(Action action, Context<MyAdoptionState> ctx) async {
  var result = await RequestClient.request<MyAdoptionEntity>(
      ctx.context, HttpConstants.MyAdoptionList);
  CompleterUtils.complete(action);
  if (result.hasSuccess) {
    ctx.dispatch(MyAdoptionActionCreator.onResetData(result.data.data));
  }
}
