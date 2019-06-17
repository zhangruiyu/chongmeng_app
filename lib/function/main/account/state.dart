import 'package:fish_redux/fish_redux.dart';

class AccountState implements Cloneable<AccountState> {

  @override
  AccountState clone() {
    return AccountState();
  }
}

AccountState initState(Map<String, dynamic> args) {
  return AccountState();
}
