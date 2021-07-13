import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:robo_front/http/robo_back_client.dart';
import 'package:robo_front/model/base_response.dart';
import 'package:robo_front/screens/home_screen.dart';
import 'package:robo_front/screens/main_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  BaseRoboResponse menu;

  @override
  void initState() {
    super.initState();
    getMenu(1, 1);
    print(menu);
  }

  void getMenu(int storeID, int companyID) async {
    menu = await RoboBackClient().getMenu(storeID, companyID);

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return MainScreen(
        productTypes: menu,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: Color(0xff00a572),
          size: 75.0,
        ),
      ),
    );
  }
}
