class Product {
  int productID;
  String productTypeName;
  int productTypeID;
  String productName;
  dynamic costPrice;
  dynamic salePrice;
  dynamic profitAmount;
  String originCountry;
  String originCurrencyCode;
  bool customerShouldSetValue;
  Null productLogoUrl;
  int storeID;
  int companyID;
  int supplierID;

  Product(
      {this.productID,
      this.productTypeName,
      this.productTypeID,
      this.productName,
      this.costPrice,
      this.salePrice,
      this.profitAmount,
      this.originCountry,
      this.originCurrencyCode,
      this.customerShouldSetValue,
      this.productLogoUrl,
      this.storeID,
      this.companyID,
      this.supplierID});

  Product.fromJson(Map<String, dynamic> json) {
    productID = json['productID'];
    productTypeName = json['productTypeName'];
    productTypeID = json['productTypeID'];
    productName = json['productName'];
    costPrice = json['costPrice'];
    salePrice = json['salePrice'];
    profitAmount = json['profitAmount'];
    originCountry = json['originCountry'];
    originCurrencyCode = json['originCurrencyCode'];
    customerShouldSetValue = json['customerShouldSetValue'];
    productLogoUrl = json['productLogoUrl'];
    storeID = json['storeID'];
    companyID = json['companyID'];
    supplierID = json['supplierID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productID'] = this.productID;
    data['productTypeName'] = this.productTypeName;
    data['productTypeID'] = this.productTypeID;
    data['productName'] = this.productName;
    data['costPrice'] = this.costPrice;
    data['salePrice'] = this.salePrice;
    data['profitAmount'] = this.profitAmount;
    data['originCountry'] = this.originCountry;
    data['originCurrencyCode'] = this.originCurrencyCode;
    data['customerShouldSetValue'] = this.customerShouldSetValue;
    data['productLogoUrl'] = this.productLogoUrl;
    data['storeID'] = this.storeID;
    data['companyID'] = this.companyID;
    data['supplierID'] = this.supplierID;
    return data;
  }
}
