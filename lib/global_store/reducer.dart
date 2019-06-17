import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalAction.changeLanguage: _onchangeLanguage,
    },
  );
}

List<Color> _colors = <Color>[
  Colors.green,
  Colors.red,
  Colors.black,
  Colors.blue
];

GlobalState _onchangeLanguage(GlobalState state, Action action) {
//  final Color next =
//      _colors[((_colors.indexOf(state.themeColor) + 1) % _colors.length)];
  return state.clone()..locale = Locale('en', 'US');
}
