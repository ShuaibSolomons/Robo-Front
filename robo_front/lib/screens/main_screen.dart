import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:robo_front/model/base_response.dart';
import 'package:robo_front/model/basket_item.dart';
import 'package:robo_front/model/cart_purchase_preview.dart';
import 'package:robo_front/reusableResources/alert_dialogue.dart';
import 'package:robo_front/screens/account_screen.dart';
import 'package:robo_front/screens/cart_edit_screen.dart';
import 'package:robo_front/screens/recent_purchases_screen.dart';
import 'package:robo_front/utils/constants.dart';
import 'package:robo_front/utils/enum.dart';

import 'cart_purchase_preview_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({@required this.productTypes});

  final BaseRoboResponse productTypes;
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  int currentIndex;
  double totalBasketAmount = 0;
  BaseRoboResponse displaydetails;
  List<BasketItem> basketItems = [];

  void setFullState(
      double _totalBasketAmount, List<BasketItem> _basketList, int index) {
    setBasketState(_totalBasketAmount, _basketList);
    setState(() {
      _listKey.currentState
          .insertItem(basketItems.length == 0 ? 0 : basketItems.length - 1);
    });
  }

  void clearAnimatedList() {
    for (var i = 0; i <= basketItems.length - 1; i++) {
      _listKey.currentState.removeItem(0,
          (BuildContext context, Animation<double> animation) {
        return Container();
      });
    }
  }

  void setBasketState(dynamic totalBasketAmount, List<BasketItem> _basketList) {
    setState(() {
      this.totalBasketAmount = totalBasketAmount.toDouble();
      this.basketItems = _basketList;
    });
  }

  void purchaseCart(List<BasketItem> request) async {
    CartPurchasePreviewModel response = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return CartPurchasePreviewScreen(
            basketItems: request,
            totalBasketAmount: totalBasketAmount,
          );
        },
      ),
    );

    if (response != null) {
      if (response.screemRoute == CartPurchasePreviewResponse.CLEAR) {
        clearAnimatedList();
        setBasketState(0, []);
      } else if (response.screemRoute == CartPurchasePreviewResponse.PURCHASE) {
        if (response.responseStatus == PurchaseResponseStatus.SUCCESS) {
          clearAnimatedList();
          setBasketState(0, []);
        }
        changePage(HomeScreen.homeScreenIndex);
      } else {
        changePage(CartEditScreen.cartEditScreen);
      }
    }
  }

  @override
  void initState() {
    displaydetails = widget.productTypes;
    super.initState();
    currentIndex = 1;
    //print(productTypes.result.productTypes[0].storeID);
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: kIconImage,
      ),
      floatingActionButton: GestureDetector(
        onLongPress: () {
          if (basketItems.length != 0) {
            return showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialogueRobo(
                  clearAnimatedList: clearAnimatedList,
                  setBasketState: setBasketState,
                  title: kClearBasketTitle,
                  content: kClearBasketContent),
            );
          } else {
            print('Empty Basket');
          }
        },
        child: FloatingActionButton(
          onPressed: () {
            if (basketItems.length != 0) {
              purchaseCart(basketItems);
            }
          },
          child: Icon(Icons.bolt),
          backgroundColor: kAppColourGreen,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        backgroundColor: ThemeData.dark().backgroundColor,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        fabLocation: BubbleBottomBarFabLocation.end,
        hasNotch: true,
        hasInk: true,
        inkColor: kAppColourGreen,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            title: Text(
              "Transact",
              style: TextStyle(color: Colors.white),
            ),
          ),
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.receipt_long,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.receipt_long,
                color: Colors.white,
              ),
              title: Text(
                "Recent",
                style: TextStyle(color: Colors.white),
              )),
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              title: Text(
                "Cart",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      // body: currentIndex == 0
      //     ? purchase
      //     : (currentIndex == 1 ? RecentPurchasesScreen() : AccountScreen()),
      body: IndexedStack(
        children: [
          HomeScreen(
            productTypes: displaydetails,
            setBasket: setFullState,
            totalBasketAmount: totalBasketAmount,
            basketItems: basketItems,
          ),
          RecentPurchasesScreen(),
          CartEditScreen(
            totalBasketAmount: totalBasketAmount,
            basketItems: basketItems,
            setBasket: setBasketState,
            listKey: _listKey,
          ),
        ],
        index: currentIndex,
      ),
    );
  }
}
