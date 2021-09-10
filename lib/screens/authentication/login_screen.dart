import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
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
  final _auth = FirebaseAuth.instance;
  bool _spinner = false;

  String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
      body: ModalProgressHUD(
        inAsyncCall: _spinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200.0,
                      child: GestureDetector(
                        onDoubleTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset('assets/images/Robo_Inverse.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      if (value != null) {
                        email = value;
                      }
                    },
                    decoration:
                        kInputDecoration.copyWith(hintText: 'Enter your email'),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      if (value != null) {
                        password = value;
                      }
                    },
                    decoration: kInputDecoration.copyWith(
                        hintText: 'Enter your password'),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  RoundedButton(
                    title: 'Log in',
                    onPunch: () async {
                      try {
                        setState(() {
                          _spinner = true;
                        });
                        final validUser =
                            await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                        if (validUser != null) {
                          setState(() {
                            _spinner = false;
                          });
                          Navigator.pushNamed(context, LoadingScreen.id);
                        }
                        setState(() {
                          _spinner = false;
                        });
                      } catch (e) {
                        print(e);
                        setState(() {
                          _spinner = false;
                        });
                      }
                    },
                    color: kAppColourGreen,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
