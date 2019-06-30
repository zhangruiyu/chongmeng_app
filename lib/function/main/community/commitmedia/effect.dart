import 'package:file_picker/file_picker.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'model/dynamic_selected_pic_task.dart';
import 'state.dart';

Effect<CommitMediaState> buildEffect() {
  return combineEffects(<Object, Effect<CommitMediaState>>{
    CommitMediaAction.ReselectPic: _onReselectPic,
    Lifecycle.initState: _initState,
  });
}

Future _onReselectPic(Action action, Context<CommitMediaState> ctx) async {
  Map<String, String> file =
      await FilePicker.getMultiFilePath(type: FileType.ANY);
  if ((file?.length ?? 0) > 0) {
    ctx.dispatch(CommitMediaActionCreator.onChangeSelectPic(
        file.values.map((item) => DynamicSelectedPicTask(item)).toList()));
  }
}

void _initState(Action action, Context<CommitMediaState> ctx) {}
