import 'package:flutter/cupertino.dart';

class CustomGridview extends StatelessWidget {
  Axis scrollDirection;
  int itemCount;
  int crossAxisCount;
  List<Widget> widgetsList;

  CustomGridview(
      {required this.scrollDirection,
      required this.widgetsList,
      required this.crossAxisCount,
      required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: scrollDirection,
        itemCount: itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.8),
        itemBuilder: (context, index) {
          return widgetsList[index];
        });
  }
}
