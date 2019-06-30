import 'dart:io';

import 'package:chongmeng/constants/page_constants.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'action.dart';
import 'state.dart';

Effect<ReviewIVState> buildEffect() {
  return combineEffects(<Object, Effect<ReviewIVState>>{
    ReviewIVAction.SkipCommitPage: _onSkipCommitPage,
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
  });
}

void _onSkipCommitPage(Action action, Context<ReviewIVState> ctx) {
  Navigator.popAndPushNamed(ctx.context, PageConstants.CommitMediaPage,
      arguments: {
        'filePath': ctx.state.filePath,
        'type': ctx.state.type,
        'thumbnailFile': ctx.state.thumbnailFile
      });
}

void _dispose(Action action, Context<ReviewIVState> ctx) {
  ctx.state.videoController?.dispose();
}

void _initState(Action action, Context<ReviewIVState> ctx) {
  if (ctx.state.type == 'video') {
    ctx.state.videoController
        .setFileDataSource(File(ctx.state.filePath), autoPlay: true);
  }
}
