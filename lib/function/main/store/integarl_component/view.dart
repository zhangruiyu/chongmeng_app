import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    IntegralItemState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    child: Column(
      children: <Widget>[Text("123")],
    ),
  );
}
