import 'package:chongmeng/utils/jiguang_utils.dart';
import 'package:chongmeng/utils/jmessage_utils.dart';
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
    print('listener receive event - message ： ${msg.toJson()}');
    ctx.dispatch(ConversationItemActionCreator.onAddMessage(msg));
    //防止应用被手动杀死导致消息已读 但没返回页面清空未读消息
    resetUnreadMessageCount(ctx);
    ctx.state.listKey.currentState
        .insertItem(0, duration: Duration(seconds: 2));
  };
  //进入会话
  jmessage.enterConversation(
      target: ctx.state.conversationInfo.target.targetType);
  jmessage.addReceiveMessageListener(ctx.state.messageEventListener);
}

void _dispose(Action action, Context<ConversationItemState> ctx) {
  //退出会话写在willpop了
  jmessage.exitConversation(
      target: ctx.state.conversationInfo.target.targetType);
  jmessage.removeReceiveMessageListener(ctx.state.messageEventListener);
  resetUnreadMessageCount(ctx);
}

////设置已读
void resetUnreadMessageCount(Context<ConversationItemState> ctx) {
  JMessageUtils.resetUnreadMessageCount(ctx.state.conversationInfo.target);
}
