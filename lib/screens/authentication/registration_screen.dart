import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:robo_front/reusableResources/rounded_button.dart';
import 'package:robo_front/screens/loading_screen.dart';
import 'package:robo_front/screens/register/company_selection.dart';
import 'package:robo_front/screens/register/user_detail.dart';
import 'package:robo_front/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email, password;
  bool _spinner = false;

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
                      email = value;
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
                      password = value;
                    },
                    decoration: kInputDecoration.copyWith(
                        hintText: 'Enter your password'),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  RoundedButton(
                    title: 'Register',
                    onPunch: () async {
                      try {
                        setState(() {
                          _spinner = true;
                        });
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        if (newUser != null) {
                          setState(() {
                            _spinner = false;
                          });
                          Navigator.pushNamed(context, UserDetail.id);
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
                    color: kAppColourBlue,
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
