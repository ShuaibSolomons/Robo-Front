import 'package:robo_front/model/basket_item.dart';
import 'package:robo_front/model/company_creation/company_detail.dart';
import 'package:robo_front/model/store_creation/store_creation_response.dart';

import 'product_type.dart';
import 'product.dart';

class Result {
  late List<ProductType> productTypeDetails;
  late List<Product> products;
  late Product product;
  late List<BasketItem> basketItems;
  late CompanyDetail companyDetail;
  late StoreDetailResponse storeDetail;

  Result({required this.productTypeDetails, required this.products});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['productTypeDetails'] != null) {
      productTypeDetails = [];
      json['productTypeDetails'].forEach((v) {
        productTypeDetails.add(new ProductType.fromJson(v));
      });
    } else if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products.add(new Product.fromJson(v));
      });
    } else if (json['product'] != null) {
      product = new Product.fromJson(json['product']);
    } else if (json['basketItems'] != null) {
      basketItems = [];
      json['basketItems'].forEach((v) {
        basketItems.add(new BasketItem.fromJson(v));
      });
    } else if (json['companyDetail'] != null) {
      companyDetail = new CompanyDetail.fromJson(json['companyDetail']);
    } else if (json['storeDetail'] != null) {
      storeDetail = new StoreDetailResponse.fromJson(json['storeDetail']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productTypeDetails != null) {
      data['productTypeDetails'] =
          this.productTypeDetails.map((v) => v.toJson()).toList();
    } else if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    } else if (this.basketItems != null) {
      data['basketItems'] = this.basketItems.map((v) => v.toJson()).toList();
    } else if (this.companyDetail != null) {
      data['companyDetail'] = this.basketItems.map((v) => v.toJson());
    } else if (this.storeDetail != null) {
      data['storeDetail'] = this.basketItems.map((v) => v.toJson());
    } else if (this.product != null) {
      data['product'] = this.basketItems.map((v) => v.toJson());
    }
    return data;
  }
}
