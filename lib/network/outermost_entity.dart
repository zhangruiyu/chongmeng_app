class OutermostEntity {
  String data;
  int status;

  OutermostEntity({this.data, this.status});

  OutermostEntity.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['status'] = this.status;
    return data;
  }
}
