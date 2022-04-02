import 'package:robo_front/model/product.dart';

class ProductType {
  late int productTypeFilterID;
  late int productTypeID;
  late String productTypeName;
  late int storeID;
  late int companyID;
  late String createdOn;
  late List<Product> productItem;

  ProductType(
      {required this.productTypeFilterID,
      required this.productTypeID,
      required this.productTypeName,
      required this.storeID,
      required this.companyID,
      required this.createdOn,
      required this.productItem});

  ProductType.fromJson(Map<String, dynamic> json) {
    productTypeFilterID = json['productTypeFilterID'];
    productTypeID = json['productTypeID'];
    productTypeName = json['productTypeName'];
    storeID = json['storeID'];
    companyID = json['companyID'];
    createdOn = json['createdOn'];
    if (json['productItem'] != null) {
      productItem = [];
      json['productItem'].forEach((v) {
        productItem.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productTypeFilterID'] = this.productTypeFilterID;
    data['productTypeID'] = this.productTypeID;
    data['productTypeName'] = this.productTypeName;
    data['storeID'] = this.storeID;
    data['companyID'] = this.companyID;
    data['createdOn'] = this.createdOn;
    if (this.productItem != null) {
      data['productItem'] = this.productItem.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
