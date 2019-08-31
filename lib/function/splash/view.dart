import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/localizetion/default_localization.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:like_button/like_button.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SplashState state, Dispatch dispatch, ViewService viewService) {
  return new Scaffold(
    backgroundColor: colorWhite,
    body: SafeArea(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          new Container(
              child: new Align(
            alignment: Alignment.topRight,
            child: new Container(
                margin: const EdgeInsets.only(right: 20.0),
                decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(5.0)),
                child: new FlatButton(
                  child: new Text(
                      '${state.n}s ${DefaultLocalizations.of(viewService.context).splashSkip}'),
                  onPressed: () {
                    dispatch(SplashActionCreator.onPushMainPage());
                  },
                  textColor: const Color(0xffffffff),
                  color: const Color.fromARGB(55, 0, 0, 0),
                )),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 78.0),
            child: ClipOval(
              child: Image.asset(
                'assets/logo.png',
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 40.0,
            child: Text("宠窝"),
          )
        ],
      ),
    ),
  );
}
