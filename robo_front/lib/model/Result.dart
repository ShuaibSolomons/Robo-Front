import 'product_type.dart';
import 'product.dart';

class Result {
  List<ProductType> productTypes;
  List<Product> products;

  Result({this.productTypes});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['productTypes'] != null) {
      productTypes = new List<ProductType>();
      json['productTypes'].forEach((v) {
        productTypes.add(new ProductType.fromJson(v));
      });
    } else if (json['products'] != null) {
      products = new List<Product>();
      json['products'].forEach((v) {
        products.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productTypes != null) {
      data['productTypes'] = this.productTypes.map((v) => v.toJson()).toList();
    } else if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
