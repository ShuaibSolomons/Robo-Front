import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:robo_front/http/robo_back_client.dart';
import 'package:robo_front/model/base_response.dart';
import 'package:robo_front/reusableResources/loading_widget.dart';
import 'package:robo_front/screens/home_screen.dart';
import 'package:robo_front/screens/main_screen.dart';

class LoadingScreen extends StatefulWidget {
  static String id = 'loading_screen';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  BaseRoboResponse menu;

  @override
  void initState() {
    super.initState();
    getMenu(1, 1);
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
    return LoadingWidget();
  }
}
