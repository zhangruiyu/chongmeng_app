import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/widget/custom_dialog.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:oktoast/oktoast.dart';
import 'action.dart';
import 'state.dart';

Effect<AdoptionDetailsState> buildEffect() {
  return combineEffects(<Object, Effect<AdoptionDetailsState>>{
    AdoptionDetailsAction.ShowAdoptionDialog: _onShowAdoptionDialog,
  });
}

void _onShowAdoptionDialog(Action action, Context<AdoptionDetailsState> ctx) {
  showDialog(
      context: ctx.context,
      builder: (BuildContext context) {
        return Container(
          child: CanSetWidthDialog(
              minWidth: 275.0,
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    color: Theme.of(ctx.context).accentColor),
                width: double.infinity,
                padding: const EdgeInsets.only(top: 14.0, left: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: <Widget>[
                        Icon(
                          MdiIcons.messageProcessing,
                          color: colorWhite,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("联系方式",
                              style:
                                  TextStyle(fontSize: 15.0, color: colorWhite)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        children: <Widget>[
                          Text("姓  名: ${ctx.state.data.masterName}",
                              style:
                                  TextStyle(fontSize: 15.0, color: colorWhite))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 18.0),
                      child: Row(
                        children: <Widget>[
                          Text("微信号: ${ctx.state.data.masterWechat}",
                              style:
                                  TextStyle(fontSize: 15.0, color: colorWhite)),
                          GestureDetector(
                            onTap: () {
                              ClipboardData data = new ClipboardData(
                                  text: ctx.state.data.masterWechat);
                              Clipboard.setData(data);
                              showToast("复制成功");
                              Navigator.pop(ctx.context);
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              margin:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Text("复制",
                                  style: TextStyle(
                                      fontSize: 15.0, color: colorWhite)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                  color: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        );
      });
}
