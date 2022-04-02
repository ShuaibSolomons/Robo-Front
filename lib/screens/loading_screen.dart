import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:robo_front/http/robo_back_client.dart';
import 'package:robo_front/model/base_response.dart';
import 'package:robo_front/reusableResources/error_dialogue.dart';
import 'package:robo_front/reusableResources/loading_widget.dart';
import 'package:robo_front/screens/main_screen.dart';

class LoadingScreen extends StatefulWidget {
  static String id = 'loading_screen';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late BaseRoboResponse menu;

  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  bool getCurrentUser() {
    final user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    if (getCurrentUser()) {
      getMenu(9, 13, loggedInUser.uid);
    } else {
      Navigator.pop(context);
    }
  }

  void getMenu(int storeID, int companyID, String employeeID) async {
    try {
      menu = await RoboBackClient().getMenu(storeID, companyID, employeeID);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return MainScreen(
          productTypes: menu,
        );
      }), (route) => false);
    } catch (e) {
      print(e);

      showDialog(
        context: context,
        builder: (BuildContext context) => ErrorDialogueRobo(),
      ).then(
        (value) => Navigator.pop(context),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      setColor: null,
    );
  }
}
