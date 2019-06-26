import 'package:fish_redux/fish_redux.dart';

class CommunityState implements Cloneable<CommunityState> {

  @override
  CommunityState clone() {
    return CommunityState();
  }
}

CommunityState initState(Map<String, dynamic> args) {
  return CommunityState();
}
