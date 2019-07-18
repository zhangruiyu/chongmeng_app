import 'package:chongmeng/function/main/community/model/dynamic_list_entity.dart';
import 'package:fish_redux/fish_redux.dart';

class DynamicItemState implements Cloneable<DynamicItemState> {
  List<String> images;
  String createTime;
  int userId;
  String nickName;
  int id;
  DynamicListDataVideo video;
  String avatar;
  String content;

  @override
  DynamicItemState clone() {
    return DynamicItemState()
      ..images = images
      ..createTime = createTime
      ..userId = userId
      ..nickName = nickName
      ..id = id
      ..video = video
      ..avatar = avatar
      ..content = content;
  }

  DynamicItemState();

  DynamicItemState.fromDynamicListData(DynamicListData data) {
    this.images = data.images;
    this.createTime = data.createTime;
    this.userId = data.userId;
    this.nickName = data.nickName;
    this.id = data.id;
    this.video = data.video;
    this.avatar = data.avatar;
    this.content = data.content;
  }
}
