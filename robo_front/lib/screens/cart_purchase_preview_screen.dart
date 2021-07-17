import 'package:flutter/material.dart';
import 'package:robo_front/model/base_request.dart';
import 'package:robo_front/model/base_response.dart';
import 'package:robo_front/model/basket_item.dart';
import 'package:robo_front/model/cart_purchase_preview.dart';
import 'package:robo_front/model/scope.dart';
import 'package:robo_front/model/store_detail.dart';
import 'package:robo_front/reusableResources/elevated_button.dart';
import 'package:robo_front/utils/Constant.dart';
import 'package:robo_front/utils/enum.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                height: 250,
                color: Colors.amber,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButtonRound(
                      onPressedDo: () {
                        Navigator.pop(
                          context,
                          CartPurchasePreviewModel(
                              screemRoute: CartPurchasePreviewResponse.EDIT),
                        );
                      },
                      wording: 'Edit',
                    ),
                    ElevatedButtonRound(
                      onPressedDo: () {
                        if (basketItems.length != 0) {
                          purchaseBasket(context, basketItems);
                        }
                      },
                      wording: 'Purchase',
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

void purchaseBasket(BuildContext context, List<BasketItem> basketItems) async {
  BaseRoboRequest request = createRequest(basketItems);
  BaseRoboResponse response = await RoboBackClient().purchaseBasket(request);
  print(response.reference);
  if (response != null) {
    if (response.status.id == 0) {
      Navigator.pop(
        context,
        CartPurchasePreviewModel(
            screemRoute: CartPurchasePreviewResponse.PURCHASE,
            responseStatus: PurchaseResponseStatus.SUCCESS),
      );
    } else {
      Navigator.pop(
        context,
        CartPurchasePreviewModel(
            screemRoute: CartPurchasePreviewResponse.PURCHASE,
            responseStatus: PurchaseResponseStatus.FAILED),
      );
    }
  } else {
    Navigator.pop(
      context,
      CartPurchasePreviewModel(
          screemRoute: CartPurchasePreviewResponse.PURCHASE,
          responseStatus: PurchaseResponseStatus.FAILED),
    );
  }
}

BaseRoboRequest createRequest(List<BasketItem> basketItems) {
  StoreDetail storeDetail = new StoreDetail(
      storeID: '0001', employeeID: '01', transactionID: 1, countryCode: 'ZA');
  Scope scope = new Scope(storeDetail: storeDetail, companyID: 1);

  BaseRoboRequest request =
      new BaseRoboRequest(scope: scope, basketPurchase: basketItems);
  return request;
}
