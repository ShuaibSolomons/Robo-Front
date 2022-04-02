class Status {
  late int id;
  late String detail;

  Status({required this.id, required this.detail});

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
