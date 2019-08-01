import 'package:chongmeng/function/main/community/commit_media/model/upload_task.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<AdoptionAddState> buildEffect() {
  return combineEffects(<Object, Effect<AdoptionAddState>>{
    AdoptionAddAction.ReselectPic: _onReselectPic,
  });
}

Future _onReselectPic(Action action, Context<AdoptionAddState> ctx) async {
  List<String> imgList = await NavigatorHelper.pushFileSelectPageString(
      ctx.context,
      maxSelected: 5);
  if ((imgList?.length ?? 0) > 0) {
    ctx.dispatch(AdoptionAddActionCreator.onChangeSelectPic(
        imgList.map((item) => UploadTask(item)).toList()));
  }
}
