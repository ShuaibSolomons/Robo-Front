import 'Status.dart';

class BaseRequest<T> {
  Status status;
  T result;

  BaseRequest({this.status, this.result});

  BaseRequest.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    // result = json['result'] != null ? new T.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    // if (this.result != null) {
    //   data['result'] = this.result.toJson();
    // }
    return data;
  }
}
