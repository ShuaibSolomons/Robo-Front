import 'package:robo_front/model/store_detail.dart';

class Scope {
  late StoreDetail storeDetail;
  late int companyID;

  Scope({required this.storeDetail, required this.companyID});

  Scope.fromJson(Map<String, dynamic> json) {
    storeDetail = (json['storeDetail'] != null
        ? new StoreDetail.fromJson(json['storeDetail'])
        : null)!;
    companyID = json['companyID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.storeDetail != null) {
      data['storeDetail'] = this.storeDetail.toJson();
    }
    data['companyID'] = this.companyID;
    return data;
  }
}
