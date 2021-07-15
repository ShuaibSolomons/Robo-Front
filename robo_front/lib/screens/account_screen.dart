import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  double amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Account Screen'),
      ),
    );
  }
}
