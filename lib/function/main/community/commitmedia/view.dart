import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CommitMediaState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(),
    body: Column(
      children: <Widget>[Text(state.filePath)],
    ),
  );
}
