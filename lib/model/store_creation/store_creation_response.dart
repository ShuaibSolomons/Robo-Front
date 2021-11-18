class StoreDetailResponse {
  int storeID;
  String storeNumber;
  String storeName;
  String storeAddress;
  String storeLng;
  String storeLat;
  String employeeID;
  int companyID;
  bool active;

  StoreDetailResponse(
      {this.storeID,
      this.storeNumber,
      this.storeName,
      this.storeAddress,
      this.storeLng,
      this.storeLat,
      this.employeeID,
      this.companyID,
      this.active});

  StoreDetailResponse.fromJson(Map<String, dynamic> json) {
    storeID = json['storeID'];
    storeNumber = json['storeNumber'];
    storeName = json['storeName'];
    storeAddress = json['storeAddress'];
    storeLng = json['storeLng'];
    storeLat = json['storeLat'];
    employeeID = json['employeeID'];
    companyID = json['companyID'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['storeID'] = this.storeID;
    data['storeNumber'] = this.storeNumber;
    data['storeName'] = this.storeName;
    data['storeAddress'] = this.storeAddress;
    data['storeLng'] = this.storeLng;
    data['storeLat'] = this.storeLat;
    data['employeeID'] = this.employeeID;
    data['companyID'] = this.companyID;
    data['active'] = this.active;
    return data;
  }
}
