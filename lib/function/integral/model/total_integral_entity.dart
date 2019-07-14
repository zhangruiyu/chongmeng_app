class TotalIntegralEntity {
  String msg;
  int data;
  int status;

  TotalIntegralEntity({this.msg, this.data, this.status});

  TotalIntegralEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'];
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
