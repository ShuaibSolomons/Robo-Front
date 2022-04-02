import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:robo_front/http/robo_back_client.dart';
import 'package:robo_front/model/base_response.dart';
import 'package:robo_front/model/basket_item.dart';
import 'package:robo_front/model/cart_purchase_preview.dart';
import 'package:robo_front/model/results.dart';
import 'package:robo_front/reusableResources/alert_dialogue.dart';
import 'package:robo_front/reusableResources/info_dialogue.dart';
import 'package:robo_front/screens/cart_edit_screen.dart';
import 'package:robo_front/screens/recent_purchases_screen.dart';
import 'package:robo_front/utils/constants.dart';
import 'package:robo_front/utils/enumeration.dart';

import 'cart_purchase_preview_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({required this.productTypes});

  final BaseRoboResponse productTypes;
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  late AnimationController _animationController;

  String _scanBarcode = 'Unknown';

  late int currentIndex;
  double totalBasketAmount = 0;
  late BaseRoboResponse displaydetails;
  List<BasketItem> basketItems = [];

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);

    displaydetails = widget.productTypes;
    super.initState();
    currentIndex = 1;
    //print(productTypes.result.productTypes[0].storeID);
  }

  void setFullState(
      double _totalBasketAmount, List<BasketItem> _basketList, int index) {
    setBasketState(_totalBasketAmount, _basketList);
    setState(() {
      _listKey.currentState!
          .insertItem(basketItems.length == 0 ? 0 : basketItems.length - 1);
    });
  }

  void clearAnimatedList() {
    for (var i = 0; i <= basketItems.length - 1; i++) {
      _listKey.currentState!.removeItem(0,
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
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) => InfoDialogueRobo(
                  title: 'Purchase Failed', content: 'Please try again later'));
        }
        changePage(HomeScreen.homeScreenIndex);
      } else {
        changePage(CartEditScreen.cartEditScreen);
      }
    } else {
      print('response is null');
      InfoDialogueRobo(
          title: 'Purchase Failed', content: 'Please try again later');
    }
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget clearBasket() {
    return Container(
      child: FloatingActionButton(
        onPressed: (() {
          if (basketItems.length != 0) {
            showDialog(
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
        }),
        tooltip: 'Clear Basket',
        child: Icon(Icons.clear_all),
        heroTag: "clearBasket",
      ),
    );
  }

  Widget purchaseBasket() {
    return Container(
      child: FloatingActionButton(
        onPressed: (() {
          if (basketItems.length != 0) {
            purchaseCart(basketItems);
          }
        }),
        tooltip: 'Purchase Basket',
        child: Icon(Icons.shopping_cart),
        heroTag: "purchaseBasket",
      ),
    );
  }

  Widget scanItem() {
    return Container(
      child: FloatingActionButton(
        onPressed: (() {
          scanBarcodeNormal();
        }),
        tooltip: 'Scan Item',
        child: Icon(Icons.qr_code),
        heroTag: "scanItem",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: kIconImage,
      ),
      floatingActionButton: AnimatedFloatingActionButton(
        fabButtons: <Widget>[scanItem(), purchaseBasket()],
        colorStartAnimation: kAppColourGreen,
        colorEndAnimation: Colors.white,
        animatedIconData: AnimatedIcons.menu_close,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BubbleBottomBar(
        backgroundColor: ThemeData.dark().backgroundColor,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
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
                Icons.shopping_bag_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
              title: Text(
                "Cart",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
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

  void addItem(Result result) {
    if (result.product != null) {
      basketItems.add(
        new BasketItem(
          index: basketItems.length,
          productID: result.product.productID,
          amountValue: result.product.salePrice,
          amount: result.product.salePrice.toString(),
          productName: result.product.productName,
        ),
      );
      setFullState(
          (totalBasketAmount + result.product.salePrice), basketItems, 0);
    }
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    BaseRoboResponse response = await RoboBackClient().getProductByBarcode(
        13, barcodeScanRes.replaceAll(new RegExp(r'[^\w\s]+'), ''));
    setState(() {
      print("This is the barcode: " + barcodeScanRes);
      _scanBarcode = barcodeScanRes;
      if (response != null && response.result != null) {
        addItem(response.result);
      } else {}
    });
  }
}
