import 'package:chongmeng/utils/jiguang_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';
import 'action.dart';
import 'state.dart';

Effect<ConversationItemState> buildEffect() {
  return combineEffects(<Object, Effect<ConversationItemState>>{
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
    ConversationItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ConversationItemState> ctx) {}

void _initState(Action action, Context<ConversationItemState> ctx) {
  //message 和 retractedMessage 可能是 JMTextMessage | JMVoiceMessage | JMImageMessage | JMFileMessage | JMEventMessage | JMCustomMessage;
  ctx.state.messageEventListener = (msg) {
//+
    print('listener receive event - message ： ${msg.toJson()}');
//    verifyMessage(msg);

//    setState(() {
//      _result = "【收到消息】${msg.toJson()}";
//    });
  };

  jmessage.addReceiveMessageListener(ctx.state.messageEventListener);
  if (ctx.state.conversationInfo.target is JMUserInfo) {
    JMUserInfo jmUserInfo = ctx.state.conversationInfo.target as JMUserInfo;
    jmessage.resetUnreadMessageCount(target: jmUserInfo.targetType);
  }
}

void _dispose(Action action, Context<ConversationItemState> ctx) {
  jmessage.removeReceiveMessageListener(ctx.state.messageEventListener);
}
