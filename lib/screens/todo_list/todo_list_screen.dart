import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final backgroundColor = Colors.indigo[900];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
        body: Center(
            child: Text(
                "home",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),
            ),
        ),
    );
  }
}
