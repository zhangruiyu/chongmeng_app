import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';
import 'package:image_picker/image_picker.dart';

Effect<SelectPetAvatarState> buildEffect() {
  return combineEffects(<Object, Effect<SelectPetAvatarState>>{
    SelectPetAvatarAction.SelectPetAvatar: _onSelectPetAvatar,
  });
}

Future _onSelectPetAvatar(
    Action action, Context<SelectPetAvatarState> ctx) async {
  var image = (await ImagePicker.pickImage(source: ImageSource.gallery));
  ctx.dispatch(SelectPetAvatarActionCreator.onSetAvatarPath(image));
}
