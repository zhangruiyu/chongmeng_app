import 'package:chongmeng/localizetion/default_localization.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SplashState state, Dispatch dispatch, ViewService viewService) {
  return new Scaffold(
    body: new Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
          image: new AssetImage(
            'assets/splash_page_bg.png',
          ),
          fit: BoxFit.fitWidth,
        )),
        child: new SafeArea(
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
          ),
        )),
  );
}
