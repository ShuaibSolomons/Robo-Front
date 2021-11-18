import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:robo_front/reusableResources/rounded_button.dart';
import 'package:robo_front/screens/register/company_selection.dart';
import 'package:robo_front/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetail extends StatefulWidget {
  static String id = 'user_detail';

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  bool _spinner = false;
  String fullname, msisdn;
  User loggedInUser;

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
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
      body: Padding(
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
                  keyboardType: TextInputType.name,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    if (value != null) {
                      fullname = value;
                    }
                  },
                  decoration: kInputDecoration.copyWith(hintText: 'Full name'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    if (value != null) {
                      msisdn = value;
                    }
                  },
                  decoration:
                      kInputDecoration.copyWith(hintText: 'Mobile number'),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  title: 'Create User',
                  onPunch: () async {
                    try {
                      setState(() {
                        _spinner = true;
                      });
                      if (fullname.isNotEmpty && msisdn.isNotEmpty) {
                        setState(() {
                          _spinner = false;
                        });
                        _firestore.collection('employeeDetail').add({
                          'fullName': fullname,
                          'msisdn': msisdn,
                          'userID': _auth.currentUser.uid
                        });
                        Navigator.pushNamed(context, CompanySelection.id)
                            .then((value) => Navigator.pop(context));
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
    );
  }
}
