import 'package:fish_redux/fish_redux.dart';

class MessageBodyState implements Cloneable<MessageBodyState> {

  @override
  MessageBodyState clone() {
    return MessageBodyState();
  }
}

MessageBodyState initState(Map<String, dynamic> args) {
  return MessageBodyState();
}
