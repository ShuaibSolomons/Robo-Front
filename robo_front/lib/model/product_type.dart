class ProductType {
  int productTypeFilterID;
  int productTypeID;
  String productTypeName;
  int storeID;
  int companyID;
  String createdOn;

  ProductType(
      {this.productTypeFilterID,
      this.productTypeID,
      this.productTypeName,
      this.storeID,
      this.companyID,
      this.createdOn});

  ProductType.fromJson(Map<String, dynamic> json) {
    productTypeFilterID = json['productTypeFilterID'];
    productTypeID = json['productTypeID'];
    productTypeName = json['productTypeName'];
    storeID = json['storeID'];
    companyID = json['companyID'];
    createdOn = json['createdOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productTypeFilterID'] = this.productTypeFilterID;
    data['productTypeID'] = this.productTypeID;
    data['productTypeName'] = this.productTypeName;
    data['storeID'] = this.storeID;
    data['companyID'] = this.companyID;
    data['createdOn'] = this.createdOn;
    return data;
  }
}
