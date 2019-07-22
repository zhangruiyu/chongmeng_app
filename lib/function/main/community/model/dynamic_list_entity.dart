class DynamicListEntity {
  String msg;
  List<DynamicListData> data;
  int status;

  DynamicListEntity({this.msg, this.data, this.status});

  DynamicListEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<DynamicListData>();
      (json['data'] as List).forEach((v) {
        data.add(new DynamicListData.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class DynamicListData {
  List<String> images;
  List<int> liked;
  String createTime;
  int userId;
  String nickName;
  int id;
  DynamicListDataVideo video;
  String avatar;
  String content;

  DynamicListData(
      {this.images,
      this.liked,
      this.createTime,
      this.userId,
      this.nickName,
      this.id,
      this.video,
      this.avatar,
      this.content});

  DynamicListData.fromJson(Map<String, dynamic> json) {
    images = json['images']?.cast<String>();
    liked = json['liked']?.cast<int>();
    createTime = json['create_time'];
    userId = json['user_id'];
    nickName = json['nick_name'];
    id = json['id'];
    video = json['video'] != null
        ? new DynamicListDataVideo.fromJson(json['video'])
        : null;
    avatar = json['avatar'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images'] = this.images;
    data['liked'] = this.liked;
    data['create_time'] = this.createTime;
    data['user_id'] = this.userId;
    data['nick_name'] = this.nickName;
    data['id'] = this.id;
    if (this.video != null) {
      data['video'] = this.video.toJson();
    }
    data['avatar'] = this.avatar;
    data['content'] = this.content;
    return data;
  }
}

class DynamicListDataVideo {
  String videoPath;
  String videoThumbnailPath;

  DynamicListDataVideo({this.videoPath, this.videoThumbnailPath});

  DynamicListDataVideo.fromJson(Map<String, dynamic> json) {
    videoPath = json['videoPath'];
    videoThumbnailPath = json['videoThumbnailPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['videoPath'] = this.videoPath;
    data['videoThumbnailPath'] = this.videoThumbnailPath;
    return data;
  }
}
