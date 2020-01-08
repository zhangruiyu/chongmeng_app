import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'action.dart';
import 'model/hot_movie_entity.dart';
import 'state.dart';

Widget buildView(MovieState state, Dispatch dispatch, ViewService viewService) {
  if (state.views == null) {
    state.views = [
      viewService.buildComponent('move_list'),
      Text("123"),
    ];
  }
  var of = Theme.of(viewService.context);
  var infoTextStyle = TextStyle(color: color7E7E7E);
  return Scaffold(
    appBar: Toolbar(
      title: Text("电影大厅"),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 22.0),
          child: InkResponse(
            onTap: () {
              dispatch(MovieActionCreator.onSelectCity());
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                state.districtText,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    ),
    floatingActionButton: FloatingActionButton(
      elevation: 0.0,
      onPressed: () {
        dispatch(MovieActionCreator.onShare());
      },
      child: Text(
        "赚",
        style: TextStyle(color: colorWhite, fontSize: 20),
      ),
      backgroundColor: Colors.red,
    ),
    body: IndexedStack(
      children: state.views,
      index: state.pageIndex,
    ),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: state.pageIndex,
      onTap: (int index) {
        dispatch(MovieActionCreator.onChangeNewPage(index));
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.phone), title: Text("电影")),
        BottomNavigationBarItem(icon: Icon(Icons.phone), title: Text("影院")),
      ],
    ),
  );
}
