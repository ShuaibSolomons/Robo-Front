import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:robo_front/reusableResources/rounded_button.dart';
import 'package:robo_front/utils/constants.dart';

class CompanyRegistration extends StatefulWidget {
  static String id = 'company_registration';
  @override
  _CompanyRegistrationState createState() => _CompanyRegistrationState();
}

class _CompanyRegistrationState extends State<CompanyRegistration> {
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    bool _spinner = false;

    String companyName, originCountry, storeNumber, storeName, storeAddress;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'logo',
                child: Container(
                  height: 50.0,
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
                    companyName = value;
                  }
                },
                decoration: kInputDecoration.copyWith(hintText: 'Company Name'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  if (value != null) {
                    originCountry = value;
                  }
                },
                decoration:
                    kInputDecoration.copyWith(hintText: 'Origin Country'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  if (value != null) {
                    storeName = value;
                  }
                },
                decoration: kInputDecoration.copyWith(hintText: 'Store Name'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  if (value != null) {
                    storeNumber = value;
                  }
                },
                decoration: kInputDecoration.copyWith(hintText: 'Store Number'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  if (value != null) {
                    storeAddress = value;
                  }
                },
                decoration:
                    kInputDecoration.copyWith(hintText: 'Store Address'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Create Company',
                onPunch: () async {
                  try {
                    setState(() {
                      _spinner = true;
                    });
                    // final validUser = await _auth.signInWithEmailAndPassword(
                    //     email: email, password: password);
                    // if (validUser != null) {
                    //   setState(() {
                    //     _spinner = false;
                    //   });
                    //   Navigator.pushNamed(context, LoadingScreen.id);
                    // }
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
    );
  }
}
