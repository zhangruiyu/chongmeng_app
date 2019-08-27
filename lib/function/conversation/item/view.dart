import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/utils/jiguang_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';
import 'package:sliver_animated_list/sliver_animated_list.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ConversationItemState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: colorf3f3f3,
    appBar: Toolbar(
      title: Text(
        state.conversationInfo.target.nickname,
        style: TextStyle(color: colorWhite),
      ),
    ),
    body: Column(
      children: <Widget>[
        Expanded(
          child: AnimatedList(
            key: state.listKey,
            controller: state.controller,
            itemBuilder:
                (BuildContext context, int index, Animation animation) {
              /*  if (index == state.messages.length - 1) {
                dispatch(ConversationItemActionCreator.onRefresh(null));
              }*/
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
                    if (!message.isSend)
                      Text(
                        message.from.nickname,
                        style: TextStyle(fontSize: 12.0),
                      ),
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: Text(message.text),
                    ),
                  ],
                ));
              }

              return message is JMTextMessage
                  ? SizeTransition(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, left: 10.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: message.isSend
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: message.isSend
                              ? widgets.reversed.toList()
                              : widgets,
                        ),
                      ),
                      sizeFactor: animation,
                    )
                  : null;
            },
            reverse: true,
            initialItemCount: state.messages?.length ?? 0,
          ),
        ),
        buildBottom(state, dispatch, viewService)
      ],
    ),
  );
}

Widget buildBottom(
    ConversationItemState state, Dispatch dispatch, ViewService viewService) {
  return Row(
    children: <Widget>[
      Expanded(
        child: TextField(
          controller: state.messagesTextEditingController,
          maxLines: 1,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(
                left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
            labelText: "想跟TA说点什么呢",
          ),
        ),
      ),
      IconButton(
        onPressed: () async {
          var message = await jmessage.createMessage(
              type: JMMessageType.text,
              targetType: state.conversationInfo.target.targetType,
              text: state.messagecount.toString(),
              extras: {"key1": "value1"});
          JMTextMessage msg = await jmessage.sendMessage(
            message: message,
          );
          dispatch(ConversationItemActionCreator.onAddMessage(msg));
          state.messagecount++;
        },
        icon: Icon(Icons.send),
      )
    ],
  );
}
