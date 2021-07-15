import 'package:flutter/material.dart';
import 'package:robo_front/model/basket_item.dart';
import 'package:robo_front/reusableResources/amount_display_widget.dart';
import 'package:robo_front/reusableResources/list_item_widget.dart';

// stateless widget because I only want this page to be as if it were a receipt where no edits can occur
class CartEditScreen extends StatelessWidget {
  CartEditScreen({
    @required this.basketItems,
    @required this.totalBasketAmount,
    @required this.setBasket,
    @required this.listKey,
  });

  // This will be the main basket which will be an overview of all
  // the products and how much it amounts to
  final Function setBasket;
  final List<BasketItem> basketItems;
  final double totalBasketAmount;
  final GlobalKey<AnimatedListState> listKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: AmountDisplayWidget(
              totalBasketAmount: totalBasketAmount,
            ),
          ),
          Container(
            height: 40.0,
          ),
          Expanded(
            flex: 8,
            child: AnimatedList(
              key: listKey,
              initialItemCount: basketItems.length,
              itemBuilder: (context, index, animation) => ListItemWidget(
                item: basketItems[index],
                animation: animation,
                onClicked: () {
                  removeItem(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void removeItem(int index) {
    BasketItem removedItem = basketItems[index];

    basketItems.removeAt(index);
    setBasket((totalBasketAmount - removedItem.amountValue), basketItems);

    listKey.currentState.removeItem(
      index,
      (context, animation) => ListItemWidget(
          item: removedItem, animation: animation, onClicked: () {}),
    );
  }
}
