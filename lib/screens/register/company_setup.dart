import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:robo_front/http/robo_back_client.dart';
import 'package:robo_front/model/base_response.dart';
import 'package:robo_front/model/company_creation/company_creation.dart';
import 'package:robo_front/model/store_creation/store_creation_request.dart';
import 'package:robo_front/reusableResources/rounded_button.dart';
import 'package:robo_front/screens/loading_screen.dart';
import 'package:robo_front/utils/constants.dart';

class CompanySetup extends StatefulWidget {
  static String id = 'company_creation';
  @override
  _CompanySetupState createState() => _CompanySetupState();
}

class _CompanySetupState extends State<CompanySetup> {
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    bool _spinner = false;

    String companyName = "",
        originCountry = "",
        storeNumber = "",
        storeName = "",
        storeAddress = "";
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

                    BaseRoboResponse? response =
                        await RoboBackClient().createCompany(
                      CompanyCreation(
                          companyName: companyName,
                          originCountry: originCountry),
                    );

                    print(response);

                    if (response!.status.id == 0) {
                      BaseRoboResponse? storeResponse =
                          await RoboBackClient().createStore(
                        StoreCreationRequest(
                            storeNumber: storeNumber,
                            storeName: storeName,
                            storeAddress: storeAddress,
                            employeeID: _auth.currentUser!.uid,
                            companyID: response.result.companyDetail.companyID),
                      );
                      if (storeResponse!.status.id == 0) {
                        Navigator.pushNamed(context, LoadingScreen.id);
                      }
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
    );
  }
}
