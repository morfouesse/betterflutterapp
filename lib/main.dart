import 'package:betterflutterapp/screens/bottom_app_bar.dart';
import 'package:betterflutterapp/screens/todo_list.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}
///
/// app to do list
///
/// inscripiton lors de la premiere utilisation de l'appli
///
///
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final backgroundColor = Colors.indigo[900];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///////////////HOME//////////
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: Text('FlutterApp'),
          elevation: 0,
        ),
        /////////BODY///////////
      body: TodoList(),
        ///////////BOTTOM APP BAR/////////////
        bottomNavigationBar: MyBottomAppBar(),
      ),
    );
  }
}
