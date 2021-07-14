import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:robo_front/model/base_response.dart';
import 'package:robo_front/model/product.dart';
import 'package:robo_front/model/product_type.dart';
import 'package:robo_front/reusableResources/reusable_card.dart';
import 'package:robo_front/reusableResources/staggered_grid.dart';
import 'package:robo_front/screens/cart_screen.dart';
import 'package:robo_front/http/robo_back_client.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:robo_front/utils/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({@required this.productTypes});

  final BaseRoboResponse productTypes;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  var test;
  int displayLengthProductTypes, displayLengthProducts, currentIndex;
  bool isProductType;

  BaseRoboResponse displaydetails;
  List<ProductType> productTypes;
  List<Product> products;

  double totalPurchaseAmount = 0;

  @override
  void initState() {
    super.initState();
    displaydetails = widget.productTypes;
    productTypes = displaydetails.result.productTypes;
    isProductType = true;
    displayLengthProductTypes = productTypes.length;
    //print(productTypes.result.productTypes[0].storeID);
  }

  void getProducts(ProductType productType) async {
    // BaseRoboResponse response =
    //     await RoboBackClient().getProducts(productTypeID, 1, 1);

    setState(() {
      //displaydetails = response;
      products = productType.productItem;
      displayLengthProducts = products.length;
      isProductType = false;
    });
  }

  void purchaseCart(int request) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CartScreen(basket: request);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          purchaseCart(1);
        },
        child: Icon(Icons.bolt),
        backgroundColor: kAppColourGreen,
      ),
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
          GestureDetector(
            onTap: () {
              setState(() {
                isProductType = true;
              });
            },
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 5.0),
              height: 40.0,
              child: Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              margin: EdgeInsets.all(7.0),
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: isProductType
                    ? displayLengthProductTypes
                    : displayLengthProducts,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () {
                    if (isProductType) {
                      getProducts(productTypes[index]);
                    } else {
                      setState(() {
                        totalPurchaseAmount += products[index].salePrice;
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: kAppColourGreen,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: ThemeData.dark().cardColor,
                          blurRadius: 1.0,
                          spreadRadius: 0.0,
                          offset: Offset(
                              1.0, 1.0), // shadow direction: bottom right
                        )
                      ],
                    ),
                    child: Center(
                      child: new Text(
                        isProductType
                            ? productTypes[index].productTypeName
                            : products[index].productName,
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
          ),
        ],
      ),
    );
  }
}
