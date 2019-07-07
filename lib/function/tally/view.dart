import 'package:chongmeng/constants/page_constants.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(TallyState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
      title: Text("记一笔"),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 22.0),
          child: InkResponse(
            onTap: () {
              Navigator.pushNamed(
                  viewService.context, PageConstants.AddTallyPage);
            },
            child: Container(
              alignment: Alignment.center,
              child: Text("添加"),
            ),
          ),
        )
      ],
    ),
  );
}
