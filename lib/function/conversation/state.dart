import 'package:fish_redux/fish_redux.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';

class ConversationState implements Cloneable<ConversationState> {
  List<JMConversationInfo> conversations;

  @override
  ConversationState clone() {
    return ConversationState()..conversations = conversations;
  }
}

ConversationState initState(Map<String, dynamic> args) {
  return ConversationState();
}
