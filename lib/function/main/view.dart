import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
      leading: null,
      title: const Text('宠萌'),
    ),
    body: Center(child: Text(state.mainPageIndex.toString())),
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          title: Text('Business'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          title: Text('School'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance),
          title: Text(DefaultLocalizations.of(viewService.context).me),
        ),
      ],
      currentIndex: state.mainPageIndex,
      selectedItemColor: Colors.amber[800],
      onTap: (int index) {
        dispatch(MainActionCreator.onChangeNewPage(index));
      },
    ),
  );
}
