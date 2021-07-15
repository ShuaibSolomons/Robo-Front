import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:robo_front/model/base_response.dart';
import 'package:robo_front/model/basket_item.dart';
import 'package:robo_front/screens/account_screen.dart';
import 'package:robo_front/screens/cart_edit_screen.dart';
import 'package:robo_front/screens/recent_purchases_screen.dart';
import 'package:robo_front/utils/constant.dart';

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
      _listKey.currentState.insertItem(basketItems.length - 1);
    });
  }

  void setBasketState(double _totalBasketAmount, List<BasketItem> _basketList) {
    setState(() {
      this.totalBasketAmount = _totalBasketAmount;
      this.basketItems = _basketList;
    });
    print(basketItems.length);
  }

  void purchaseCart(int request) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CartPurchasePreviewScreen();
    }));
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          purchaseCart(1);
        },
        child: Icon(Icons.bolt),
        backgroundColor: kAppColourGreen,
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
