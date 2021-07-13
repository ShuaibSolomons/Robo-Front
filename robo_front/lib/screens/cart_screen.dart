import 'package:flutter/material.dart';

// stateless widget because I only want this page to be as if it were a receipt where no edits can occur
class CartScreen extends StatelessWidget {
  CartScreen({@required this.basket});

  // This will be the main basket which will be an overview of all
  // the products and how much it amounts to
  final Object basket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.park_rounded),
      ),
      body: Container(
        child: Center(
          child: Text("This is the purchase cart screen"),
        ),
      ),
    );
  }
}
