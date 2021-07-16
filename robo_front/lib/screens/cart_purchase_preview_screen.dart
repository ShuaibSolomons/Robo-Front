import 'package:flutter/material.dart';
import 'package:robo_front/model/base_request.dart';
import 'package:robo_front/model/base_response.dart';
import 'package:robo_front/model/basket_item.dart';
import 'package:robo_front/model/scope.dart';
import 'package:robo_front/model/store_detail.dart';
import 'package:robo_front/utils/Constant.dart';
import '../http/robo_back_client.dart';

class CartPurchasePreviewScreen extends StatelessWidget {
  const CartPurchasePreviewScreen({@required this.basketItems});

  final List<BasketItem> basketItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: kIconImage,
        ),
        body: Column(
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Clear'),
                ),
                TextButton(
                  onPressed: () {
                    purchaseBasket(basketItems);
                  },
                  child: Text('Purchase'),
                )
              ],
            )
          ],
        ));
  }
}

Future<BaseRoboResponse> purchaseBasket(List<BasketItem> basketItems) async {
  BaseRoboRequest request = createRequest(basketItems);
  BaseRoboResponse response = await RoboBackClient().purchaseBasket(request);
  print(response.reference);
  return response;
}

BaseRoboRequest createRequest(List<BasketItem> basketItems) {
  StoreDetail storeDetail = new StoreDetail(
      storeID: '0001', employeeID: '01', transactionID: 1, countryCode: 'ZA');
  Scope scope = new Scope(storeDetail: storeDetail, companyID: 1);

  BaseRoboRequest request =
      new BaseRoboRequest(scope: scope, basketPurchase: basketItems);
  return request;
}
