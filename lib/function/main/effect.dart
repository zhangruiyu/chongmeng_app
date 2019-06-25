import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/helper/permission_helper.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'home/model/home_entity.dart';
import 'state.dart';
import 'package:file_picker/file_picker.dart';

Effect<MainState> buildEffect() {
  return combineEffects(<Object, Effect<MainState>>{
    Lifecycle.initState: _initState
//    MainAction.action: _onAction,
  });
}

void _onAction(Action action, Context<MainState> ctx) {}

Future _initState(Action action, Context<MainState> ctx) async {
  Map<String, String> filesPaths;
//  filesPaths = await FilePicker.getMultiFilePath(
//      fileExtension: 'pdf'); // will let you pick multiple pdf files at once
  if (await PermissionHelper.checkStoragePermission()) {
//    filesPaths = await FilePicker.getMultiFilePath(type: FileType.IMAGE);
  }
  NavigatorHelper.pusRecordPage(ctx.context);
}
