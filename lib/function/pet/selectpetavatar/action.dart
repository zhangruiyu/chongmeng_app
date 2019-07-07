import 'package:fish_redux/fish_redux.dart';

enum SelectPetAvatarAction { SetAvatarPath, SelectPetAvatar }

class SelectPetAvatarActionCreator {
  static Action onSetAvatarPath(image) {
    return Action(SelectPetAvatarAction.SetAvatarPath, payload: image);
  }

  static Action onSelectPetAvatar() {
    return const Action(SelectPetAvatarAction.SelectPetAvatar);
  }
}
