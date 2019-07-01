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
  String createTime;
  int userId;
  int id;
  DynamicListDataVideo video;
  String content;

  DynamicListData(
      {this.images,
      this.createTime,
      this.userId,
      this.id,
      this.video,
      this.content});

  DynamicListData.fromJson(Map<String, dynamic> json) {
    images = json['images']?.cast<String>();
    createTime = json['create_time'];
    userId = json['user_id'];
    id = json['id'];
    video = json['video'] != null
        ? new DynamicListDataVideo.fromJson(json['video'])
        : null;
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images'] = this.images;
    data['create_time'] = this.createTime;
    data['user_id'] = this.userId;
    data['id'] = this.id;
    if (this.video != null) {
      data['video'] = this.video.toJson();
    }
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
