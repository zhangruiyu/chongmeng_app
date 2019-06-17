import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('BottomNavigationBar Sample'),
    ),
    body: Center(child: Text(state.mainPageIndex.toString())),
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
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
      ],
      currentIndex: state.mainPageIndex,
      selectedItemColor: Colors.amber[800],
      onTap: (int index) {
        dispatch(MainActionCreator.onChangeNewPage(index));
      },
    ),
  );
}
