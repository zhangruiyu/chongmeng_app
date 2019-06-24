import 'package:chongmeng/constants/page_constants.dart';
import 'package:chongmeng/global_store/state.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:umengshare/umengshare.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AccountState state, Dispatch dispatch, ViewService viewService) {
  return GlobalStore.store.getState().localUser == null
      ? Container(
          child: Column(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(
                      viewService.context, PageConstants.AutoPage);
//            UMengShare.shareText(UMSharePlatform.QQ, "123");
                },
                child: Text("登录"),
              )
            ],
          ),
        )
      : Container(
          child: Column(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(
                      viewService.context, PageConstants.AutoPage);
//            UMengShare.shareText(UMSharePlatform.QQ, "123");
                },
                child: Text("登录成功"),
              )
            ],
          ),
        );
}
