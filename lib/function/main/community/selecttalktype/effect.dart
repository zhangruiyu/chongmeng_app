import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<SelectTalkTypeState> buildEffect() {
  return combineEffects(<Object, Effect<SelectTalkTypeState>>{
    SelectTalkTypeAction.SkipPage: _onSkipPage,
  });
}

Future _onSkipPage(Action action, Context<SelectTalkTypeState> ctx) async {
  String type = action.payload;
  if (type == "camera") {
    NavigatorHelper.pushRecordPage(ctx.context);
  } else if (type == "album") {
    Map<String, String> filesPaths = await NavigatorHelper.pushFileSelectPage();
  } else if (type == "article") {}
}
