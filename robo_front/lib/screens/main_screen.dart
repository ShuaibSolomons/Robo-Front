import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:robo_front/model/base_response.dart';
import 'package:robo_front/screens/account_screen.dart';
import 'package:robo_front/screens/recent_purchases_screen.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({@required this.productTypes});

  final BaseRoboResponse productTypes;
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex;

  BaseRoboResponse displaydetails;

  Widget purchase;

  @override
  void initState() {
    displaydetails = widget.productTypes;
    super.initState();
    currentIndex = 1;
    //print(productTypes.result.productTypes[0].storeID);
  }

  void changePage(int index) {
    setState(() {
      purchase = purchase;
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    purchase = HomeScreen(productTypes: displaydetails);

    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.park_rounded),
      ),
      bottomNavigationBar: BubbleBottomBar(
        backgroundColor: ThemeData.dark().backgroundColor,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        hasNotch: true,
        hasInk: true,
        inkColor: Color(0xff00a572),
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
                "Account",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      // body: currentIndex == 0
      //     ? purchase
      //     : (currentIndex == 1 ? RecentPurchasesScreen() : AccountScreen()),
      body: IndexedStack(
        children: [purchase, RecentPurchasesScreen(), AccountScreen()],
        index: currentIndex,
      ),
    );
  }
}
