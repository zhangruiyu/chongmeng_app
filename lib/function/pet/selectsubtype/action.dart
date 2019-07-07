import 'package:fish_redux/fish_redux.dart';

enum SelectSubTypeAction { SkipSelectPetAvatarPage }

class SelectSubTypeActionCreator {
  static Action onSkipSelectPetAvatarPage(p) {
    return Action(SelectSubTypeAction.SkipSelectPetAvatarPage, payload: p);
  }
}
