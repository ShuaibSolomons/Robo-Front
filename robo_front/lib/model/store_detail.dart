class StoreDetail {
  String storeID;
  String employeeID;
  int transactionID;
  String countryCode;

  StoreDetail(
      {this.storeID, this.employeeID, this.transactionID, this.countryCode});

  StoreDetail.fromJson(Map<String, dynamic> json) {
    storeID = json['storeID'];
    employeeID = json['employeeID'];
    transactionID = json['transactionID'];
    countryCode = json['countryCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['storeID'] = this.storeID;
    data['employeeID'] = this.employeeID;
    data['transactionID'] = this.transactionID;
    data['countryCode'] = this.countryCode;
    return data;
  }
}
