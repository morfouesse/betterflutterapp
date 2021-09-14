import 'package:betterflutterapp/screens/fragment/bottom_app_bar.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final backgroundColor = Colors.indigo[900];
  final textWhiteColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    //base de l'appli scaffold
    return Scaffold(
      ///////APP BAR///////////
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text('FlutterApp'),
        elevation: 0,
      ),
      ///////////////HOME//////////
      backgroundColor: backgroundColor,
      body: Container(

        child: Text('lorem',
            style: TextStyle(color: textWhiteColor)
        ),
      ),
      ///////////BOTTOM APP BAR/////////////
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}
