import 'package:flutter/material.dart';

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const kTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const kInputDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kAppColourYellow, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kAppColourGreen = Color(0xff00a572);
const kAppColourOrange = Colors.deepOrangeAccent;
const kAppColourLightBlue = Colors.lightBlueAccent;
const kAppColourBlue = Colors.blueAccent;
const kAppColourYellow = Colors.yellowAccent;

const kIconImage = ImageIcon(AssetImage('assets/images/Robo.png'));

const kClearBasketTitle = 'Clear';
const kClearBasketContent = 'Are you sure you want to clear this basket';

const kHeroClear = 'clear_hero_transition';
