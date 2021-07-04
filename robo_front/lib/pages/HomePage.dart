import 'package:flutter/material.dart';
import 'package:robo_front/reusableResources/ReusableCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
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
            flex: 3,
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
          Container(
            child: Center(
              child: Text(
                "Test",
              ),
            ),
            height: 50.0,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
