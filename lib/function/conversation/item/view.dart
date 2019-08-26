import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/utils/jiguang_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ConversationItemState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
      title: Text(state.conversationInfo.target.nickname),
    ),
    body: Column(
      children: <Widget>[
        Expanded(
          child: AnimatedList(
            key: state.listKey,
            controller: state.controller,
            itemBuilder:
                (BuildContext context, int index, Animation animation) {
              var message = state.messages[index];
              List<Widget> widgets = [];
              widgets.addAll([
                Padding(
                  padding: const EdgeInsets.only(right: 13.0),
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                        message.from.avatarThumbPath),
                  ),
                ),
              ]);
              if (message is JMTextMessage) {
                widgets.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(message.text),
                  ],
                ));
              }

              if (message is JMTextMessage) {
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 8.0, left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: message.isSend
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children:
                        message.isSend ? widgets.reversed.toList() : widgets,
                  ),
                );
              }
              return SizeTransition(
                child: index % 2 == 0
                    ? Row(
                        children: <Widget>[],
                      )
                    : Row(
                        children: <Widget>[],
                      ),
                sizeFactor: animation,
              );
            },
            reverse: true,
            initialItemCount: state.messages?.length ?? 0,
          ),
        ),
        Row(
          children: <Widget>[
            RaisedButton(
              onPressed: () async {
                var message = await jmessage.createMessage(
                    type: JMMessageType.text,
                    targetType: JMSingle.fromJson({
                      'username': "chongmeng" + "28",
                      'appKey': JiguangUtils.JpushKey
                    }),
                    text: "我发的",
                    extras: {"key1": "value1"});
                JMTextMessage msg = await jmessage.sendMessage(
                  message: message,
                );
              },
              child: Text("发送"),
            )
          ],
        )
      ],
    ),
  );
}
