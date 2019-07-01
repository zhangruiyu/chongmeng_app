import 'package:fish_redux/fish_redux.dart';

class CommunityItemState implements Cloneable<CommunityItemState> {

  @override
  CommunityItemState clone() {
    return CommunityItemState();
  }
}

CommunityItemState initState(Map<String, dynamic> args) {
  return CommunityItemState();
}
