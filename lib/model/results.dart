import 'package:robo_front/model/basket_item.dart';

import 'product_type.dart';
import 'product.dart';

class Result {
  List<ProductType> productTypes;
  List<Product> products;
  List<BasketItem> basketItems;

  Result({this.productTypes, this.products});

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
    } else if (json['basketItems'] != null) {
      basketItems = new List<BasketItem>();
      json['basketItems'].forEach((v) {
        basketItems.add(new BasketItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productTypes != null) {
      data['productTypes'] = this.productTypes.map((v) => v.toJson()).toList();
    } else if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    } else if (this.basketItems != null) {
      data['basketItems'] = this.basketItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
