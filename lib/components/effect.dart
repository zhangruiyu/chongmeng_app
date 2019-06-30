import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<UploadImageState> buildEffect() {
  return combineEffects(<Object, Effect<UploadImageState>>{
    UploadImageAction.action: _onAction,
  });
}

void _onAction(Action action, Context<UploadImageState> ctx) {
}
