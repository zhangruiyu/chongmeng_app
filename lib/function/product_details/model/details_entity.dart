class DetailsEntity {
  String msg;
  List<String> data;
  int status;

  DetailsEntity({this.msg, this.data, this.status});

  DetailsEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data']?.cast<String>();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['data'] = this.data;
    data['status'] = this.status;
    return data;
  }
}
