import 'package:flutter/material.dart';
import 'package:robo_front/reusableResources/rounded_button.dart';
import 'package:robo_front/screens/authentication/welcome_screen.dart';
import 'package:robo_front/screens/loading_screen.dart';
import 'package:robo_front/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('assets/images/Robo_Inverse.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration:
                    kInputDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration:
                    kInputDecoration.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Log in',
                onPunch: () {
                  Navigator.pushNamed(context, LoadingScreen.id);
                },
                color: kAppColourBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
