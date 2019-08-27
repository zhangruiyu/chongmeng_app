import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/conversation/item/page.dart';
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
    ConversationItemAction.Refresh: _onRefresh,
    ConversationItemAction.SendTextMessage: _onSendTextMessage,
  });
}

void _initState(Action action, Context<ConversationItemState> ctx) {
  ctx.state.controller.addListener(() {
    if (ctx.state.controller.position.pixels ==
        ctx.state.controller.position.maxScrollExtent) {
      ///load more when the listView attached the bottom
      _onRefresh(action, ctx);
    }
  });

  //message 和 retractedMessage 可能是 JMTextMessage | JMVoiceMessage | JMImageMessage | JMFileMessage | JMEventMessage | JMCustomMessage;
  ctx.state.messageEventListener = (msg) {
    print('listener receive event - message ： ${msg.toJson()}');
    ctx.dispatch(ConversationItemActionCreator.onAddMessage(msg));
    //防止应用被手动杀死导致消息已读 但没返回页面清空未读消息
    resetUnreadMessageCount(ctx);
    ctx.state.listKey.currentState.insertItem(0);
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

Future _onRefresh(Action action, Context<ConversationItemState> ctx) async {
  println("localIndex ${ctx.state.localIndex}");
  List<JMNormalMessage> messages = (await jmessage.getHistoryMessages(
          type: ctx.state.conversationInfo.target.targetType,
          from:
              ctx.state.localIndex * ConversationItemPage.LocalMessagePageSize +
                  ctx.state.sendMessages.length,
          limit: ConversationItemPage.LocalMessagePageSize,
          isDescend: true))
      .map((item) {
    return item as JMNormalMessage;
  }).toList();
  CompleterUtils.complete(action);
  if (messages.length > 0) {
    println(
        "加载更多 ${messages.map((itemMessage) => (itemMessage as JMTextMessage).text).toString()}");
    ctx.dispatch(ConversationItemActionCreator.onAddAllMessage(messages));
    for (int offset = 0; offset < messages.length; offset++) {
      ctx.state.listKey.currentState
          .insertItem(ctx.state.messages.length - messages.length + offset);
    }
  }
}

Future _onSendTextMessage(
    Action action, Context<ConversationItemState> ctx) async {
  var message = await jmessage.createMessage(
      type: JMMessageType.text,
      targetType: ctx.state.conversationInfo.target.targetType,
      text: ctx.state.messagesTextEditingController.text,
      extras: {"key1": "value1"});
  JMTextMessage msg = await jmessage.sendMessage(
    message: message,
  );
  ctx.dispatch(ConversationItemActionCreator.onAddSendMessage(msg));
  ctx.state.listKey.currentState.insertItem(0);
}

////设置已读
void resetUnreadMessageCount(Context<ConversationItemState> ctx) {
  JMessageUtils.resetUnreadMessageCount(ctx.state.conversationInfo.target);
}
