class StoreCreationRequest {
  late String storeNumber;
  late String storeName;
  late String storeAddress;
  late String employeeID;
  late int companyID;

  StoreCreationRequest(
      {required this.storeNumber,
      required this.storeName,
      required this.storeAddress,
      required this.employeeID,
      required this.companyID});

  StoreCreationRequest.fromJson(Map<String, dynamic> json) {
    storeNumber = json['storeNumber'];
    storeName = json['storeName'];
    storeAddress = json['storeAddress'];
    employeeID = json['employeeID'];
    companyID = json['companyID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['storeNumber'] = this.storeNumber;
    data['storeName'] = this.storeName;
    data['storeAddress'] = this.storeAddress;
    data['employeeID'] = this.employeeID;
    data['companyID'] = this.companyID;
    return data;
  }
}
