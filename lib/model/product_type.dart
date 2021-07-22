import 'package:robo_front/model/product.dart';

class ProductType {
  int productTypeFilterID;
  int productTypeID;
  String productTypeName;
  int storeID;
  int companyID;
  String createdOn;
  List<Product> productItem;

  ProductType(
      {this.productTypeFilterID,
      this.productTypeID,
      this.productTypeName,
      this.storeID,
      this.companyID,
      this.createdOn,
      this.productItem});

  ProductType.fromJson(Map<String, dynamic> json) {
    productTypeFilterID = json['productTypeFilterID'];
    productTypeID = json['productTypeID'];
    productTypeName = json['productTypeName'];
    storeID = json['storeID'];
    companyID = json['companyID'];
    createdOn = json['createdOn'];
    if (json['productItem'] != null) {
      productItem = new List<Product>();
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
