import 'package:flutter/material.dart';

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Colors.indigo[900];
    return BottomAppBar(
      color: backgroundColor,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(icon: Icon(Icons.add_circle_rounded,
            color: Colors.blueGrey[50],),
            onPressed: () {},),
          IconButton(icon: Icon(Icons.article,
            color: Colors.blueGrey[50],),
            onPressed: () {
            },),
          IconButton(icon: Icon(Icons.person,
            color: Colors.blueGrey[50],),
            onPressed: () {},),
        ],
      ),
    );
  }
}
