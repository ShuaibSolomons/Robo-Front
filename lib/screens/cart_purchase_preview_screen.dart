import 'package:flutter/material.dart';
import 'package:robo_front/model/base_request.dart';
import 'package:robo_front/model/base_response.dart';
import 'package:robo_front/model/basket_item.dart';
import 'package:robo_front/model/cart_purchase_preview.dart';
import 'package:robo_front/model/scope.dart';
import 'package:robo_front/model/store_detail.dart';
import 'package:robo_front/reusableResources/alert_dialogue.dart';
import 'package:robo_front/reusableResources/elevated_button.dart';
import 'package:robo_front/reusableResources/loading_widget.dart';
import 'package:robo_front/utils/constants.dart';
import 'package:robo_front/utils/enumeration.dart';
import '../http/robo_back_client.dart';

class CartPurchasePreviewScreen extends StatefulWidget {
  const CartPurchasePreviewScreen(
      {@required this.basketItems, this.totalBasketAmount});

  final List<BasketItem> basketItems;
  final double totalBasketAmount;

  @override
  _CartPurchasePreviewScreenState createState() =>
      _CartPurchasePreviewScreenState();
}

class _CartPurchasePreviewScreenState extends State<CartPurchasePreviewScreen> {
  bool _isLoading = false;

  List _buildList() {
    List<Widget> listItems = [];
    widget.basketItems.forEach(
      (element) {
        listItems.add(
          Container(
              padding: EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${element.productName}',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${element.amountValue}',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              )),
        );
      },
    );
    return listItems;
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? LoadingWidget(
            setColor: Color(0x33000000),
          )
        : Scaffold(
            appBar: AppBar(
              title: kIconImage,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Center(
                    child: Container(
                      width: 350.0,
                      padding: EdgeInsets.all(20.0),
                      margin: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              'This is your receipt',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            child: Text(
                              '${widget.totalBasketAmount}',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Divider(color: Colors.black),
                          ),
                          Expanded(
                            child: CustomScrollView(
                              shrinkWrap: true,
                              slivers: [
                                SliverList(
                                    delegate:
                                        SliverChildListDelegate(_buildList()))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    //color: ThemeData.dark().primaryColorDark,
                    padding: EdgeInsets.only(bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onLongPress: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  AlertDialogueRobo(
                                      clearAnimatedList: () {
                                        onPopNavigation(
                                            context,
                                            CartPurchasePreviewModel(
                                                screemRoute:
                                                    CartPurchasePreviewResponse
                                                        .CLEAR));
                                      },
                                      title: kClearBasketTitle,
                                      content: kClearBasketContent),
                            );
                          },
                          child: ElevatedButtonRound(
                            onPressedDo: () {
                              onPopNavigation(
                                  context,
                                  CartPurchasePreviewModel(
                                      screemRoute:
                                          CartPurchasePreviewResponse.EDIT));
                            },
                            wording: 'Edit',
                          ),
                        ),
                        ElevatedButtonRound(
                          onPressedDo: () {
                            if (widget.basketItems.length != 0) {
                              setState(() => _isLoading = true);
                              purchaseBasket(context, widget.basketItems);
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
  if (response != null) {
    onPopNavigation(
        context,
        CartPurchasePreviewModel(
            screemRoute: CartPurchasePreviewResponse.PURCHASE,
            responseStatus: response.status.id == 0
                ? PurchaseResponseStatus.SUCCESS
                : PurchaseResponseStatus.FAILED));
  } else {
    Navigator.pop(
      context,
      CartPurchasePreviewModel(
          screemRoute: CartPurchasePreviewResponse.PURCHASE,
          responseStatus: PurchaseResponseStatus.FAILED),
    );
  }
}

void onPopNavigation(
    BuildContext context, CartPurchasePreviewModel navigateModel) {
  if (navigateModel != null) {
    if (navigateModel.screemRoute == CartPurchasePreviewResponse.CLEAR) {
      Navigator.pop(
        context,
        navigateModel,
      );
    } else if (navigateModel.screemRoute ==
        CartPurchasePreviewResponse.PURCHASE) {
      Navigator.pop(
        context,
        navigateModel,
      );
    } else if (navigateModel.screemRoute == CartPurchasePreviewResponse.EDIT) {
      Navigator.pop(
        context,
        navigateModel,
      );
    }
  }
}

BaseRoboRequest createRequest(List<BasketItem> basketItems) {
  StoreDetail storeDetail = new StoreDetail(
      storeID: '0001',
      employeeID: '00000000-shu-aib-00000000',
      transactionID: 1,
      countryCode: 'ZA');
  Scope scope = new Scope(storeDetail: storeDetail, companyID: 1);

  BaseRoboRequest request =
      new BaseRoboRequest(scope: scope, basketPurchase: basketItems);
  return request;
}

class MySeparator extends StatelessWidget {
  final double height;
  final Color color;

  const MySeparator({this.height = 1, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
