class StoreCreationRequest {
  String storeNumber;
  String storeName;
  String storeAddress;
  String employeeID;
  int companyID;

  StoreCreationRequest(
      {this.storeNumber,
      this.storeName,
      this.storeAddress,
      this.employeeID,
      this.companyID});

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
