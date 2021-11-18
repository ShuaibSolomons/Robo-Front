import 'results.dart';
import 'status.dart';

class BaseRoboResponse {
  String reference;
  Status status;
  Result result;

  BaseRoboResponse({this.status, this.result});

  BaseRoboResponse.fromJson(Map<String, dynamic> json) {
    reference = json['reference'];
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reference'] = this.reference;
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}
