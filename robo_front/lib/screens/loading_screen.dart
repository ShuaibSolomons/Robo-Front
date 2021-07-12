import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:robo_front/http/robo_back_client.dart';
import 'package:robo_front/model/base_response.dart';
import 'package:robo_front/screens/home_page.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  BaseResponse productTypes;

  @override
  void initState() {
    super.initState();
    getProductTypes(1, 1);
    print(productTypes);
  }

  void getProductTypes(int storeID, int companyID) async {
    productTypes = await RoboBackClient().getProductTypes(storeID, companyID);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage(
        productTypes: productTypes,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.green,
          size: 75.0,
        ),
      ),
    );
  }
}
