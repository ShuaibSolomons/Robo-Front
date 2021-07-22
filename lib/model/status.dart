class Status {
  int id;
  String detail;

  Status({this.id, this.detail});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['detail'] = this.detail;
    return data;
  }
}
