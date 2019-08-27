import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/function/conversation/item/page.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/date_utils.dart';
import 'package:chongmeng/utils/jiguang_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ConversationState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
      title: Text("所有聊天"),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () async {
        /*try {
          await jmessage.userRegister(
              username:
                  "chongmeng" + UserHelper.getOnlineUser().userId.toString(),
              password: "chongmeng" + "123",
              nickname: UserHelper.getOnlineUser().nickName.toString());
        } catch (e) {}
        println("chongmeng" + UserHelper.getOnlineUser().userId.toString());
        await jmessage.login(
            username:
                "chongmeng" + UserHelper.getOnlineUser().userId.toString(),
            password: "chongmeng" + "123");
        var message = await jmessage.createMessage(
            type: JMMessageType.text,
            targetType: JMSingle.fromJson({
              'username': "chongmeng" + "24",
              'appKey': JiguangUtils.JpushKey
            }),
            text: "我发的zmle",
            extras: {"key1": "value1"});
        JMTextMessage msg = await jmessage.sendMessage(
          message: message,
        );*/
//        JiguangUtils.loginIM(viewService.context);
      },
    ),
    body: ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        JMConversationInfo conversation = state.conversations[index];
        var avatar;
        var targetName;
        String lastMessage;
        if (conversation.target is JMUserInfo) {
          var target = (conversation.target as JMUserInfo);
          avatar = target.avatarThumbPath;
          targetName = target.username;
          lastMessage = transformSubTitle(conversation.latestMessage);
          println(lastMessage);
        }
        println(conversation);
        return InkWell(
          onTap: () {
            dispatch(ConversationActionCreator.onSkipConversationItemPage(
                conversation));
          },
          onLongPress: () async {
            await jmessage.deleteConversation(
                target: conversation.target.targetType);
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 10.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 13.0),
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(avatar),
                      ),
                      if (conversation.unreadCount > 0)
                        Container(
                          alignment: Alignment.center,
                          width: 13.0,
                          height: 13.0,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(13.0),
                            ),
                          ),
                          child: Text(
                            conversation.unreadCount.toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 7.0),
                          ),
                        )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(conversation.title),
                    if (lastMessage?.isNotEmpty == true) Text(lastMessage),
                    if (conversation.latestMessage != null)
                      Text(
                        DateUtils.int2string(
                            (conversation.latestMessage as JMNormalMessage)
                                .createTime),
                        style: TextStyle(color: color7E7E7E, fontSize: 12.0),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      itemCount: state.conversations?.length ?? 0,
    ),
  );
}

String transformSubTitle(JMNormalMessage lastMessage) {
  if (lastMessage is JMTextMessage) {
    return lastMessage.text;
  }
  return "图片";
}
