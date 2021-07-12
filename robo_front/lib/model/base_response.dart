import 'result.dart';
import 'Status.dart';

class BaseResponse {
  Status status;
  Result result;

  BaseResponse({this.status, this.result});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}
