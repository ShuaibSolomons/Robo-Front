class StoreDetailResponse {
  late int storeID;
  late String storeNumber;
  late String storeName;
  late String storeAddress;
  late String storeLng;
  late String storeLat;
  late String employeeID;
  late int companyID;
  late bool active;

  StoreDetailResponse(
      {required this.storeID,
      required this.storeNumber,
      required this.storeName,
      required this.storeAddress,
      required this.storeLng,
      required this.storeLat,
      required this.employeeID,
      required this.companyID,
      required this.active});

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
