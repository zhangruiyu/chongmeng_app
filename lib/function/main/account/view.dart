import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AccountState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    child: Column(
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text("登录"),
        )
      ],
    ),
  );
}
