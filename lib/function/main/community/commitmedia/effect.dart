import 'package:chongmeng/function/main/community/commitmedia/view.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'action.dart';
import 'state.dart';

Effect<CommitMediaState> buildEffect() {
  return combineEffects(<Object, Effect<CommitMediaState>>{
    CommitMediaAction.action: _onAction,
    Lifecycle.initState: _initState,
  });
}

void _onAction(Action action, Context<CommitMediaState> ctx) {}

void _initState(Action action, Context<CommitMediaState> ctx) {}
