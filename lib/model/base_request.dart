import 'package:robo_front/model/scope.dart';

import 'basket_item.dart';

class BaseRoboRequest {
  late Scope scope;
  late List<BasketItem> basketPurchase;

  BaseRoboRequest({required this.scope, required this.basketPurchase});

  BaseRoboRequest.fromJson(Map<String, dynamic> json) {
    scope = (json['scope'] != null ? new Scope.fromJson(json['scope']) : null)!;
    if (json['basketPurchase'] != null) {
      basketPurchase = [];
      json['basketPurchase'].forEach((v) {
        basketPurchase.add(new BasketItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.scope != null) {
      data['scope'] = this.scope.toJson();
    }
    if (this.basketPurchase != null) {
      data['basketPurchase'] =
          this.basketPurchase.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
