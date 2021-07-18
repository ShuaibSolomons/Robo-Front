import 'package:flutter/material.dart';
import 'package:robo_front/utils/Constant.dart';

class ElevatedButtonRound extends StatelessWidget {
  const ElevatedButtonRound(
      {@required this.onPressedDo, @required this.wording});

  final Function onPressedDo;
  final String wording;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 130, height: 45),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 20,
          primary: kAppColourGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          onPressedDo();
        },
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            '$wording',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
