import 'package:flutter/material.dart';
import 'package:robo_front/model/base_response.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGrid extends StatelessWidget {
  const StaggeredGrid({required this.display, required this.onPress});

  final BaseRoboResponse display;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: display.result.productTypeDetails.length,
      itemBuilder: (BuildContext context, int index) => new Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: GestureDetector(
          onTap: () {
            if (display.result.productTypeDetails != null) {}
          },
          child: Center(
            child: new CircleAvatar(
              backgroundColor: Colors.white,
              child: new Text('$index'),
            ),
          ),
        ),
      ),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 1.3 : 1.1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}
