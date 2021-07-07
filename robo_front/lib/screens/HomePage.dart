import 'package:flutter/material.dart';
import 'package:robo_front/reusableResources/ReusableCard.dart';
import 'package:robo_front/screens/PurchasePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Object test;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Center(
                      child: Text(
                        "Hello world",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.0),
                        topRight: Radius.circular(35.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: ReusableCard(
                                  colour: ThemeData.dark().backgroundColor,
                                  cardChild: Center(
                                    child: Text("Testing"),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ReusableCard(
                                  colour: ThemeData.dark().backgroundColor,
                                  cardChild: Center(
                                    child: Text("Testing"),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: ReusableCard(
                                  colour: ThemeData.dark().backgroundColor,
                                  cardChild: Center(
                                    child: Text("Testing"),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ReusableCard(
                                  colour: ThemeData.dark().backgroundColor,
                                  cardChild: Center(
                                    child: Text("Testing"),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print("To clear object");
                    },
                    child: Expanded(
                      child: Center(
                        child: Text("Clear"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PurchasePage(basket: test),
                        ),
                      );
                    },
                    child: Center(
                      child: Text("Review"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
