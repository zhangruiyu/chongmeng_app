import 'package:fish_redux/fish_redux.dart';

class SignInState implements Cloneable<SignInState> {

  @override
  SignInState clone() {
    return SignInState();
  }
}

SignInState initState(Map<String, dynamic> args) {
  return SignInState();
}
