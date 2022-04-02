class Product {
  late int productID;
  late String productTypeName;
  late int productTypeID;
  late String productName;
  late dynamic costPrice;
  late dynamic salePrice;
  late dynamic profitAmount;
  late String originCountry;
  late String originCurrencyCode;
  late bool customerShouldSetValue;
  late Null productLogoUrl;
  late int storeID;
  late int companyID;
  late String supplierID;

  Product(
      {required this.productID,
      required this.productTypeName,
      required this.productTypeID,
      required this.productName,
      this.costPrice,
      this.salePrice,
      this.profitAmount,
      required this.originCountry,
      required this.originCurrencyCode,
      required this.customerShouldSetValue,
      this.productLogoUrl,
      required this.storeID,
      required this.companyID,
      required this.supplierID});

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
