import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ReviewIVState> buildEffect() {
  return combineEffects(<Object, Effect<ReviewIVState>>{
    ReviewIVAction.action: _onAction,
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
  });
}

void _onAction(Action action, Context<ReviewIVState> ctx) {}

void _dispose(Action action, Context<ReviewIVState> ctx) {
  ctx.state.videoController?.dispose();
}

void _initState(Action action, Context<ReviewIVState> ctx) {
  if (ctx.state.type == 'video') {
    ctx.state.videoController
        .setFileDataSource(File(ctx.state.filePath), autoPlay: true);
  }
}
