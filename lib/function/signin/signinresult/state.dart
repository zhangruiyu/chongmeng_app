import 'package:fish_redux/fish_redux.dart';

class SignInResultDialogState implements Cloneable<SignInResultDialogState> {

  @override
  SignInResultDialogState clone() {
    return SignInResultDialogState();
  }
}

SignInResultDialogState initState(Map<String, dynamic> args) {
  return SignInResultDialogState();
}
