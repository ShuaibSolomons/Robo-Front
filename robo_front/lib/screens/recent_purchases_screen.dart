import 'package:flutter/material.dart';

class RecentPurchasesScreen extends StatefulWidget {
  static const recentPurchasesScreen = 1;
  @override
  _RecentPurchasesScreenState createState() => _RecentPurchasesScreenState();
}

class _RecentPurchasesScreenState extends State<RecentPurchasesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Recent Purchases Screen'),
      ),
    );
  }
}
