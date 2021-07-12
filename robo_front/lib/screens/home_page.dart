import 'package:flutter/material.dart';
import 'package:robo_front/model/base_response.dart';
import 'package:robo_front/reusableResources/reusable_card.dart';
import 'package:robo_front/reusableResources/staggered_grid.dart';
import 'package:robo_front/screens/purchase_page.dart';
import 'package:robo_front/http/robo_back_client.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({@required this.productTypes});

  final BaseResponse productTypes;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var test;

  int displayLength;

  BaseResponse displaydetails;

  double totalPurchaseAmount = 0;

  void getProducts(int productTypeID) async {
    BaseResponse response =
        await RoboBackClient().getProducts(productTypeID, 1, 1);
    setState(() {
      displaydetails = response;
    });
    displayLength = response.result.products.length;
  }

  @override
  void initState() {
    super.initState();
    displaydetails = widget.productTypes;
    displayLength = displaydetails.result.productTypes.length;
    //print(productTypes.result.productTypes[0].storeID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Center(
                      child: Text(
                        totalPurchaseAmount.toString(),
                        style: TextStyle(fontSize: 40.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: displayLength,
              itemBuilder: (BuildContext context, int index) => Container(
                color: Colors.green,
                child: GestureDetector(
                  onTap: () {
                    if (displaydetails.result.productTypes != null) {
                      getProducts(displaydetails
                          .result.productTypes[index].productTypeID);
                    } else {
                      setState(() {
                        totalPurchaseAmount +=
                            displaydetails.result.products[index].salePrice;
                      });
                    }
                  },
                  child: Center(
                    child: new Text(
                      displaydetails.result.productTypes == null
                          ? displaydetails.result.products[index].productName
                          : displaydetails
                              .result.productTypes[index].productTypeName,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(2, index.isEven ? 1.3 : 1.1),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
          // Expanded(
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: GestureDetector(
          //           onTap: () {
          //             print("To clear object");
          //           },
          //           child: Expanded(
          //             child: Center(
          //               child: Text("Clear"),
          //             ),
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         child: GestureDetector(
          //           onTap: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => PurchasePage(basket: test),
          //               ),
          //             );
          //           },
          //           child: Center(
          //             child: Text("Review"),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
